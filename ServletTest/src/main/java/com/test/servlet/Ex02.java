package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
//
//1. 서블릿 클래스 선언
//a. javax.servlet.Servlet 인터페이스를 구현한다. > 복잡합 > 사용X
//b. javax.servlet.http.HttpServlet 클래스를 상속받는다. > 간편함 > 사용**
import javax.servlet.http.HttpServletResponse;

public class Ex02 extends HttpServlet {

//	2. doGet/doPost 메소드 선언
//	- 둘 중 하나 선언 or 둘 다 선언
//	- 클라이언트(브라우저)의 요청이 들어오면 자동으로 호출되는 메소드
//	- 동적으로 HTML 페이지를 만드는 역할
//	
//	- 메소드 작성 규칙
//	a. 매개 변수 작성(2개)
//		1. java.servlet.http.HttpServletRequest
//		2. java.servlet.http.HttpServletReponse
//	b. 예외 미루기
//		1. java.io.IOException			//페이지 동적 생성 - 외부 입출력
//		2. java.servlet.ServletException //서블릿 작업
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//		
//		3. 동적 HTML 문서 작성
//		- HttpServletResponse 객체의 getWriter() 메소드 호출 > PrintWriter 객체 반환
//		- PrintWriter 객체의 printXXX("<html>") 메소드를 사용 > HTML을 생성
//		- 페이지 완성 > 브라우저에게 반환
		
		//BufferedWriter > 생성된 파일 > HDD에 저장
		//PrintWriter > 생선된 파일 > 톰캣을 통해서 브라우저에게 반환
		
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");		
		writer.println("<meta charset='UTF-8'>");		
		writer.println("</head>");		
		writer.println("<body>");		
		writer.println("<h1>서블릿 페이지</h1>");		
		writer.println("<p>서블릿을 사용해서 만들었습니다.</p>");
		writer.println("</body>");		
		writer.println("</html>");
		
		writer.close();
		
		//Ctrl + F11
		
		//자바 파일은(class) 웹에서 호출이 불가능하다.
		//- http://localhost:8090/servlet/servlet/com.test.servlet.Ex02
		//- http://localhost:8090/servlet/ex02
		
		//자바 파일을 브라우저를 통해 웹에서 호출할 수 있는 방법이 필요!!
		//- 가상 주소
		//- web > web-inf > web.xml
		
	}
	
	
}
