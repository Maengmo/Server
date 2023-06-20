package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex05data.do")
public class Ex05Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex05Data.java
		//System.out.println("서블릿 호출됨.");
		
		//Ajax 응답
		//- JSP 페이지 < (더편함) < PrintWriter
		//PrintWriter writer = resp.getWriter();

		//writer.write("200");
		//writer.close();

//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex05data.jsp");
//		dispatcher.forward(req, resp);
		
//		String txt2 = req.getParameter("txt2");
//		System.out.println("GET : " + txt2);
		
		String txt3 = req.getParameter("txt3");
		System.out.println("txt3 : " + txt3);
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		writer.write("응답: " + txt3);
		writer.close();
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String txt2 = req.getParameter("txt2");
		System.out.println("POST : " + txt2);

	}
	
}
















