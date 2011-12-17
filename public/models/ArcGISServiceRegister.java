/**
	*	author: Isnan Franseda
	* 	twitter: http://twitter.com/ifranseda
*/

import java.util.Date;
import java.io.*;

import com.esri.arcgis.carto.*;
import com.esri.arcgis.datasourcesGDB.*;
import com.esri.arcgis.datasourcesraster.*;
import com.esri.arcgis.display.IColor;
import com.esri.arcgis.display.ISimpleFillSymbol;
import com.esri.arcgis.display.ISymbol;
import com.esri.arcgis.display.RgbColor;
import com.esri.arcgis.display.SimpleFillSymbol;
import com.esri.arcgis.geodatabase.*;
import com.esri.arcgis.geometry.*;
import com.esri.arcgis.server.*;
import com.esri.arcgis.system.*;

import lib.GISClass;

public class ArcGISServiceRegister {

	private static String strMachineName;
	private static String strDomainName;
	private static String strUsername;
	private static String strPassword;
	
	private static String hostName;
	private static String instanceName;
	private static String databaseName;
	private static String databaseUser;
	private static String databasePassword;
	
	private static String sessionID;
	private static int startingYear;
	private static String areaname;
	private static String resolution;
	private static String scenario;
	private static int simulationLength;
	
	private static String MXDName;
	private static String rasterCatalogName;
	private static String serverMachineName;
	private static String serviceName;
	private static String pathMXD;
	private static String outputDir;
	private static String rasterDir;
	
