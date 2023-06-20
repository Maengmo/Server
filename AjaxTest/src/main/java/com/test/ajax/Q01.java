package com.test.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/q01.do")
public class Q01 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Q01.java
		String name = req.getParameter("name");

		ZipcodeDAO dao = new ZipcodeDAO();
		
		List<ZipcodeDTO> list = dao.listZipcode(name);
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/q01.jsp");
		dispatcher.forward(req, resp);
	}

}