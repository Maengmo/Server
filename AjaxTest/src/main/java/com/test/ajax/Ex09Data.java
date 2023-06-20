package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex09data.do")
public class Ex09Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex09Data.java

		String dong = req.getParameter("dong");
		
		AjaxDAO dao = new AjaxDAO();
		
		List<ZipCode> list = dao.search(dong);
		
		/*
		 
		 	[
		 		"[012-345] 서울시 강남구 역삼동",
		 		"[012-345] 서울시 강남구 역삼동",
		 		"[012-345] 서울시 강남구 역삼동",
		 		"[012-345] 서울시 강남구 역삼동",
		 		"[012-345] 서울시 강남구 역삼동"
		 	]
		 
		 */
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		String temp = "[";
		
		for(ZipCode dto : list) {
			
			temp += String.format("\"[%s] %s %s %s %s\","
									, dto.getZip()
									, dto.getSido()
									, dto.getGugun()
									, dto.getDong()
									, dto.getBunji());
			
		}
		
		temp = temp.substring(0, temp.length()-1);
		
		temp += "]";
		
		writer.print(temp);
		writer.close();
		
		
	}

}