	public static void main(String[] args) {

		try
		{
			
			if (args.length < 15) {
				System.out.println("Command takes 14 arguments.");
				System.out.println("Usage:");
				System.out.println("java [classpath] ArcGISServiceRegister sessionID scenario areaname resolution startingYear simulationLength strMachineName strDomainName strUsername strPassword hostName instanceName databaseName databaseUser databasePassword");
				System.exit(0);
			}

            sessionID = args[0];
            scenario = args[1];
            areaname = args[2];
            resolution = args[3];
            startingYear = Integer.parseInt(args[4]);
			simulationLength = Integer.parseInt(args[5]);
            
			strMachineName = args[6];
			strDomainName = args[7];
			strUsername = args[8];
			strPassword = args[9];

	        hostName = args[10];
	        instanceName = args[11];
	        databaseName = args[12];
	        databaseUser = args[13];
	        databasePassword = args[14];

            File dir = new File(".");
            String appDir = dir.getCanonicalPath();

            MXDName = areaname + ".mxd";
			rasterCatalogName = "RasterCatalog_" + sessionID + "-"  + areaname;
	        serviceName = "Service_" + sessionID + "-" + areaname + "_" + scenario + "_" + resolution;

	        pathMXD = appDir + "\\bin\\mxds\\" + sessionID + "\\" + MXDName;
	        outputDir = "e:\\arcgisserver\\arcgisoutput\\" + sessionID + "\\";
	        rasterDir = appDir + "\\bin\\asc\\" + sessionID + "\\";


			ArcGISServiceRegister registar = new ArcGISServiceRegister();
			registar.execute();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	public IServerContext getServerContext()
	{
		IServerContext sc;
		try
		{
			new ServerInitializer().initializeServer(strDomainName, strUsername, strPassword);
			
			IServerConnection connection = new ServerConnection();
			connection.connect(strMachineName);
			IServerObjectManager som = connection.getServerObjectManager();
			sc = som.createServerContext("", "");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			sc = null;
		}
		
		return sc;
	}
	
	public IServerObjectAdmin getServerObjectAdmin()
	{
		IServerObjectAdmin soa;
		try
		{
			new ServerInitializer().initializeServer(strDomainName, strUsername, strPassword);
			
			IServerConnection connection = new ServerConnection();
			connection.connect(strMachineName);
			soa = connection.getServerObjectAdmin();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			soa = null;
		}
		
		return soa;
	}
	
	public void Layout()
    {
		IRasterCatalog rc;

        try
        {
        	IServerContext sc = getServerContext();

            IWorkspaceFactory wsf = (SdeWorkspaceFactory)sc.createObject(SdeWorkspaceFactory.getClsid());
            IPropertySet connString = (PropertySet)sc.createObject(PropertySet.getClsid());

            connString.setProperty("SERVER", hostName);
            connString.setProperty("INSTANCE", instanceName);
            connString.setProperty("DATABASE", databaseName);
            connString.setProperty("USER", databaseUser);
            connString.setProperty("PASSWORD", databasePassword);
            connString.setProperty("VERSION", "SDE.DEFAULT");

            IRasterWorkspaceEx workspace = (IRasterWorkspaceEx)wsf.open(connString, 0);
            
            rc = workspace.openRasterCatalog(rasterCatalogName);
            
            RasterCatalog rasterCatalog = new RasterCatalog(rc);
            
            System.out.println(rc.getRasterFieldName());
            
            File dir = new File(".");
            String appDir = dir.getCanonicalPath();
            MXDName = appDir + "\\bin\\Mxds\\" + sessionID + "\\" + MXDName;
            
            IMapDocument mapDoc = (IMapDocument)sc.createObject(MapDocument.getClsid());
            mapDoc.esri_new(MXDName);
            
            IMap map = mapDoc.getActiveView().getFocusMap();
            if (map.getLayerCount() > 0) map.clearLayers();
            
            IFeatureClass featureClass = (IFeatureClass)rasterCatalog;
            IRasterCatalogItem rasterCatalogItem;
            IRasterDataset rd;

            int iterasi = 1;
            if (simulationLength > rasterCatalog.rowCount(null))
            	iterasi = rasterCatalog.rowCount(null);
            else
            	iterasi = simulationLength;

            for(int i = 1;i <= iterasi;i++)
            {
            	rasterCatalogItem = (IRasterCatalogItem)featureClass.getFeature(i);
            	rd = rasterCatalogItem.getRasterDataset();
            	IRasterRenderer renderer = createUVRenderer(sc, rd);
            	addRasterLayer(sc, mapDoc.getActiveView(), rd, renderer, i-1);
            }
            
            mapDoc.getActiveView().getFocusMap().setName("RDP");
            mapDoc.save(true, true);
            mapDoc.close();
            map = null;

            sc.releaseContext();
        }
        catch (Exception ex)
        {
        	ex.printStackTrace();
        }
    }
	
	public IRasterRenderer createUVRenderer(IServerContext sc, IRasterDataset rasterDataset)
    {
        IRasterRenderer result = null;
        IColor warna;
        ISimpleFillSymbol simbol1, simbol2, simbol3, simbol4, simbol5, simbol6, simbol7, simbol8, simbol9;
        try
        {
        	Raster raster = new Raster(rasterDataset.createDefaultRaster());
        	
            ITable tabelRaster = raster.getAttributeTable();

            if (tabelRaster == null)
            {
            	return null;
            }

            int numValue = tabelRaster.rowCount(null);
            int idxField = tabelRaster.findField("Value");

            if (numValue == 0) return null;

            //Buat unique value renderer.
            IRasterUniqueValueRenderer uvRenderer = (RasterUniqueValueRenderer)sc.createObject(RasterUniqueValueRenderer.getClsid());
            IRasterRenderer rasterRenderer = (IRasterRenderer)uvRenderer;
            rasterRenderer.setRasterByRef(rasterDataset.createDefaultRaster());
            rasterRenderer.update();

            //Set properties renderer
            uvRenderer.setHeadingCount(1);
            uvRenderer.setHeading(0, "");
            uvRenderer.setClassCount(0, numValue);
            uvRenderer.setField("Value");

            //Kasih Warna dan Nama
            IRow baris;
            Object NilaiLabel;
            for (int i = 0; i < numValue; i++)
            {
                baris = tabelRaster.getRow(i+1);
                NilaiLabel = baris.getValue(idxField);
                uvRenderer.addValue(0, i, NilaiLabel);

                switch (Integer.parseInt(NilaiLabel.toString()))
                {
                    case 0:
                        warna = (RgbColor)sc.createObject(RgbColor.getClsid());
                        warna.setRGB(Integer.parseInt("004000", 16));
                        simbol1 = (SimpleFillSymbol)sc.createObject(SimpleFillSymbol.getClsid());
                        simbol1.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol1);
                        uvRenderer.setLabel(0, i, "Hutan Primer");
                        break;
                    case 1:
                        warna = (RgbColor)sc.createObject(RgbColor.getClsid());
                        warna.setRGB(Integer.parseInt("00C000", 16));
                        simbol2 = (SimpleFillSymbol)sc.createObject(SimpleFillSymbol.getClsid());
                        simbol2.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol2);
                        uvRenderer.setLabel(0, i, "Hutan Sekunder");
                        break;
                    case 2:
                        warna = (RgbColor)sc.createObject(RgbColor.getClsid());
                        warna.setRGB(Integer.parseInt("80FF80", 16));
                        simbol3 = (SimpleFillSymbol)sc.createObject(SimpleFillSymbol.getClsid());
                        simbol3.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol3);
                        uvRenderer.setLabel(0, i, "Semak Belukar");
                        break;
                    case 3:
                        warna = (RgbColor)sc.createObject(RgbColor.getClsid());
                        warna.setRGB(Integer.parseInt("00FFFF", 16));
                        simbol4 = (SimpleFillSymbol)sc.createObject(SimpleFillSymbol.getClsid());
                        simbol4.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol4);
                        uvRenderer.setLabel(0, i, "Perkebunan");
                        break;
                    case 4:
                        warna = (RgbColor)sc.createObject(RgbColor.getClsid());
                        warna.setRGB(Integer.parseInt("80C0FF", 16));
                        simbol5 = (SimpleFillSymbol)sc.createObject(SimpleFillSymbol.getClsid());
                        simbol5.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol5);
                        uvRenderer.setLabel(0, i, "Pemukiman");
                        break;
                    case 5:
                        warna = (RgbColor)sc.createObject(RgbColor.getClsid());
                        warna.setRGB(Integer.parseInt("0000FF", 16));
                        simbol6 = (SimpleFillSymbol)sc.createObject(SimpleFillSymbol.getClsid());
                        simbol6.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol6);
                        uvRenderer.setLabel(0, i, "Pertambangan");
                        break;
                    case 6:
                        warna = (RgbColor)sc.createObject(RgbColor.getClsid());
                        warna.setRGB(Integer.parseInt("800080", 16));
                        simbol7 = (SimpleFillSymbol)sc.createObject(SimpleFillSymbol.getClsid());
                        simbol7.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol7);
                        uvRenderer.setLabel(0, i, "Pertanian Lahan Kering");
                        break;
                    case 7:
                        warna = (RgbColor)sc.createObject(RgbColor.getClsid());
                        warna.setRGB(Integer.parseInt("FF80C0", 16));
                        simbol8 = (SimpleFillSymbol)sc.createObject(SimpleFillSymbol.getClsid());
                        simbol8.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol8);
                        uvRenderer.setLabel(0, i, "Persawahan");
                        break;
                    case 8:
                        warna = (RgbColor)sc.createObject(RgbColor.getClsid());
                        warna.setRGB(Integer.parseInt("FF8000", 16));
                        simbol9 = (SimpleFillSymbol)sc.createObject(SimpleFillSymbol.getClsid());
                        simbol9.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol9);
                        uvRenderer.setLabel(0, i, "Badan Air");
                        break;
                    default:
                        break;
                }
            }

            rasterRenderer.update();
            result = rasterRenderer;
            return result;
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return result;
        }
    }
	
	public void addRasterLayer(IServerContext sc, IActiveView activeView, IRasterDataset rasterDataset, IRasterRenderer rasterRenderer, int yearIndex)
    {
    	try
    	{
	        IRasterLayer rasterLayer = (RasterLayer)sc.createObject(RasterLayer.getClsid());
	        rasterLayer.createFromDataset(rasterDataset);

	        if (rasterRenderer != null)
	        {
	            rasterLayer.setRendererByRef(rasterRenderer);
	        }
	        //Add it to a map if the layer is valid.
	        if (rasterLayer != null)
	        {
	            IMap map = activeView.getFocusMap();
	            map.addLayer((ILayer)rasterLayer);
	            map.getLayer(0).setName("Tahun " + String.valueOf((startingYear + yearIndex)) );
	        }
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    }
	
	public void copy (String fromFileName, String toFileName) throws IOException {
		File fromFile = new File(fromFileName);
		File toFile = new File(toFileName);

		FileInputStream from = null;
		FileOutputStream to = null;
		try
		{
			from = new FileInputStream(fromFile);
			to = new FileOutputStream(toFile);
			byte[] buffer = new byte[4096];
			int bytesRead;

			while ((bytesRead = from.read(buffer)) != -1)
				to.write(buffer, 0, bytesRead); // write
		}
		finally 
		{
			if (from != null)
				try 
				{
					from.close();
				}
				catch (IOException e) 
				{
					e.printStackTrace();
				}
			if (to != null)
			try 
			{
				to.close();
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
	}
		
	public IRasterDataset getRasterCatalogItem(IRasterCatalog rc, int oid)
    {
    	IRasterDataset raster;
        try
        {
	        IFeatureClass featureClass = (IFeatureClass)rc;
	        IRasterCatalogItem rasterCatalogItem = (IRasterCatalogItem)featureClass.getFeature(oid);
	        //int idx = featureClass.findField("Name");
	        raster = rasterCatalogItem.getRasterDataset();
        }
        catch(Exception ex)
        {
        	ex.printStackTrace();
        	raster = null;
        }
        return raster;
    }
	
	public Boolean publishMXD(IServerContext sc, String serverMachineName, String serviceName, String pathMXD, String outputDir)
    {
        Boolean ret = false;
        
        try
        {
        
	        // Initialize ESRI licenses
	        IAoInitialize aoInit = (AoInitialize)sc.createObject(AoInitialize.getClsid());
	        aoInit.initialize(esriLicenseProductCode.esriLicenseProductCodeArcServer);

	        int format = 9;
	
	        //define paths for the onlineresource property in the extension properties
	        String resource = "http://" + serverMachineName + "/ArcGIS/services/" + serviceName + "/MapServer/WMSServer";
	        String resourceKML = "http://" + serverMachineName + "/ArcGIS/services/" + serviceName + "/MapServer/KMLServer";
	        String resourceWCS = "http://" + serverMachineName + "/ArcGIS/services/" + serviceName + "/MapServer/WCSServer";
	        String resourceWFS = "http://" + serverMachineName + "/ArcGIS/services/" + serviceName + "/MapServer/WFSServer";
	
	        // create the new configuration
	        IServerObjectAdmin pServerObjectAdmin = getServerObjectAdmin();
	        IServerObjectConfiguration pConfiguration = pServerObjectAdmin.createConfiguration();
	        IServerObjectConfiguration2 pConfiguration2 = (IServerObjectConfiguration2)pConfiguration;
	        IServerObjectConfiguration3 pConfiguration3 = (IServerObjectConfiguration3)pConfiguration;
	
	        // set the   General Configuration Settings
	        pConfiguration.setName(serviceName);           //  the name of this configuration
	        pConfiguration.setTypeName("MapServer");   // the type of server object to be created
	        pConfiguration.setIsPooled(true);
	        pConfiguration.setMinInstances(1);
	        pConfiguration.setMaxInstances(2);
	        pConfiguration.setWaitTimeout(60);
	        pConfiguration.setUsageTimeout(600);
	        pConfiguration.setStartupType(esriStartupType.esriSTAutomatic);
	        pConfiguration.setIsolationLevel(esriServerIsolationLevel.esriServerIsolationHigh);
	
	        //  Set the configuration Properties of the MapServer Object
	        IPropertySet pProps = pConfiguration.getProperties();
	        pProps.setProperty("FilePath", pathMXD);    // required property
	        pProps.setProperty("OutputDir", outputDir);
	        String virtualOutDir = " http://" + serverMachineName + "/arcgisoutput";
	        pProps.setProperty("VirtualOutputDir", virtualOutDir);
	        pProps.setProperty("MaxImageHeight", "2048");
	        pProps.setProperty("MaxRecordCount", "500");
	        pProps.setProperty("MaxBufferCount", "100");
	        pProps.setProperty("MaxImageWidth", "2048");
	        pConfiguration.setPropertiesByRef(pProps);
	
	        //  Set the info segment of the MapServer Object  properties
	        IPropertySet info = pConfiguration2.getInfo();
	        info.setProperty("WebEnabled", "true");
	        //info.SetProperty("WebCapabilities", "Map,Query,Data");
	        pConfiguration2.setInfoByRef(info);
	
	        //  Set the recycle properties of the MapSrver object
	        IPropertySet pProp = pConfiguration.getRecycleProperties();
	        pProp.setProperty("StartTime", "1:00 AM");    //   start recycling at midnight
	        pProp.setProperty("Interval", "86400");      //  every 24 hours
	        pConfiguration.setRecyclePropertiesByRef(pProp);
	
	        Boolean enabled;
	        if (format == 1 || format == 15)
	        {   //Set WMS extension Properties
	            pConfiguration2.setExtensionEnabled("WmsServer", true);
	
	            IPropertySet pExtensionProps = pConfiguration2.getExtensionProperties("WmsServer");
	            pExtensionProps.setProperty("OnlineResource", resource);
	            pExtensionProps.setProperty("Name", "WMS");
	            pExtensionProps.setProperty("Title", serviceName);
	            // pConfiguration2.set_ExtensionProperties("WmsServer", pExtensionProps);
	
	            IPropertySet pProp2 = pConfiguration2.getExtensionInfo("WmsServer");
	            pProp2.setProperty("WebEnabled", "true");
	            pProp2.setProperty("WebCapabilities", "Map,Query,Data");
	            pConfiguration2.setExtensionInfoByRef("WmsServer", pProp2);
	        }
	
	        if (format == 2 || format == 15)
	        {    //  Set KML extension properties
	            pConfiguration2.setExtensionEnabled("KMLServer", true);
	
	            IPropertySet pPropKML = pConfiguration2.getExtensionInfo("KMLServer");
	            pPropKML.setProperty("WebEnabled", "true");
	            pPropKML.setProperty("WebCapabilities", "SingleImage,SeparateImages,Vectors");
	            pConfiguration2.setExtensionInfoByRef("KMLServer", pPropKML);
	
	            IPropertySet pExtensionPropKML = pConfiguration2.getExtensionProperties("KMLServer");
	            pExtensionPropKML.setProperty("ImageSize", "1024");
	            pExtensionPropKML.setProperty("FeatureLimit", "1000000");
	            pExtensionPropKML.setProperty("Dpi", "96");
	
	            pExtensionPropKML.setProperty("MinRefreshPeriod", "30");
	            pExtensionPropKML.setProperty("UseDefaultSnippets", "false");
	            //       pConfiguration2.set_ExtensionProperties("KMLServer", pExtensionPropKML);
	        }
	
	        if (format == 4 || format == 15)
	        {   //Set WCS extension Properties
	            pConfiguration2.setExtensionEnabled("WcsServer", true);
	
	            IPropertySet pExtensionPropsWCS = pConfiguration2.getExtensionProperties("WcsServer");
	            pExtensionPropsWCS.setProperty("OnlineResource", resourceWCS);
	            pExtensionPropsWCS.setProperty("Name", "WCS");
	            pExtensionPropsWCS.setProperty("Title", serviceName);
	            // pConfiguration2.set_ExtensionProperties("WcsServer", pExtensionPropsWCS);
	
	            IPropertySet pPropWCS = pConfiguration2.getExtensionInfo("WcsServer");
	            pPropWCS.setProperty("WebEnabled", "true");
	            pConfiguration2.setExtensionInfoByRef("WcsServer", pPropWCS);
	        }
	
	
	        if (format == 8 || format == 15)
	        {   //Set WFS Extension Properties
	            pConfiguration2.setExtensionEnabled("WfsServer", true);
	
	            IPropertySet pExtensionPropsWFS = pConfiguration2.getExtensionProperties("WfsServer");
	            pExtensionPropsWFS.setProperty("OnlineResource", resourceWFS);
	            pExtensionPropsWFS.setProperty("Name", "WFS");
	            pExtensionPropsWFS.setProperty("Title", serviceName);
	            pExtensionPropsWFS.setProperty("AppSchemaURI", resourceWFS);
	            pExtensionPropsWFS.setProperty("AppSchemaPrefix", serviceName);
	            //     pConfiguration2.set_ExtensionProperties("WfsServer", pExtensionPropsWFS);
	
	            IPropertySet pPropWFS = pConfiguration2.getExtensionInfo("WfsServer");
	            pPropWFS.setProperty("WebEnabled", "true");
	            pConfiguration2.setExtensionInfoByRef("WfsServer", pPropWFS);
	        }
	
	        //' add the configuration to  the server
	        pServerObjectAdmin.addConfiguration(pConfiguration2);
	        pServerObjectAdmin.startConfiguration(serviceName, "MapServer");
	        ret = true;
        }
        catch(Exception ex)
        {
        	ex.printStackTrace();
        	ret = false;
        }

        return ret;
    }
	
	public Boolean loadToRasterCatalog(IServerContext sc, IWorkspace workspace, String rasterCatalogName, ISpatialReference rasterSpatialRef, ISpatialReference geoSpatialRef, String rasterDir)
    {
    	Boolean ret = false;
    	
    	try
    	{
    		// Buat Raster Catalog
    		Workspace ws = new Workspace(workspace);
    		
    		try
    		{
    			ws.deleteRasterCatalog(rasterCatalogName);
    		}
    		catch(Exception ex)
    		{
    			ex.printStackTrace();
    		}
    		
    		RasterWorkspaceFactory inputRasterWorkspaceFactory = (RasterWorkspaceFactory)sc.createObject(RasterWorkspaceFactory.getClsid());

    		RasterWorkspace inputRasterWorkspace = new RasterWorkspace(
    				inputRasterWorkspaceFactory.openFromFile(rasterDir,0));
    		
    		IEnumDataset edataset = inputRasterWorkspace.getDatasets(esriDatasetType.esriDTRasterDataset);
    		
    		IDataset raster = edataset.next();
    		
    		IRasterDataset ds0 = new IRasterDatasetProxy(raster);
    		RasterDataset daset0 = new RasterDataset(ds0);

    		rasterSpatialRef.setDomain(daset0.getExtent().getXMin()  - 100
    				, daset0.getExtent().getXMax() + 100
    				, daset0.getExtent().getYMin() - 100
    				, daset0.getExtent().getYMax() + 100);
    		
    		geoSpatialRef.setDomain(daset0.getExtent().getXMin()  - 100
    				, daset0.getExtent().getXMax() + 100
    				, daset0.getExtent().getYMin() - 100
    				, daset0.getExtent().getYMax() + 100);

    		IFields filds = createFields(sc, true, rasterSpatialRef, geoSpatialRef);
    		RasterCatalog rasterCatalog = new RasterCatalog(
    				ws.createRasterCatalog(rasterCatalogName
    						, filds
    						, "shape"
    						, "raster"
    						, "defaults"));
    		
    		int rasterFieldIndex = rasterCatalog.getRasterFieldIndex();
    		FeatureClass fc = new FeatureClass(rasterCatalog);
    		FeatureCursor cursor = new FeatureCursor(fc.IFeatureClass_insert(false));
    		
    		int idx = 1;
    		
    		while(raster!=null)
    		{
    			IRasterDataset ds = new IRasterDatasetProxy(raster);
    			RasterDataset daset = new RasterDataset(ds);
    			
    			rasterSpatialRef.setDomain(daset0.getExtent().getXMin()
        				, daset0.getExtent().getXMax()
        				, daset0.getExtent().getYMin()
        				, daset0.getExtent().getYMax());
    			daset.alterSpatialReference(rasterSpatialRef);
    			
    		    System.out.print("Loading " + ds.getCompleteName() + "...");
    		    
    		    IFeatureBuffer featureBuffer = fc.createFeatureBuffer();

    		    // Buat Raster Value
    		    RasterStorageDef rasterStorageDef = (RasterStorageDef)sc.createObject(RasterStorageDef.getClsid());
    		    rasterStorageDef.setCompressionType(esriRasterSdeCompressionTypeEnum.esriRasterSdeCompressionTypeRunLength);
    		    rasterStorageDef.setPyramidResampleType(rstResamplingTypes.RSP_NearestNeighbor);
    		    rasterStorageDef.setPyramidLevel(4);
    		    
    		    RasterValue rv = (RasterValue)sc.createObject(RasterValue.getClsid());
    		    rv.setRasterDatasetByRef(daset);
    		    rv.setRasterStorageDefByRef(rasterStorageDef);

    		    // Tambah raster ke raster catalog
    		    featureBuffer.setValue(rasterFieldIndex, rv);
    		    cursor.insertFeature(featureBuffer);
    		    
    		    IRasterDataset rdset = this.getRasterCatalogItem(rasterCatalog, idx);
    		    RasterDataset edit = new RasterDataset(rdset);
    		    edit.buildAttributeTable();
    		    
    		    raster = (edataset.next());
    		    idx = idx + 1;
    		    System.out.println("done.");
    		}
    		
    		ret = true;
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    		ret = false;
    	}
    	
    	return ret;
    }
	
	public Fields createFields(IServerContext sc, boolean isByRef, ISpatialReference rasterSpatRef, ISpatialReference geoSpatRef) throws Exception
    {
		Fields fields = (Fields)sc.createObject(Fields.getClsid());

		try
		{
			fields.addField(createOIDField(sc, "OBJECTID"));
			fields.addField(createStringField(sc, "NAME"));
			fields.addField(createRasterField(sc, "RASTER", isByRef, rasterSpatRef));
			fields.addField(createShapeField(sc, "SHAPE", geoSpatRef));
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}

		return fields;
    }
	
	public IField createStringField(IServerContext sc, String name) throws Exception
    {
    	Field field = (Field)sc.createObject(Field.getClsid());

    	try
    	{
    		field.setName(name);
    		field.setType(esriFieldType.esriFieldTypeString);
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}

    	return field;
    }
	
	public Field createOIDField(IServerContext sc, String oidFieldName) throws Exception
    {
		Field field = (Field)sc.createObject(Field.getClsid());
	
		try
		{
			field.setName(oidFieldName);
			field.setType(esriFieldType.esriFieldTypeOID);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return field;
    }

	public Field createRasterField(IServerContext sc, String rasterFieldName, boolean isManagedByGDB, ISpatialReference spatRef) throws  Exception
    {
		Field rasterField = (Field)sc.createObject(Field.getClsid());

		try
		{
			rasterField.setName(rasterFieldName);
			rasterField.setType(esriFieldType.esriFieldTypeRaster);
			
			RasterDef rasterDef = (RasterDef)sc.createObject(RasterDef.getClsid());
			rasterDef.setDescription("This is a raster catalog");
			rasterDef.setIsManaged(isManagedByGDB);
			
			if (spatRef == null)
			{
				spatRef = new UnknownCoordinateSystem();
			}
		
		  	rasterDef.setSpatialReferenceByRef(spatRef);
		  	rasterField.setRasterDefByRef(rasterDef);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	
	  	return rasterField;
    }

	public Field createShapeField(IServerContext sc, String shapeFieldName, ISpatialReference spatRef) throws Exception
    {
	    Field field = (Field)sc.createObject(Field.getClsid());
	    
	    try
	    {
		    field.setName(shapeFieldName);
		    field.setType(esriFieldType.esriFieldTypeGeometry);
		
		    GeometryDef geometryDef = (GeometryDef)sc.createObject(GeometryDef.getClsid());    
		    geometryDef.setGeometryType(esriGeometryType.esriGeometryPolygon);
		
		    if (spatRef == null)
		    {
			    spatRef = new UnknownCoordinateSystem();
			    spatRef.setDomain(-10000, 10000, -10000, 10000);
		    }
		
		    geometryDef.setSpatialReferenceByRef(spatRef);

		    field.setGeometryDefByRef(geometryDef);
	    }
	    catch(Exception ex)
	    {
	    	ex.printStackTrace();
	    }
	
	    return field;
    }

	
	public ISpatialReference createPrjSpatialRef(IServerContext sc, int type)
    {
    	ISpatialReference spatRef;

    	try
    	{
    		SpatialReferenceEnvironment srEnv =(SpatialReferenceEnvironment)sc.createObject(SpatialReferenceEnvironment.getClsid());
    		spatRef = srEnv.createProjectedCoordinateSystem(type);
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    		spatRef = null;
    	}
    	
    	return spatRef;
    }
	
	public IWorkspace openSDEWorkspace(IServerContext sc)
    {
        IWorkspace workspace;

        try
        {
            
        	IWorkspaceFactory wsf = (SdeWorkspaceFactory)sc.createObject(SdeWorkspaceFactory.getClsid());
            IPropertySet connString = (PropertySet)sc.createObject(PropertySet.getClsid());

            connString.setProperty("SERVER", hostName);
            connString.setProperty("INSTANCE", instanceName);
            connString.setProperty("DATABASE", databaseName);
            connString.setProperty("USER", databaseUser);
            connString.setProperty("PASSWORD", databasePassword);
            connString.setProperty("VERSION", "SDE.DEFAULT");

            workspace = (IWorkspace)wsf.open(connString, 0);
        }
        catch (Exception ex)
        {
        	ex.printStackTrace();
            workspace = null;
        }

        return workspace;
    }
	
	public void execute()
	{
		try
		{
			IServerContext sc = getServerContext();
			
			File direktori = new File(".");
            String appDir = direktori.getCanonicalPath();
            
			sc.releaseContext();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	static void initializeArcGISLicenses(AoInitialize ao) {
	    try {
	      
			if (ao.isProductCodeAvailable(com.esri.arcgis.system.esriLicenseProductCode.esriLicenseProductCodeArcServer) == com.esri.arcgis.system.esriLicenseStatus.esriLicenseAvailable)
				ao.initialize(com.esri.arcgis.system.esriLicenseProductCode.esriLicenseProductCodeArcServer);
			else
			{
				System.err.println("Lisensi ArcGIS Server");
				System.exit(-1);
			}  
		} catch (Exception e) {
			e.printStackTrace();
		}
	  }

}
