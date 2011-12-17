package util

import collection.mutable
import models.NetLogoModel

object NetLogoManager {

    /** The global list of all registered activities (accessible by their ID). */
    val activities = mutable.Map.empty[Int, NetLogoModel]
    private var idCounter = 0

    /** Gets the activity owned by the session ID. */
    def getActivityID(sessid: String): Int = {
        val out = activities.values.filter(activity => activity.session == sessid).toList
        if (out.length > 0) out(0).id
        else 0
    }

    /**
    * Adds the given activity to the global activities list and assigns it an ID
    * that could be used to manage it. Returns the ID.
    *
    * Currently, this method is called from the Activity class constructor (and
    * shouldn't be called from elsewhere).
    */
    def registerNewActivity(activity: NetLogoModel): Int = {
        idCounter += 1
        val id = idCounter
        activities(id) = activity
        id
    }
}