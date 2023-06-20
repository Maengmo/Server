package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/ex14data.do")
public class Ex14Data extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex14Data.java
		//ex14.jsp의 n을 받아오는 역할
		int n = Integer.parseInt(req.getParameter("n"));
		
		AjaxDAO dao = new AjaxDAO();
		
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("begin", n);
		map.put("end", n+9);
		
		List<Ex13DTO> list = dao.listProduct2(map);
		
		JSONArray arr = new JSONArray();
		
		for (Ex13DTO dto : list) {
			
			JSONObject obj = new JSONObject();
			obj.put("seq", dto.getSeq());
			obj.put("name", dto.getName());
			obj.put("price", dto.getPrice());
			obj.put("color", dto.getColor());
			
			arr.add(obj);
			
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(arr);
		
		writer.close();
		
	}

}