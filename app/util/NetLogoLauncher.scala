package util

import play.Play
import play.jobs.Job

import java.io.{InputStreamReader, BufferedReader, PrintStream, File}

import collection.JavaConversions._

import org.apache.tools.ant.{BuildException, DemuxOutputStream, DefaultLogger, Project}
import org.apache.tools.ant.taskdefs.Java
import org.apache.tools.ant.types.{FileSet, Path}

import models.NetLogoModel
import java.lang.IllegalStateException
import collection.mutable

class ActivityLaunchJob(val activity: NetLogoModel) extends Job {
    override def doJob() {
        activity.launch()
    }
}

object NetLogoLauncher {
    
    def launch(activity: NetLogoModel) {
    
        //println("** Launching model **");
        activity.status = NetLogoStatus.Loading.Initializing()
        
        val project: Project = new Project
        project.setBaseDir( new File(Play.configuration.getProperty("netlogo.RunHeadless.path")) )
        project.init()
        
        val logger: DefaultLogger = new DefaultLogger
        project.addBuildListener(logger)
        logger.setOutputPrintStream(System.out)
        logger.setErrorPrintStream(System.err)
        logger.setMessageOutputLevel(Project.MSG_INFO)
        System.setOut(new PrintStream(new DemuxOutputStream(project, false)))
        System.setErr(new PrintStream(new DemuxOutputStream(project, true)))
        
        val errorMessageBuilder = new StringBuilder()
        
        project.fireBuildStarted()
        var caught: Throwable = null

        activity.status = NetLogoStatus.Loading.BuildingLauncher()
        
        try {
            val javaTask = new Java
            javaTask.setTaskName("headless")
            javaTask.setProject(project)
            javaTask.setFork(true)
            javaTask.setFailonerror(true)
            javaTask.setMaxmemory("1024M")
            javaTask.setDir( new File(Play.configuration.getProperty("netlogo.path")) )
            javaTask.setClassname("headless")
            
            javaTask.createArg().setValue(activity.scenario)
            javaTask.createArg().setValue(activity.length)
            javaTask.createArg().setValue(activity.yearstart)
            javaTask.createArg().setValue(activity.file.getAbsolutePath)
            javaTask.createArg().setValue(activity.areaname)
            javaTask.createArg().setValue(activity.resolution)
            javaTask.createArg().setValue(activity.sessionID)
        
            javaTask.setClasspath(NetLogoLauncher.buildClassPath(project))  
            javaTask.init()
            activity.status = NetLogoStatus.Loading.Launching()

            val pb = new ProcessBuilder(asJavaList(javaTask.getCommandLine.getCommandline))
            pb.redirectErrorStream(true)
            activity.proc = pb.start()
            
            val reader = new BufferedReader(new InputStreamReader(activity.proc.getInputStream))
            var line:String = null
            var currentlyReadingErrorMessage = false
        
            while({line = reader.readLine; line != null}) {
                if (currentlyReadingErrorMessage) {
                    errorMessageBuilder.append("\t" + line + "\n")
                }
                
                if (line.contains("TASK:")) {            // This has to appear in RunHeadless output first...
                    println(line.split(":").last)
                    activity.status = NetLogoStatus.Running(line)
                }
                else if (line.contains("DONE:")) {
                    println(line.split(":").last)
                    activity.status = NetLogoStatus.Finished(line)
                }
                else if (line.contains("** Error")) {
                    currentlyReadingErrorMessage = true
                    errorMessageBuilder.append(line + "\n")
                    activity.status = NetLogoStatus.Error.LaunchFailure("ERROR:" + activity.sessionID + "Simulation Error")
                }
            }
            reader.close()
        }
        catch {
            case e: BuildException => {
                caught = e
                println("** Error: RunHeadless failed to build.")
                activity.status = NetLogoStatus.Error.LaunchFailure("The launcher failed to build: " + caught.getMessage)
            }
        }

        project.fireBuildFinished(caught)
        try {
            activity.proc.exitValue match {
                case 0 =>
                    println("DONE:" + activity.sessionID + ":Simulation_Successful")
                    activity.status = NetLogoStatus.Finished("DONE:" + activity.sessionID + ":Simulation_Finished")
                case 102 =>
                    println("** File not found: " + activity.file.getAbsolutePath)
                    activity.status = NetLogoStatus.Error.FileNotFound(activity.file.getAbsolutePath)
                case 103 =>
                    println("** Model error: " + errorMessageBuilder.toString())
                    activity.status = NetLogoStatus.Error.ModelError(errorMessageBuilder.toString())
                case exit: Int =>
                    println("** Error: RunHeadless returned " + exit)
                    activity.status = NetLogoStatus.Error.LaunchFailure("The launcher failed with code " + exit)
            }
        } catch {
            case e:IllegalThreadStateException =>
                // This generally shouldn't happen, but if it does, we should probably assume the activity failed
                // to launch.
                println("** Warning: RunHeadless output stream is closed, but process is still not finished.")
                println("** An error may have occurred, but we can't know about it.")
                activity.status = NetLogoStatus.Error.LaunchFailure("An unknown error occurred while launching the activity.")
            case e:Exception =>
                activity.status = NetLogoStatus.Error.LaunchFailure("The launcher failed with error: " + e.getMessage)
                println("** Error: Exception occurred while executing RunHeadless:")
                e.printStackTrace()
        }

    }
    
    val netlogoPath = new File(Play.configuration.getProperty("netlogo.path")).getAbsolutePath
    val runHeadlessPath = new File(Play.configuration.getProperty("netlogo.RunHeadless.path")).getAbsolutePath
    
    def buildClassPath(project: Project): Path = {

        val netlogoJar = new File(Play.configuration.getProperty("netlogo.jar.path")).getAbsolutePath
        val netlogoLibDir = new File(Play.configuration.getProperty("netlogo.lib.path")).getAbsolutePath
        val appLibDir = new File(Play.configuration.getProperty("app.lib.path")).getAbsolutePath
        
        val path= new Path(project);
        
        // Add directory containing the compiled RunHeadless.class file to the classpath
        path.add(new Path(project, runHeadlessPath))
        
        // Add NetLogo.jar to the classpath
        path.add(new Path(project, netlogoJar))
        
        // Add NetLogo's dependencies to the classpath (asm-3.3.1.jar, gluegen-rt-1.1.1.jar, picocontainer-2.11.1.jar, etc...)
        val netlogoLibs = new FileSet()
        netlogoLibs.setDir(new File(netlogoLibDir))
        netlogoLibs.setIncludes("**/*.jar")
        path.addFileset(netlogoLibs)
        
        val appLibs = new FileSet()
        appLibs.setDir(new File(appLibDir))
        appLibs.setIncludes("**/*.jar")
        path.addFileset(appLibs)
        
        // Return the constructed classpath
        path
    }

}