package com.test.ajax;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex14.do")
public class Ex14 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex14.java
		AjaxDAO dao = new AjaxDAO();
		
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("begin", 1);
		map.put("end", 10);
		
		List<Ex13DTO> list = dao.listProduct2(map);
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex14.jsp");
		dispatcher.forward(req, resp);
	}

}
