package com.test.servlet;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

//서블릿(X) -> 일반 클래스(O)
public class Ex01 {

	public static void main(String[] args) {
		
		//동적으로 HTML 페이지 만들기
		// - test.txt
		// - test.dat
		// - test.html
		
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(".\\src\\main\\webapp\\ex01.html"));
			
			writer.write("<html>");
			writer.write("<head>");
			writer.write("<meta charset='UTF-8'>");
			writer.write("</head>");
			writer.write("<body>");
			writer.write("<h1>서블릿 페이지</h1>");
			writer.write("<p>안녕하세요.</p>");
			writer.write("<p>자바로 만든 페이지입니다.</p>");
			writer.write("<p>오늘의 날씨 : 맑음</p>");
			writer.write("</body>");
			writer.write("</html>");
			
			writer.close();
			
			System.out.println("complete");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
