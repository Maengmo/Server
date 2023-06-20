package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex02.do")
public class Ex02 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex02.java
		//1. DB 작업 > select
		//2. 결과 반환 > JSP 호출하기
		
		AjaxDAO dao = new AjaxDAO();
		
		ResearchDTO dto = dao.getResearch(1);
		
		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex02.jsp");
		dispatcher.forward(req, resp);
	}

}




















