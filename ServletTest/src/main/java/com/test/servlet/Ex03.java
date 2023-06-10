package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//자동 import = Ctrl + 1
public class Ex03 extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		//랜덤 > 구구단 페이지 만들기
		Random rnd = new Random();
		int dan = rnd.nextInt(8) + 2;
		
		String temp = "<!DOCTYPE html>\r\n"
				+ "<html lang=\"en\">\r\n"
				+ "<head>\r\n"
				+ "    <meta charset=\"UTF-8\">\r\n"
				+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
				+ "    <title>Document</title>\r\n"
				+ "    <style>\r\n"
				+ "        .box {\r\n"
				+ "            border : 1px solid #CCC;\r\n"
				+ "            width : 120px;\r\n"
				+ "            padding : 20px;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        .box .item {\r\n"
				+ "            font-size : 1.5rem;\r\n"
				+ "        }\r\n"
				+ "    </style>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n";
		
	
		   temp += String.format("    <h1>구구단 %d단</h1>\r\n", dan);
		   
		   temp += "\r\n"
				+ "    <div class=\"box\">\r\n";
		   
		   for (int i=1; i<=9; i++) {
			   temp += String.format("        <div class=\"item\">%d x %d = %d</div>\r\n", dan, i, dan*i) ;
		   }
		   
		   
		   temp +="\r\n"
				+ "    </div>\r\n"
				+ "</body>\r\n"
				+ "</html>";
		   
		   resp.setCharacterEncoding("UTF-8");
		   
		   PrintWriter writer = resp.getWriter();
		   writer.print(temp);
		   writer.close();
		
	}
	
	
}
