/**
 * 
 */
package lib;

import java.io.IOException;
import java.net.UnknownHostException;

import com.esri.arcgis.datasourcesraster.*;
import com.esri.arcgis.datasourcesGDB.*;
import com.esri.arcgis.geodatabase.*;
import com.esri.arcgis.geometry.*;
import com.esri.arcgis.display.*;
import com.esri.arcgis.system.*;
import com.esri.arcgis.server.*;
import com.esri.arcgis.carto.*;


/**
 * @author Abdurrahman - RDP Team
 * @vendor Gitamanda Laksana 
 *
 */
public class GISClass {

	/**
	 * Properties 
	 */
	
	private String GDBNamaServer = "";
	private String GDBInstance = "";
    private String GDBDatabase = "";
    private String GDBUser = "";
    private String GDBPassword = "";
    private String GDBVersion = "";
    private String PesanError = "";
    
    /**
     * Constructors
     */
    
    public GISClass()
    {
    	this.SetDefaultProperties();
    }
    
    public GISClass(String server, String instance
    		, String database, String user, String password
    		, String version)
    {
    	setGDBNamaServer(server);
    	setGDBInstance(instance);
        setGDBDatabase(database);
        setGDBUser(user);
        setGDBPassword(password);
        setGDBVersion(version);
    }
    
    /* End Of Constructors */
    
    /**
     * Methods
     */
    
    private void SetDefaultProperties()
    {
    	setGDBNamaServer("localhost");
    	setGDBInstance("5151");
        setGDBDatabase("rdpcenter");
        setGDBUser("rddpcenter");
        setGDBPassword("rahmattea");
        setGDBVersion("SDE.DEFAULT");
    }

    public IWorkspace OpenSDEWorkspace()
    {
        IWorkspace workspace;

        try
        {
            // Inisialisasi lisensi ESRI
//            IAoInitialize aoInit = new AoInitialize();
//            aoInit.initialize(esriLicenseProductCode.esriLicenseProductCodeArcServer);
            
            IWorkspaceFactory wsf = new SdeWorkspaceFactory();
            IPropertySet connString = new PropertySet();

            connString.setProperty("SERVER", this.getGDBNamaServer()); // localhost
            connString.setProperty("INSTANCE", this.getGDBInstance()); // esri_sde
            connString.setProperty("DATABASE", this.getGDBDatabase()); // 
            connString.setProperty("USER", this.getGDBUser()); // rdpcenter
            connString.setProperty("PASSWORD", this.GDBPassword); // rahmattea
            connString.setProperty("VERSION", this.getGDBVersion()); // SDE.DEFAULT

            workspace = wsf.open(connString, 0);
        }
        catch (Exception ex)
        {
        	ex.printStackTrace();
            this.setPesanError(ex.getMessage());
            workspace = null;
        }

        return workspace;
    }
    
    public IRasterCatalog OpenRasterCatalog(IRasterWorkspaceEx rwe, String name)
    {
        IRasterCatalog rc;

        try
        {
            rc = rwe.openRasterCatalog(name);
        }
        catch (Exception ex)
        {
        	ex.printStackTrace();
            this.setPesanError(ex.getMessage());
            rc = null;
        }

        return rc;
    }

