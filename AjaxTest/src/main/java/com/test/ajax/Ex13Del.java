package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/ex13del.do")
public class Ex13Del extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex13Del.java
		String seq = req.getParameter("seq");
		
		AjaxDAO dao = new AjaxDAO();
		
		int result = dao.delProduct(seq);
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.print(obj);
		writer.close();
		
	}

}


















