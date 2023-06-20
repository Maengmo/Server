package com.test.ajax;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/ex10data.do")
public class Ex10Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex10Data.java
//		m1(req, resp);
//		m2(req, resp);
//		m3(req, resp);
//		m4(req, resp);
		m5(req, resp);
		
	}
	
	private void m5(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//List<DTO>
		
		AjaxDAO dao = new AjaxDAO();
		
		List<AddressDTO> list = dao.listAddress();
		
		JSONArray arr = new JSONArray();
		
		for (AddressDTO dto : list) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("name", dto.getName());
			obj.put("age", dto.getAge());
			obj.put("address", dto.getAddress());
			
			arr.add(obj);
			
		}
		
		System.out.println(arr);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(arr);
		
		writer.close();
		
	}

	private void m4(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DTO
		AjaxDAO dao = new AjaxDAO();
		
		ResearchDTO dto = dao.getResearch(1);
		
		JSONObject obj = new JSONObject();
		//obj.put("name", "홍길동");
		//obj.put("age", "20");
		
		obj.put("question", dto.getQuestion());
		obj.put("seq", dto.getSeq());
		
		//{"name":"홍길동","age":"20"}
		//System.out.println(obj.toString());
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(obj);
		
		writer.close();
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex10Data.java
//		m1(req, resp);
//		m2(req, resp);
		m3(req, resp);
		
	}

	private void m3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	      System.out.println(req.getParameter("txt1"));
	      
	      BufferedReader reader = new BufferedReader(new InputStreamReader(req.getInputStream()));
	      
	      String line = reader.readLine();
	      
	      reader.close();
	      
//	      org.json
	      
	      // JSON 포맷의 문자열 > 자바 오브젝트로 변환
	      
	      JSONParser parser = new JSONParser();
	      
	      try {
	    	 
	    	//JSON Object > 자바 오브젝트
			JSONObject obj = (JSONObject)parser.parse(line);
			
			System.out.println(obj.get("txt1"));
			System.out.println(obj.get("txt2"));
			System.out.println(obj.get("txt3"));
			System.out.println(obj.get("txt4"));
			System.out.println(obj.get("txt5"));
			
		} catch (ParseException e) {

			e.printStackTrace();
		}
	      
   }

	private void m2(HttpServletRequest req, HttpServletResponse resp) {
		
		//String list = req.getParameter("list");
		//System.out.println(list);
		
		String[] list = req.getParameterValues("list");
		
		for (String item : list) {
			System.out.println(item);
		}
		
	}

	private void m1(HttpServletRequest req, HttpServletResponse resp) {
		
		//String data = req.getParameter("data");
		//System.out.println(data);
		
		String txt1 = req.getParameter("txt1");
		String txt2 = req.getParameter("txt2");
		String txt3 = req.getParameter("txt3");
		String txt4 = req.getParameter("txt4");
		String txt5 = req.getParameter("txt5");
		
		System.out.println(txt1);
		System.out.println(txt2);
		System.out.println(txt3);
		System.out.println(txt4);
		System.out.println(txt5);
		
	}

}