    public IRasterDataset GetRasterCatalogItem(IRasterCatalog rc, int oid)
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
        	this.setPesanError(ex.getMessage());
        	raster = null;
        }
        return raster;
    }

    public Boolean CreateMxd(String filepath)
    {
        Boolean result = false;

        try
        {
            IMapDocument mapDocument = new MapDocument();
            mapDocument.esri_new(filepath);
            mapDocument.close();
            mapDocument = null;
            result = true;
        }
        catch(Exception ex)
        {
        	this.setPesanError(ex.getMessage());
        	result = null;
        }

        return result;
    }
    
    public IRasterDataset OpenRasterDataset(IRasterCatalog rc, int oid)
    {
        IRasterDataset raster;

        try
        {
            IFeatureClass fc = (IFeatureClass)rc;
            IRasterCatalogItem rci = (IRasterCatalogItem)fc.getFeature(oid);
            raster = rci.getRasterDataset();
        }
        catch (Exception ex)
        {
            this.setPesanError(ex.getMessage());
            raster = null;
        }

        return raster;
    }
    
    public IRasterRenderer CreateUVRenderer(IRasterDataset rasterDataset)
    {
        IRasterRenderer result = null;
        IColor warna;
        ISimpleFillSymbol simbol1, simbol2, simbol3, simbol4, simbol5
        			, simbol6, simbol7, simbol8, simbol9;
        try
        {
            IRaster2 raster = (IRaster2)rasterDataset.createDefaultRaster();
            ITable tabelRaster = raster.getAttributeTable();

            if (tabelRaster == null) return null;

            int numValue = tabelRaster.rowCount(null);
            int idxField = tabelRaster.findField("Value");

            if (numValue == 0) return null;

            //Buat unique value renderer.
            IRasterUniqueValueRenderer uvRenderer = new RasterUniqueValueRenderer();
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
            Byte NilaiLabel;
            for (int i = 0; i < numValue; i++)
            {
                baris = tabelRaster.getRow(i+1);
                NilaiLabel = (Byte) baris.getValue(idxField);
                uvRenderer.addValue(0, i, NilaiLabel);

                switch (NilaiLabel)
                {
                    case 0:
                        simbol1 = new SimpleFillSymbol();
                        warna = new RgbColor();
                        warna.setRGB(Integer.parseInt("004000", 16));
                        simbol1 = new SimpleFillSymbol();
                        simbol1.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol1);
                        uvRenderer.setLabel(0, i, "Kawasan Lindung");
                        break;
                    case 1:
                        simbol2 = new SimpleFillSymbol();
                        warna = new RgbColor();
                        warna.setRGB(Integer.parseInt("00C000", 16));
                        simbol2 = new SimpleFillSymbol();
                        simbol2.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol2);
                        uvRenderer.setLabel(0, i, "Hutan Lain");
                        break;
                    case 2:
                        simbol3 = new SimpleFillSymbol();
                        warna = new RgbColor();
                        warna.setRGB(Integer.parseInt("80FF80", 16));
                        simbol3 = new SimpleFillSymbol();
                        simbol3.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol3);
                        uvRenderer.setLabel(0, i, "Perkebunan");
                        break;
                    case 3:
                        simbol4 = new SimpleFillSymbol();
                        warna = new RgbColor();
                        warna.setRGB(Integer.parseInt("00FFFF", 16));
                        simbol4 = new SimpleFillSymbol();
                        simbol4.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol4);
                        uvRenderer.setLabel(0, i, "Sawah");
                        break;
                    case 4:
                        simbol5 = new SimpleFillSymbol();
                        warna = new RgbColor();
                        warna.setRGB(Integer.parseInt("80C0FF", 16));
                        simbol5 = new SimpleFillSymbol();
                        simbol5.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol5);
                        uvRenderer.setLabel(0, i, "Pertanian Lain");
                        break;
                    case 5:
                        simbol6 = new SimpleFillSymbol();
                        warna = new RgbColor();
                        warna.setRGB(Integer.parseInt("0000FF", 16));
                        simbol6 = new SimpleFillSymbol();
                        simbol6.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol6);
                        uvRenderer.setLabel(0, i, "Pemukiman");
                        break;
                    case 6:
                        simbol7 = new SimpleFillSymbol();
                        warna = new RgbColor();
                        warna.setRGB(Integer.parseInt("800080", 16));
                        simbol7 = new SimpleFillSymbol();
                        simbol7.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol7);
                        uvRenderer.setLabel(0, i, "Pertambangan");
                        break;
                    case 7:
                        simbol8 = new SimpleFillSymbol();
                        warna = new RgbColor();
                        warna.setRGB(Integer.parseInt("FF80C0", 16));
                        simbol8 = new SimpleFillSymbol();
                        simbol8.setColor(warna);
                        uvRenderer.setSymbol(0, i, (ISymbol)simbol8);
                        uvRenderer.setLabel(0, i, "Kolam dan Tambak");
                        break;
                    case 8:
                        simbol9 = new SimpleFillSymbol();
                        warna = new RgbColor();
                        warna.setRGB(Integer.parseInt("FF8000", 16));
                        simbol9 = new SimpleFillSymbol();
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
            this.setPesanError(ex.getMessage());
            return result;
        }
    }
    
    public void AddRasterLayer(IActiveView activeView
    		, IRasterDataset rasterDataset, IRasterRenderer rasterRenderer)
    {
    	try
    	{
	        IRasterLayer rasterLayer = new RasterLayer();
	        rasterLayer.createFromDataset(rasterDataset);
	        //Set the raster renderer. The default renderer will be used if passing a null value.
	        if (rasterRenderer != null)
	        {
	            rasterLayer.setRendererByRef(rasterRenderer);
	        }
	        //Add it to a map if the layer is valid.
	        if (rasterLayer != null)
	        {
	            IMap map = activeView.getFocusMap();
	            map.addLayer((ILayer)rasterLayer);
	        }
    	}
    	catch(Exception ex)
    	{
    		this.setPesanError(ex.getMessage());
    	}
    }
    
    public Boolean LayoutMapRaster(IWorkspace workspace, String path, int LamaSimulasi)
    {
        boolean result = false;

        try
        {
            IMapDocument mapdoc = new MapDocument();
            mapdoc.esri_new(path);
            IMap map = mapdoc.getActiveView().getFocusMap();

            if (map.getLayerCount() > 0) map.clearLayers();

            IRasterWorkspaceEx rwe = (IRasterWorkspaceEx)workspace;
            
            IRasterCatalog rc = OpenRasterCatalog(rwe,"HasilSimKalsel");

            //IGdbRasterCatalogLayer rastercatalogLayer = new GdbRasterCatalogLayerClass();

            //rastercatalogLayer.Setup((ITable)rc);

            //if (!(rastercatalogLayer == null))
            //{
                IRasterDataset rasterDataset;
                for (int i = 1; i <= LamaSimulasi; i++)
                {
                    rasterDataset = GetRasterCatalogItem(rc, i);
                    AddRasterLayer(mapdoc.getActiveView(), rasterDataset, CreateUVRenderer(rasterDataset));
                }
                //map.AddLayer((ILayer)rastercatalogLayer);
            //}

            mapdoc.save(true, true);

            mapdoc.close();
            map = null;
            mapdoc = null;
            result = true;
        }
        catch (Exception ex)
        {
        	this.setPesanError(ex.getMessage());
            result = false;
        }

        return result;
    }
    
    public Boolean PublishMXD()
    {
        Boolean ret = false;
        
        try
        {
        
	        // Initialize ESRI licenses
	        IAoInitialize aoInit = new AoInitialize();
	        aoInit.initialize(esriLicenseProductCode.esriLicenseProductCodeArcServer);
	
	        String serverMachineName = "xmatos";
	        String serviceName = "Test/dodol";
	        String pathToMap = "F:\\Kerja\\Gitamanda\\Mxds\\Ske_2.mxd";
	        int format = 9;
	
	        //define paths for the onlineresource property in the extension properties
	        String resource = "http://" + serverMachineName + "/ArcGIS/services/" + serviceName + "/MapServer/WMSServer";
	        String resourceKML = "http://" + serverMachineName + "/ArcGIS/services/" + serviceName + "/MapServer/KMLServer";
	        String resourceWCS = "http://" + serverMachineName + "/ArcGIS/services/" + serviceName + "/MapServer/WCSServer";
	        String resourceWFS = "http://" + serverMachineName + "/ArcGIS/services/" + serviceName + "/MapServer/WFSServer";
	
	        //  Connect to the ArcGIS server called  serverMachineName (string) .   
	        IGISServerConnection pGISServerConnection = new GISServerConnection();
	        // example :  pGISServerConnection.Connect("llv38-tasc65688");   
	        pGISServerConnection.connect(serverMachineName);
	
	        // create the new configuration
	        IServerObjectAdmin pServerObjectAdmin = pGISServerConnection.getServerObjectAdmin();
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
	        pProps.setProperty("FilePath", pathToMap);    // required property
	        pProps.setProperty("OutputDir", "e:\\arcgisserver\\arcgisoutput");
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
        	this.setPesanError(ex.getMessage());
        	ret = false;
        }

        return ret;
    }

    public ISpatialReference createPrjSpatialRef(int type)
    {
    	ISpatialReference spatRef;

    	try
    	{
    		SpatialReferenceEnvironment srEnv = new SpatialReferenceEnvironment();
    		spatRef = srEnv.createProjectedCoordinateSystem(type);
    	}
    	catch(Exception ex)
    	{
    		this.setPesanError(ex.getMessage());
    		spatRef = null;
    	}
    	
    	return spatRef;
    }
    
    public Boolean loadToRasterCatalog(IWorkspace workspace
    		, String rasterCatalogName, ISpatialReference rasterSpatialRef
    		, ISpatialReference geoSpatialRef
    		, String rasterDir)
    {
    	Boolean ret = false;
    	
    	try
    	{
    		// Buat Raster Catalog
    		Workspace ws = new Workspace(workspace);
    		RasterCatalog rasterCatalog = new RasterCatalog(
    				ws.createRasterCatalog(rasterCatalogName
    						, this.createFields(false, rasterSpatialRef, geoSpatialRef)
    						, "SHAPE"
    						, "RASTER"
    						, "defaults"));
    		
    		RasterWorkspaceFactory inputRasterWorkspaceFactory = new RasterWorkspaceFactory();
    		RasterWorkspace inputRasterWorkspace = new RasterWorkspace(
    				inputRasterWorkspaceFactory.openFromFile(rasterDir,0));
    		
    		IEnumDataset edataset = inputRasterWorkspace.getDatasets(esriDatasetType.esriDTRasterDataset);
    		
    		IDataset raster = edataset.next();
    		
    		int rasterFieldIndex = rasterCatalog.getRasterFieldIndex();
    		FeatureClass fc = new FeatureClass(rasterCatalog);
    		FeatureCursor cursor = new FeatureCursor(fc.IFeatureClass_insert(false));
    		
    		while(raster!=null)
    		{
    			IRasterDataset ds = new IRasterDatasetProxy(raster);
    		    System.out.print("Loading " + ds.getCompleteName() + "...");
    		    IFeatureBuffer featureBuffer = fc.createFeatureBuffer();

    		    // Buat Raster Value
    		    RasterStorageDef rasterStorageDef = new RasterStorageDef();
    		    rasterStorageDef.setCompressionType(esriRasterSdeCompressionTypeEnum.esriRasterSdeCompressionTypeRunLength);
    		    rasterStorageDef.setPyramidResampleType(rstResamplingTypes.RSP_BilinearInterpolation);
    		    rasterStorageDef.setPyramidLevel(-1);

    		    RasterValue rv = new RasterValue();
    		    rv.setRasterDatasetByRef(ds);
    		    rv.setRasterStorageDefByRef(rasterStorageDef);

    		    // Tambah raster ke raster catalog
    		    featureBuffer.setValue(rasterFieldIndex, rv);
    		    cursor.insertFeature(featureBuffer);
    		    raster = (edataset.next());
    		    System.out.println("done.");
    		}
    		
    		ret = true;
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    		this.setPesanError(ex.getMessage());
    		ret = false;
    	}
    	
    	return ret;
    }
    
    public IField createStringField(String name) throws Exception
    {
    	Field field = new Field();

    	field.setName(name);
    	field.setType(esriFieldType.esriFieldTypeString);

    	return field;
    }
    
    public Field createOIDField(String oidFieldName) throws Exception
    {
		Field field = new Field();
		
		field.setName(oidFieldName);
		field.setType(esriFieldType.esriFieldTypeOID);
		
		return field;
    }
    
    public Field createRasterField(String rasterFieldName, boolean isManagedByGDB
    		, ISpatialReference spatRef) throws  Exception
    {
		Field rasterField = new Field();
		rasterField.setName(rasterFieldName);
		rasterField.setType(esriFieldType.esriFieldTypeRaster);
		
		RasterDef rasterDef = new RasterDef();
		rasterDef.setDescription("This is a raster catalog");
		rasterDef.setIsManaged(!isManagedByGDB);
		
		if (spatRef == null)
		{
			spatRef = new UnknownCoordinateSystem();
		}
	
	  	rasterDef.setSpatialReferenceByRef(spatRef);
	  	rasterField.setRasterDefByRef(rasterDef);
	
	  	return rasterField;
    }
    
    public Field createShapeField(String shapeFieldName
    		, ISpatialReference spatRef) throws Exception
    {
	    Field field = new Field();
	    field.setName(shapeFieldName);
	    field.setType(esriFieldType.esriFieldTypeGeometry);
	
	    GeometryDef geometryDef = new GeometryDef();    
	    geometryDef.setGeometryType(esriGeometryType.esriGeometryPolygon);
	
	    if (spatRef == null)
	    {
		    spatRef = new UnknownCoordinateSystem();
		    spatRef.setDomain(-10000, 10000, -10000, 10000);
	    }
	
	    geometryDef.setSpatialReferenceByRef(spatRef);
	    geometryDef.setAvgNumPoints(2);
	    geometryDef.setGridCount(1);
	    geometryDef.setGridSize(0, 1000);
	
	    field.setGeometryDefByRef(geometryDef);
	
	    return field;
    }
    
    public Fields createFields(boolean isByRef, ISpatialReference rasterSpatRef, ISpatialReference geoSpatRef) throws Exception
    {
      // ++ if fields are missing from input, create default
      Fields fields = new Fields();
      
      // add OID field
      fields.addField(createOIDField("OBJECTID"));
      // add NAME field
      fields.addField(createStringField("NAME"));
      // add RASTER field
      fields.addField(createRasterField("RASTER", isByRef, rasterSpatRef));
      // add SHAPE field
      fields.addField(createShapeField("SHAPE", geoSpatRef));

      return fields;
      }
    
    /* End Of Methods */
    
    /**
     * Setters and Getters
     */
    
	public void setGDBVersion(String gDBVersion) {
		GDBVersion = gDBVersion;
	}

	public String getGDBVersion() {
		return GDBVersion;
	}

	public void setGDBPassword(String gDBPassword) {
		GDBPassword = gDBPassword;
	}

	public String getGDBPassword() {
		return GDBPassword;
	}

	public void setGDBUser(String gDBUser) {
		GDBUser = gDBUser;
	}

	public String getGDBUser() {
		return GDBUser;
	}

	public void setGDBDatabase(String gDBDatabase) {
		GDBDatabase = gDBDatabase;
	}

	public String getGDBDatabase() {
		return GDBDatabase;
	}

	public void setGDBInstance(String gDBInstance) {
		GDBInstance = gDBInstance;
	}

	public String getGDBInstance() {
		return GDBInstance;
	}

	public void setGDBNamaServer(String gDBNamaServer) {
		GDBNamaServer = gDBNamaServer;
	}

	public String getGDBNamaServer() {
		return GDBNamaServer;
	}

	public void setPesanError(String pesanError) {
		PesanError = pesanError;
	}

	public String getPesanError() {
		return PesanError;
	}
    
    /* End Of Setters and Getters */
}
