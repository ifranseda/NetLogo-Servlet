package controllers

import play._
import play.mvc._
import play.mvc.results._
import play.data.validation._

import scala.io._
import java.io._
import java.security.MessageDigest
import java.util.Date
import _root_.util._

import models.NetLogoModel

object Application extends Controller {
	
	import views.Application._
	
	val modelsDir = new File(Play.configuration.getProperty("netlogo.models.path"))

    def md5(s: String) = {
        MessageDigest.getInstance("MD5").digest(s.getBytes)
    }

	def index = {
        html.setup("Simulation setup")
	}
	
	def setup_local = {
        html.setup("Simulation setup")
	}
	
	def simulate_local = {
        val yearstart  = params.get("tahunAwal")
        val simlength  = params.get("lamaSimulasi")
        val scenario   = params.get("skenario")
        val areaname   = params.get("areaname")
        val resolution = params.get("resolusi")

        Validation.required("yearstart", yearstart)
        Validation.required("simlength", simlength)
        Validation.required("scenario", scenario)

        if (Validation.hasErrors) {
            html.setup("Error: Simulation setup")
        } else {        
            val outputDir = "test";//String.valueOf((new java.util.Date()).getTime)
            session.put("simid", outputDir)
            
            val modelPath = Play.configuration.getProperty("netlogo.models.name")
            run(simlength, yearstart, scenario, areaname, resolution, outputDir)
        }
	}
	
	def run_local(len: String, year: String, scenario: String, areaname: String, resolution: String, outputDir: String) = {
        val model = Play.configuration.getProperty("netlogo.models.name")
        val file = new File(modelsDir, model)
	  
        val activity = new NetLogoModel(file, len, year, scenario, areaname, resolution, outputDir)
        activity.launchAsync()
        html.run(activity)
	}
	
	def setup (sessionID: String, areah1: String, areah2: String, areah3: String, areah4: String) = {

        val demandPath = Play.configuration.getProperty("netlogo.input.path") + "/demand/" + sessionID
        val path_hasCreated = (new File(demandPath)).mkdir();
        
        if (path_hasCreated) {
        	println("Folder " + demandPath + " has been created")
        }
        else {
        	println("Error creating folder")
        }
        
		val h1 = new FileWriter(demandPath + "/areah1.txt")
		h1.write("" + areah1.replaceAll(",", "\n"))
		h1.close()
        
		val h2 = new FileWriter(demandPath + "/areah2.txt")
		h2.write("" + areah2.replaceAll(",", "\n"))
		h2.close()
        
		val h3 = new FileWriter(demandPath + "/areah3.txt")
		h3.write("" + areah3.replaceAll(",", "\n"))
		h3.close()
        
		val h4 = new FileWriter(demandPath + "/areah4.txt")
		h4.write("" + areah4.replaceAll(",", "\n"))
		h4.close()
		
		new RenderJson("simulate_JsonpCallback({\"sessionID\":" + sessionID + "})")
	}
	
	def simulate = {
       
        val yearstart = params.get("tahunAwal")
        val simlength = params.get("lamaSimulasi")
        val scenario = params.get("skenario")
        val areaname = params.get("areaname")
        val resolution = params.get("resolusi")
        val outputDir = String.valueOf((new java.util.Date()).getTime)

        Validation.required("yearstart", yearstart)
        Validation.required("simlength", simlength)
        Validation.required("scenario", scenario)

        if (Validation.hasErrors) {
            new RenderJson("{\"error\" : {\"id\": 100, \"message\": \"Parameter error\"}}")
        } else {        
            val modelPath = Play.configuration.getProperty("netlogo.models.name")
            run(simlength, yearstart, scenario, areaname, resolution, outputDir)
        }
	}
	
	def run(len: String, year: String, scenario: String, areaname: String, resolution: String, outputDir: String) = {

        session.put("simid", outputDir)
        
        val model = Play.configuration.getProperty("netlogo.models.name")
        val file = new File(modelsDir, model)
        
        val activity = new NetLogoModel(file, len, year, scenario, areaname, resolution, outputDir)
        activity.launchAsync()

        new RenderJson("run_JsonpCallback({\"activity\":{\"id\":\"" + activity.id + "\", \"sessionID\":\"" + activity.sessionID + "\"}})")

	}
	
    /**
    * (JSON action) Waits until the activity finishes loading, then returns its status encoded in JSON.
    */
    def waitToLoad(id: Int) = {
        if (NetLogoManager.activities.contains(id)) {
            NetLogoManager.activities(id).waitUntilLoaded()
            status(id)
        }
        else {
            new RenderJson(NetLogoStatus.Error.InvalidActivity().toJson)
        }
    }
    
    def sessionstatus = {
        val sessionID = session.get("simid")
        val id = NetLogoManager.getActivityID(sessionID)
        status(id)
    }
    
	def status(sid: Int) = {
        if (NetLogoManager.activities.contains(sid)) {
            new RenderJson("status_JsonpCallback(" + NetLogoManager.activities(sid).status.toJson + ")")
        }
        else {
            new RenderJson("status_JsonpCallback(" + NetLogoStatus.Error.InvalidActivity().toJson + ")")
        }
	}
	
	def landcoverchart = {
	    val str = scala.io.Source.fromFile(Play.configuration.getProperty("netlogo.output.path") + "/"+ session.get("simid") + "/changearea.json").mkString
	    new RenderJson("chart_JsonpCallback(" + """\s+""".r.replaceAllIn(str, "") + ")")
	}
	
	def graph = {
	    html.graph("test")
	}
	
}
