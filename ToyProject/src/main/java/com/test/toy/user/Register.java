package com.test.toy.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.toy.user.repository.UserDAO;
import com.test.toy.user.repository.UserDTO;

@WebServlet("/user/register.do")
public class Register extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Register.java

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//RegisterOk.java
		//1. 데이터 가져오기
		//2. DB 작업 > insert
		//3. 결과
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
					
						req,
						req.getRealPath("/asset/pic"),
						1024 * 1024 * 10,
						"UTF-8",
						new DefaultFileRenamePolicy()
					);
					
			System.out.println(req.getRealPath("/asset/pic"));
			
			String id = multi.getParameter("id");
			String pw = multi.getParameter("pw");
			String name = multi.getParameter("name");
			String email = multi.getParameter("email");
			String pic = multi.getFilesystemName("pic");
			String profile = multi.getParameter("profile");
			
			UserDTO dto = new UserDTO();
			
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPic(pic);
			dto.setProfile(profile);
			
			UserDAO dao = new UserDAO();
			
			int result = dao.register(dto);
			
			if (result == 1) {
				resp.sendRedirect("/toy/index.do");
			} else {
				PrintWriter writer = resp.getWriter();
				writer.print("<script>alert('failed');history.back();</script>");
				writer.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
























