package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex04 extends HttpServlet{
	
	//1. doGet >> <form method="GET">
	//2. doPost >> <form method="POST">

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='UTF-8'>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h1>데이터 보내기</h1>");
		writer.println("<form method='GET' action='/servlet/ex04ok'>");
		writer.println("<div>이름 : <input type='text' name='name'></div>");
		writer.println("<div></div>");
		writer.println("<div></div>");
		writer.println("<div><input type='submit' value='보내기'></div>");
		writer.println("</form>");
		
		writer.println("<a href='/servlet/ex04ok?name=hong'>Ok 페이지</a>");
		
		writer.println("<script>");
		writer.println("window.onclick = function() { location.href='/servlet/ex04ok?name=lee'; };");
		writer.println("</script>");
		
		writer.println("</body>");
		writer.println("</html>");

		writer.close();
	}
	
}
