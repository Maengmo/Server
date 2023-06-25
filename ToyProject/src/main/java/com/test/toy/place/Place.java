package com.test.toy.place;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.toy.place.repository.PlaceDAO;
import com.test.toy.place.repository.PlaceDTO;

@WebServlet("/place/place.do")
public class Place extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      //Place.java
      
      String tag = req.getParameter("tag");

      PlaceDAO dao = new PlaceDAO();
      
      List<PlaceDTO> list = dao.listPlace(tag);
      
      req.setAttribute("list", list);
      
      
      
      
      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/place/place.jsp");
      dispatcher.forward(req, resp);
   }

}