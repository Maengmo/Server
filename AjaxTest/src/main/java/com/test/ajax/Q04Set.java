package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/q04set.do")
public class Q04Set extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Q04Set.java
		
		String x = req.getParameter("x");
		String y = req.getParameter("y");
		
		System.out.println(x);
		System.out.println(y);
		
		Q04DAO dao = new Q04DAO();
		
		Q04DTO dto = new Q04DTO();
		
		dto.setX(x);
		dto.setY(y);
		
		int result = dao.update(dto);
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		writer.print(obj);
		writer.close();
		
		
		
	}

}
