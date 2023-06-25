package com.test.toy.place;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.drew.imaging.ImageMetadataReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.GpsDirectory;
import com.test.toy.place.repository.PlaceDAO;
import com.test.toy.place.repository.PlaceDTO;

@WebServlet("/place/view.do")
public class View extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      //View.java
      String seq = req.getParameter("seq");
      
      PlaceDAO dao = new PlaceDAO();
      
      PlaceDTO dto = dao.get(seq);
      
      ArrayList<String> hashtag = dao.getHashTag(seq);
      
      dto.setHashtag(hashtag);
      
      
      //사진 메타 데이터 접근
      File file = new File(req.getRealPath("asset/place") + "\\" + dto.getPic());
      
      //System.out.println(file.exists());
      if (file.exists()) {
         
         if (dto.getPic().toLowerCase().endsWith(".png")
            || dto.getPic().toLowerCase().endsWith(".jpg")
            || dto.getPic().toLowerCase().endsWith(".jpeg")
            || dto.getPic().toLowerCase().endsWith(".gif")) {
            
            try {
               
               Metadata metadata = ImageMetadataReader.readMetadata(file);
               
               GpsDirectory gps = metadata.getFirstDirectoryOfType(GpsDirectory.class);
               
               //위도, 경도
               if (gps.containsTag(GpsDirectory.TAG_LATITUDE)
                     && gps.containsTag(GpsDirectory.TAG_LONGITUDE)) {
                  
                  double lat = gps.getGeoLocation().getLatitude();
                  
                  double lng = gps.getGeoLocation().getLongitude();
                  
                  System.out.println(lat);
                  System.out.println(lng);
                  
                  req.setAttribute("lat", lat);
                  req.setAttribute("lng", lng);
                  
               }
               
            } catch (Exception e) {
               e.printStackTrace();
            }
            
         }
         
      }
      
      
      
      req.setAttribute("dto", dto);

      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/place/view.jsp");
      dispatcher.forward(req, resp);
   }

}