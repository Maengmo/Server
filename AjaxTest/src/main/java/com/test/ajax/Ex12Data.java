package com.test.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex12data.do")
public class Ex12Data extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      String seq = req.getParameter("seq");
      String line = req.getParameter("line");
      
      System.out.println(seq);
      System.out.println(line);
      
      //Ex12Data.java
      AjaxDAO dao = new AjaxDAO();
      
      Ex12DTO dto = new Ex12DTO();
      dto.setSeq(seq);
      dto.setLine(line);
      
      dao.editLine(dto);
      
      

   }

}