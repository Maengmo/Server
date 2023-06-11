package com.test.file;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/filetest.do")
public class FileTest extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      //FileTest.java

      RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/file/filetest.jsp");
      dispatcher.forward(req, resp);
   }

}