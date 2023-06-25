package com.test.toy.user;

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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.toy.user.repository.LogDTO;
import com.test.toy.user.repository.UserDAO;

@WebServlet("/user/log.do")
public class Log extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Log.java
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String date = req.getParameter("date");
		
		HttpSession session = req.getSession();
		
		UserDAO dao = new UserDAO();
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("year", year);
		map.put("month", month);
		map.put("date", date);
		map.put("id", (String)session.getAttribute("id"));
		
		List<LogDTO> list = dao.listLog(map);
		List<LogDTO> clist = dao.clistLog(map);
		List<LogDTO> plist = dao.plistLog(map);
		
		//System.out.println(list);
		
		//List<LogDTO> >> JSONArray(JSONObject)
		JSONObject root = new JSONObject();
		
		JSONArray arr = new JSONArray();
		
		for (LogDTO dto : list) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("hour", dto.getHour());
			obj.put("cnt", dto.getCnt());
			
			arr.add(obj);
			
		}
		
		root.put("list", arr);
		
		JSONArray carr = new JSONArray();
		
		for (LogDTO dto : clist) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("hour", dto.getHour());
			obj.put("cnt", dto.getCnt());
			
			carr.add(obj);
			
		}
		
		root.put("clist", carr);
		
		//플레이스 카운트
		
		JSONArray parr = new JSONArray();
		
		for (LogDTO dto : plist) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("hour", dto.getHour());
			obj.put("cnt", dto.getCnt());
			
			parr.add(obj);
			
		}
		
		root.put("plist", parr);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.print(root);
		writer.close();
		
		System.out.println(root);
		
	}

}
