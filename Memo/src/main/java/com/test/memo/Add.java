package com.test.memo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Add.java
		
		//1. DB 작업 > select 카테고리
		
		MemoDAO dao = new MemoDAO();
		
		java.util.List<CategoryDTO> clist = dao.clist(); 
		
		req.setAttribute("clist", clist);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/add.jsp");
		dispatcher.forward(req, resp);
	}//doGet
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//AddOk.java 역할
		//1. 데이터 가져오기
		//2. DB 작업 > insert
		//3. 피드백
		
		//1. 
		// 인코딩
		req.setCharacterEncoding("UTf-8");
		
		String memo = req.getParameter("memo");
		String category = req.getParameter("category");
		
		//2. 
		MemoDAO dao = new MemoDAO();
		
		MemoDTO dto = new MemoDTO();
		dto.setMemo(memo);
		dto.setCseq(category);
		
		int result = dao.add(dto);
		
		if(result == 1) {
			resp.sendRedirect("/memo/list.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.write("<script>alert('failed'); history.back();</script>");
			writer.close();
		}
	}

}
