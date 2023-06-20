package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex08check.do")
public class Ex08Check extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex08Check.java
		
		String id = req.getParameter("id");
		
		if (id != null && !id.equals("")) {
			AjaxDAO dao = new AjaxDAO();
			
			int result = dao.checkID(id);
			
			req.setAttribute("result", result);
			req.setAttribute("id", id);
		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex08check.jsp");
		dispatcher.forward(req, resp);
	}

}