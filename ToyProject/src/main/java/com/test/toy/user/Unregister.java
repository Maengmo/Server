package com.test.toy.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.user.repository.UserDAO;

@WebServlet("/user/unregister.do")
public class Unregister extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Unregister.java
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/unregister.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//탈퇴
		//1. delete from tblUser where id = 'hong';
		//2. update tblUser set 정보 변경 where id = 'hong';
		// - id 보관 
		
		HttpSession session = req.getSession();
		
		UserDAO dao = new UserDAO();
		
		int result = dao.unregister((String)session.getAttribute("id"));
		
		if (result == 1) {
			
			session.removeAttribute("id");
			session.removeAttribute("lv");
			
			resp.sendRedirect("/toy/index.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
	}

}
