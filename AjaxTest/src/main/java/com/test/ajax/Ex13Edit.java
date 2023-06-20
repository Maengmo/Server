package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/ex13edit.do")
public class Ex13Edit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex13Edit.java
		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String price = req.getParameter("price");
		String color = req.getParameter("color");
		
		AjaxDAO dao = new AjaxDAO();
		
		Ex13DTO dto = new Ex13DTO();
		
		dto.setSeq(seq);
		dto.setName(name);
		dto.setPrice(price);
		dto.setColor(color);
		
		int result = dao.editProduct(dto);
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		
		writer.print(obj);
		writer.close();
		
		
	}

}

























