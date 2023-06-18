package com.test.file;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//List.java
		
		//1. DB 작업 > DAO 위임 > select...
		//2. 결과 반환(List<FileDTO>)
		//3. JSP 호출하기
		
		FileDAO dao = new FileDAO();
		java.util.List<FileDTO> list = dao.list();
		
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/list.jsp");
		dispatcher.forward(req, resp);
	}

}