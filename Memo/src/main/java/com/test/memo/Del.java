package com.test.memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/del.do")
public class Del extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Del.java
		
		//delOk.java 역할
		//1. 데이터 가져오기
		//2. DB 작업 > delete
		//3. 피드백
		
		//1. 
		// 인코딩
		req.setCharacterEncoding("UTf-8");
		
		String seq = req.getParameter("seq");
		
		
		//2. 
		MemoDAO dao = new MemoDAO();
		
		int result = dao.del(seq);
		
		if(result == 1) {
			resp.sendRedirect("/memo/list.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.write("<script>alert('failed'); history.back();</script>");
			writer.close();
		}
		
	}

}