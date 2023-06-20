package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex08data.do")
public class Ex08Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex08Data.java

		String id = req.getParameter("id");
		
		AjaxDAO dao = new AjaxDAO();
		
		int result = dao.checkID(id);
		
		/*
		 	
		  	{
		  		"result" : 1
		  	}
		 
		 */
		
		resp.setContentType("application/json");
		resp.getWriter().printf("\"result\" : %d", result);
		resp.getWriter().close();
		
	}

}
















