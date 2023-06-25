package com.test.toy.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.toy.user.repository.UserDAO;
import com.test.toy.user.repository.UserDTO;

@WebServlet("/user/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Login.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//LoginOk.java
		
		//1. 데이터 가져오기
		//2. DB 작업 > 인증
		//3. 결과 > 인증 티켓 발부
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		UserDTO dto = new UserDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		
		UserDAO dao = new UserDAO();
		
		//dto : id,pw 전달
		//result : 로그인한 회원 정보 반환(아이디, 이름, 등급 등..) > 세션 추가
		UserDTO result = dao.login(dto);
		
		if (result != null) {
			
			//로그인 성공
			req.getSession().setAttribute("id", id); //인증 티켓 발급
			req.getSession().setAttribute("lv", result.getLv()); //레벨
			
			resp.sendRedirect("/toy/index.do");
			
		} else {
			
			//로그인 실패
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
			
		}
		
	}

}





















