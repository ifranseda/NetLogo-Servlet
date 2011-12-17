package util

abstract class NetLogoStatus(description: String) {
    override def toString = description
    def toJson = "{\"status\": \"" + description + "\"}"
}

object NetLogoStatus {

    /***** NotStarted *****/
    case object NotStarted extends NetLogoStatus("Not started")


    /***** Loading *****/
    abstract class Loading(subtask: String) extends NetLogoStatus("Loading") {
        override def toString = "Loading.. (" + subtask + ")"
        override def toJson = "{\"status\": \"Loading\"," +
                                "\"task\": \"" + subtask + "\"}"
    }
    
    object Loading {
        case class Initializing extends Loading("Initializing")
        case class BuildingLauncher extends Loading("Building launcher")
        case class Launching extends Loading("Launching")
    }


    /***** Running *****/
    case class Running(message: String) extends NetLogoStatus("Running") {
        override def toString = "Running"
        override def toJson =   " { \"status\": \"Running\"," +
                                " \"message\": \"" + message + "\"}"
    }


    /***** Error *****/
    abstract class Error(message: String) extends NetLogoStatus("Error") {
        override def toString = "Error: " + message
        override def toJson =   "{\"status\": \"Error\"," +
                                "\"message\": \"" + org.json.simple.JSONObject.escape(message) + "\"}"
    }

    object Error {
        case class ModelError(message: String) extends Error(message)
        case class LaunchFailure(message: String) extends Error(message)
        case class FileNotFound(filename: String) extends Error("The model file could not be found: " + filename)
        case class InvalidActivity() extends Error("Invalid activity.")
    }


    /***** Finished *****/
    case class Finished(message: String) extends NetLogoStatus("Finished") {
        override def toString = "Finished"
        override def toJson =   " { \"status\": \"Finished\"," +
                                " \"message\": \"" + message + "\"}"
    }
}