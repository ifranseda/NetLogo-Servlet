//
// Copyright (c) 2008 Eric Russell. All rights reserved.
//

package org.myworldgis.netlogo;

import com.sun.media.jai.codec.ImageCodec;
import com.vividsolutions.jts.geom.Envelope;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.awt.image.WritableRaster;
import java.io.IOException;
import java.io.PushbackInputStream;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.myworldgis.util.HttpClientManager;
import org.myworldgis.util.WMSUtils;
import org.nlogo.api.Argument;
import org.nlogo.api.Context;
import org.nlogo.api.ExtensionException;
import org.nlogo.api.LogoException;
import org.nlogo.api.Syntax;
import org.nlogo.api.World;

/**
 * Examples: 
 *   gis:import-wms-drawing "http://terraservice.net/ogcmap.ashx" "EPSG:4326" "DOQ" 128
 *   gis:import-wms-drawing "http://nmcatalog.usgs.gov/catalogwms/base" "EPSG:4326" "T_5" 128
 *   gis:import-wms-drawing "http://neowms.sci.gsfc.nasa.gov/wms/wms" "EPSG:4326" "BlueMarbleNG" 128
 *   gis:import-wms-drawing "http://neowms.sci.gsfc.nasa.gov/wms/wms" "EPSG:4326" "MOD12Q1_T1" 128
 * 
 * Only works if your projection is Geographic in decimal degrees.
 */
public class LoadWMSImage extends GISExtension.Command {
    
    //--------------------------------------------------------------------------
    // GISExtension.Command implementation
    //--------------------------------------------------------------------------
    
    /** */
    public String getAgentClassString() {
        return "O";
    }
    
    /** */
    public Syntax getSyntax() {
        return Syntax.commandSyntax(new int[] { Syntax.TYPE_STRING, 
                                                Syntax.TYPE_STRING, 
                                                Syntax.TYPE_STRING,
                                                Syntax.TYPE_NUMBER });
    }
    
    /** */
    public void performInternal (Argument args[], Context context) 
            throws ExtensionException, IOException, LogoException {
        String serverURL = args[0].getString();
        String srs = args[1].getString();
        String layers = args[2].getString();
        int transparency = args[3].getIntValue();
        if ((transparency < 0) || (transparency > 255)) {
            throw new ExtensionException("transparency must be between 0 and 255");
        }
        BufferedImage drawing = context.getDrawing();
        World world = context.getAgent().world();
        Envelope viewBounds = GISExtension.getState().getTransformation().getEnvelope(world);
        Dimension pixelBounds = new Dimension(drawing.getWidth(), drawing.getHeight());
        String url = WMSUtils.makeGetMapURL(serverURL, viewBounds, pixelBounds, srs, layers, WMSUtils.ImageFormat.JPEG);
        GetMethod method = new GetMethod(url);
        RenderedImage image = null;
        try {
            int statusCode = HttpClientManager.getInstance().execute(method);
            if (statusCode != HttpStatus.SC_OK) {
                throw(new IOException(HttpClientManager.errorMsg(statusCode, url)));
            }
            PushbackInputStream in = new PushbackInputStream(method.getResponseBodyAsStream(), 12);
            byte[] beginning = new byte[12];
            int bytesRead = in.read(beginning, 0, 12);
            in.unread(beginning, 0, bytesRead);
            if (bytesRead < 12) {
                throw new ExtensionException( org.nlogo.util.Utils.reader2String( new java.io.InputStreamReader( in ) ) ) ;
            } else if ("JFIF".equals(new String(beginning, 6, 4))) {
                image = ImageCodec.createImageDecoder("JPEG", in, null).decodeAsRenderedImage();
            } else if ("PNG".equals(new String(beginning, 1, 3))) {
                // sometimes you get a PNG even when you ask for a JPEG
                image = ImageCodec.createImageDecoder("PNG", in, null).decodeAsRenderedImage();
            } else {
                throw new ExtensionException( org.nlogo.util.Utils.reader2String( new java.io.InputStreamReader( in ) ) ) ;
            }
        } finally {
            method.releaseConnection();
        }
        
        if (transparency > 0) {
            // It would be much more efficient to do this by making a new 
            // BufferedImage that re-uses the source image's Raster, with a 
            // custom ColorModel that decorates the source's ColorModel and 
            // adds/modifies the alpha channel. But the code is much more 
            // simple this way, and it's fast enough for now.
            int alpha = 255 - transparency;
            int width = image.getWidth();
            int height = image.getHeight();
            BufferedImage tImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
            Graphics2D g = tImg.createGraphics();
            try {
                g.drawRenderedImage(image, new AffineTransform());
            } finally {
                g.dispose();
            }
            WritableRaster alphaRaster = tImg.getAlphaRaster();
            int[] pixel = { alpha };
            for (int x = 0; x < width; x += 1) {
                for (int y = 0; y < height; y += 1) {
                    alphaRaster.setPixel(x, y, pixel);
                }
            }
            image = tImg;
        }
        
        Graphics2D g = (Graphics2D)drawing.getGraphics();
        try {
            g.drawRenderedImage(image, new AffineTransform());
        } finally {
            g.dispose();
        }
    }
}
