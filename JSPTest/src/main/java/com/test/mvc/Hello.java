package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//비즈니스 코드 작성!!
		
		//서블릿 업무 종료 > JSP 호출하기
		
		//서블릿 > (이동) > JSP
		
		//1. response.sendRedirect()
		//2. pageContext.forward()
		
		//resp.sendRedirect("/jsp/mvc/hello.jsp"); : 이러한 경우엔 잘 사용 안함.
		
		int count = 10; //DB 작업 결과물
		
		req.setAttribute("count", count); //req : 데이터 전송하는 역할 > 모델
		//session
		//application
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/mvc/hello.jsp");
	
		//pageContext.forward() 역할
		dispatcher.forward(req, resp);
	}
	
}
