package com.test.file;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/multifile.do")
public class MultiFile extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      //MultiFile.java

      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/multifile.jsp");
      dispatcher.forward(req, resp);
   }

}























