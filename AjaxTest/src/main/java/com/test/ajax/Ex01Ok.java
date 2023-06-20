package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex01Ok.do")
public class Ex01Ok extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex01Ok.java
		
		AjaxDAO dao = new AjaxDAO();
		
		int count = dao.count();
		
		resp.sendRedirect("/ajax/ex01.do?count=" + count);
		
	}

}
