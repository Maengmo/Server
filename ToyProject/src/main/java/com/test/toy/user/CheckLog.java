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

@WebServlet("/user/checklog.do")
public class CheckLog extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//CheckLog.java
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		
		HttpSession session = req.getSession();
		
		UserDAO dao = new UserDAO();
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("year", year);
		map.put("month", month);
		map.put("id", (String)session.getAttribute("id"));
		
		List<LogDTO> list = dao.checkLog(map);
		
		System.out.println(list);
		
		JSONArray arr = new JSONArray();
		
		for (LogDTO dto : list) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("dd", dto.getHour());
			obj.put("cnt", dto.getCnt());
			
			arr.add(obj);
			
		}
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.print(arr);
		writer.close();
		
	}

}























