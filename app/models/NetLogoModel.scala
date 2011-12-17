package models

import java.io.File

import collection.mutable
import concurrent.MailBox
import collection.JavaConversions._

import util.{NetLogoLauncher, NetLogoStatus, NetLogoManager}
import play.jobs.Job
 
class NetLogoModel(
        val file: File,
        val length: String,
        val yearstart: String,
        val scenario: String,
        val areaname: String,
        val resolution: String,
        val sessionID: String) {
  
    def id = _id
    private val _id = NetLogoManager.registerNewActivity(this)
    
    def session = sessionID

    def name = file.getName.replace(".nlogo", "")
    var proc: java.lang.Process = null

    def status = _status
    private var _status: NetLogoStatus = NetLogoStatus.NotStarted
    def status_= (value: NetLogoStatus) = {
        if (value != _status) {
            _status = value
            statusListeners.foreach(_ send value)
        }
    }
    
    // Anyone who needs to be notified of changes to the activity state
    // can add themselves to this list.
    val statusListeners = mutable.ListBuffer.empty[MailBox]
    
    def launch() {
        NetLogoLauncher.launch(this)
    }

    def launchAsync() {
        // Play Framework job for launching a new activity. This can be used to avoid blocking a
        // request while launching the activity (which can take a couple seconds).  See the Play
        // Framework documentation on Asynchronous Jobs.
        class ActivityLaunchJob(val activity: NetLogoModel) extends Job {
            override def doJob() {
                activity.launch()
            }
        }
        new ActivityLaunchJob(this).now()
    }

    /**
    * Blocks until the activity is loaded (or until there is an error).  This does NOT cause the activity
    * to actually load - for that, use the launch() or the launchAsync() methods.
    */
    def waitUntilLoaded() {
        // Listen for changes in activity status until we see that it's either running or
        // there's an error.
        val listener = new MailBox()
        statusListeners.add(listener)
        var newStatus = status
        // TODO: Pattern matching would be nice here, but I ran into an issue similar to this:
        // http://stackoverflow.com/questions/5765311/pattern-matching-on-nested-types-in-scala
        // But using sealed traits means having to duplicate what I've defined in the abstract
        // class NetLogoStatus into all its subclasses.
        // I'm sure there's a cleaner way to do what I'm doing here, I just haven't found it yet.
        while (!(newStatus.isInstanceOf[NetLogoStatus.Running] || newStatus.isInstanceOf[NetLogoStatus.Error])) {
            newStatus = listener receive {
                case state: NetLogoStatus => state
            }
        }
        statusListeners.remove(listener)
    }
    
    /**
    * Stops the activity from running by killing the process. This also unregisters the activity from
    * the global activities list.
    */
    def stop() {
        if (proc != null) proc.destroy()
    }
}

