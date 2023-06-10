package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex04Ok extends HttpServlet {

	
	//1. doGet >> <form method="GET">
	//2. doPost >> <form method="POST">
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//<input type='text' name='name'>
		
		//1. 데이터 수신하기
		String name = req.getParameter("name"); //텍스트 박스에 입력한 문자열
		System.out.println(name);
		
		//2. 응답 페이지 작성
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>데이터 수신 완료</h1>");
		writer.println("<div>데이터 : " + name +"</div>");
		writer.println("</body>");
		writer.println("</html>");

		writer.close();
	}
	
}
