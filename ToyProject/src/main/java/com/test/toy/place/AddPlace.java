package com.test.toy.place;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.toy.place.repository.PlaceDAO;
import com.test.toy.place.repository.PlaceDTO;

@WebServlet("/place/addplace.do")
public class AddPlace extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      //AddPlace.java
      

      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/place/addplace.jsp");
      dispatcher.forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	  PlaceDAO dao = new PlaceDAO();
	   
      try {
         
         MultipartRequest multi = new MultipartRequest(
                                 
                                 req,
                                 req.getRealPath("/asset/place"),
                                 1024 * 1024 * 10,
                                 "UTF-8",
                                 new DefaultFileRenamePolicy()
               
                           );
         
         
         System.out.println(req.getRealPath("/asset/place"));
         
         HttpSession session = req.getSession();
         
         String name = multi.getParameter("name");
         String content = multi.getParameter("content");
         String pic = multi.getFilesystemName("pic");
         
         PlaceDTO dto = new PlaceDTO();
         
         dto.setName(name);
         dto.setContent(content);
         dto.setPic(pic);
         dto.setId((String)session.getAttribute("id"));
         
         int result = dao.addPlace(dto);
         
         String pseq = dao.getPlaceSeq();
         
         String hashtag = multi.getParameter("hashtag");
         System.out.println(hashtag);
         
         JSONParser parser = new JSONParser();
         
         JSONArray arr = (JSONArray)parser.parse(hashtag);
         
         for (Object obj : arr) {
        	 //System.out.println(obj); //{"value":"사진"}
        	 String tag = (String)((JSONObject)obj).get("value");
        	 
        	 //해시 태그 > insert
        	 String hseq = "";
        	 
        	 if (dao.checkHashTag(tag)) {
        		 dao.addHashTag(tag);     	 
            	 hseq = dao.getHashTagSeq();
        	 } else {
        		 hseq = dao.getHashTagSeq(tag); //기존 태그 번호
        	 }
        	 
        	 
        	 //관계 테이블 추가
        	 HashMap<String, String> map = new HashMap<String, String>();
        	 
        	 map.put("pseq", pseq);
        	 map.put("hseq", hseq);
        	 
        	 dao.addPlaceHashTag(map);
        	 
         }
         
         

         
         
         
         if (result == 1) {
            resp.sendRedirect("/toy/place/place.do");
         } else {
            PrintWriter writer = resp.getWriter();
            writer.print("<script>alert('failed');history.back();</script>");
            writer.close();
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      }
   
   }

}