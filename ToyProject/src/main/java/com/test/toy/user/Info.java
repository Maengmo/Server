package com.test.toy.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.user.repository.UserDAO;
import com.test.toy.user.repository.UserDTO;

@WebServlet("/user/info.do")
public class Info extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Info.java
		//세션에서 정보를 얻어로기 위해 선언
		HttpSession session = req.getSession();
		
		UserDAO dao = new UserDAO();
		
		//개인정보
		//세션에서 id를 가져옴.
		UserDTO dto = dao.get((String)session.getAttribute("id"));
		dto.setProfile(dto.getProfile().replace("\r\n", "<br>"));
		
		//활동 내역
		Map<String,String> map = dao.getCount((String)session.getAttribute("id"));
		
		
		
		//jsp에게 전달하는 구문
		req.setAttribute("dto", dto);
		req.setAttribute("map", map);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/info.jsp");
		dispatcher.forward(req, resp);
	}

}
