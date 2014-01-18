package com.gngapps.yours.listeners;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.gngapps.yours.AppConstants;

/**
 * Application Lifecycle Listener implementation class ImagesDirectoryCreator
 *
 */
public class ImagesDirectoryCreator implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ImagesDirectoryCreator() {}

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce) {
    	ServletContext context = sce.getServletContext();
    	String foodComponentImagesPath = context.getRealPath(AppConstants.FOOD_COMPONENT_IMAGES_RELATIVE_LOCATION);
    	File file = new File(foodComponentImagesPath);
    	if(!file.exists()) {
    		file.mkdir();
    	}
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce) {
    }
	
}
