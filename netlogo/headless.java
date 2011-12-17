/**
	*	author: Isnan Franseda
	* 	twitter: http://twitter.com/ifranseda
*/

import java.io.*;
import java.util.*;
import org.nlogo.headless.HeadlessWorkspace;

import org.apache.tools.ant.*;
import org.apache.tools.ant.taskdefs.Java;
import org.apache.tools.ant.types.*;

public class headless {

    public static int simlen = 1;
    private static String scenario;
    private static int length;
    private static int yearstart;
    private static String filename;
    private static String areaname;
    private static int resolution;
    private static String outputDir;

    private static String path;

    static {
        System.setProperty("java.awt.headless", "true");
//      System.out.println(java.awt.GraphicsEnvironment.isHeadless());
    }
    
    public static void main(String[] argv) {
    
		if (argv.length < 6) {
			System.out.println("\nError occured!\nUsage: java [java args] -classpath [classpath] headless.java scenario length year filename areaname resolution outputDir\n");
			System.exit(0);
		}
    
		scenario = argv[0];
		length = Integer.parseInt(argv[1]);
		yearstart = Integer.parseInt(argv[2]);
		filename = argv[3];
		areaname = argv[4];
		resolution = Integer.parseInt(argv[5]);
		outputDir = argv[6];
		
		path = filename.replaceAll("^(.+)/.+.nlogo$", "$1");
		String _file = path + "/data/output/" + outputDir;
		File file = new File(_file);
		if (!file.exists()) {
			boolean dirCreated = (new File(_file)).mkdir();
			System.out.println("NOTE:Output directory created");
		}
	
		if (length > 1) simlen = length;
		
		HeadlessWorkspace workspace = HeadlessWorkspace.newInstance() ;
		try {
			System.out.println("TASK:" + outputDir + ":Preparing_NetLogo_model");
			workspace.open(filename);
			System.out.println("NOTE:Setting up NetLogo model");
	
			System.out.println("NOTE:Model name: " + filename);
			System.out.println("NOTE:Scenario: " + scenario);
			System.out.println("NOTE:Area: " + areaname);
			System.out.println("NOTE:Map resolution: " + resolution);
			
			System.out.println("NOTE:Simulation length: " + simlen);
			System.out.println("NOTE:Prepare to running model...");
			System.out.println("NOTE:Please wait this my take several minutes");
	
			workspace.command("setup \"" + scenario + "\" \"" + areaname + "\" \"" + resolution + "\" " + yearstart + " \"" + outputDir + "\"");
	
			System.out.println("TASK:" + outputDir + ":Simulation_Started");
	
			for (int i=0;i<(simlen+1);i++) {
				System.out.print("NOTE:Simulation year " + i + " ");
				workspace.command("simulate") ;
				System.out.print("done.\n");
				System.out.println("TASK:" + outputDir + ":Simulation_DONE:Year" + i);
			}
			
			workspace.command("report-change-area");
			System.out.println("TASK:" + outputDir + ":Land_Cover_Change_Generated");
			
			workspace.dispose();
			
			registerMapToArcGIS(path);
			
			Thread.sleep(10000);
			System.out.println("DONE:" + outputDir + ":Simulation_Finished");
		}
		catch(Exception ex) {
			System.out.println("** Error");
			ex.printStackTrace();
			System.exit(0);
		}
		
	 }
	 
	 public static void registerMapToArcGIS (String pathToNlogo) {
	 	
        Throwable caught = null;

		Project project = new Project();
		project.setBaseDir( new File(pathToNlogo) );
		project.init();

		DefaultLogger logger = new DefaultLogger();
		project.addBuildListener(logger);
		logger.setOutputPrintStream(System.out);
		logger.setErrorPrintStream(System.err);
		logger.setMessageOutputLevel(Project.MSG_INFO);
		System.setOut(new PrintStream(new DemuxOutputStream(project, false)));
		System.setErr(new PrintStream(new DemuxOutputStream(project, true)));
		
		StringBuilder errorMessageBuilder = new StringBuilder();

		System.out.println("TASK:Registering output map to ArcGIS Service");
		project.fireBuildStarted();
        
		try {
			
			Java javaTask = new Java();
			javaTask.setTaskName("ArcGISServiceRegister");
			javaTask.setProject(project);
			javaTask.setFork(true);
			javaTask.setFailonerror(true);
			
			javaTask.setDir( new File(pathToNlogo) );
			javaTask.setClassname("ArcGISServiceRegister");
			
			javaTask.createArg().setValue(outputDir);
			javaTask.createArg().setValue(scenario);
			javaTask.createArg().setValue(areaname);
			javaTask.createArg().setValue(String.valueOf(resolution));
			javaTask.createArg().setValue(String.valueOf(yearstart));
			javaTask.createArg().setValue(String.valueOf(simlen));
			
			String strMachineName = "192.168.1.5";
			javaTask.createArg().setValue(strMachineName);
			String strDomainName = "192.168.1.5";
			javaTask.createArg().setValue(strDomainName);
			String strUsername = "username";
			javaTask.createArg().setValue(strUsername);
			String strPassword = "password";
			javaTask.createArg().setValue(strPassword);
	
			String hostName = "192.168.1.5";
			javaTask.createArg().setValue(hostName);
			String instanceName = "instance";
			javaTask.createArg().setValue(instanceName);
			String databaseName = "RDPCENTER";
			javaTask.createArg().setValue(databaseName);
			String databaseUser = "rdpuser";
			javaTask.createArg().setValue(databaseUser);
			String databasePassword = "psswd";
			//javaTask.createArg().setValue(databasePassword);
		
			Path classpath = new Path(project);
			classpath.add(new Path(project, pathToNlogo));
			FileSet fset = new FileSet();
			fset.setDir(new File(path + "/lib"));
			fset.setIncludes("**/*");
			classpath.addFileset(fset);
			
			javaTask.setClasspath(classpath);
			javaTask.init();

            CommandlineJava cmd = javaTask.getCommandLine();
            ProcessBuilder pb = new ProcessBuilder(cmd.getCommandline());
            pb.redirectErrorStream(true);
            Process proc = pb.start();
            
            BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line = null;
            boolean currentlyReadingErrorMessage = false;
        
            while(line == reader.readLine() && line != null) {
				System.out.println(line + "\n");
				
                if (currentlyReadingErrorMessage) {
                    errorMessageBuilder.append("\t" + line + "\n");
                }

				if (line.contains("** Error")) {
                    currentlyReadingErrorMessage = true;
                    errorMessageBuilder.append(line + "\n");
                }
            }
            reader.close();
			
		}
		catch (Exception ex) {
			caught = ex;
			System.out.println("** Error");
			ex.printStackTrace();
			System.exit(0);
		}
		
		project.fireBuildFinished(caught);
	 }
	 
}