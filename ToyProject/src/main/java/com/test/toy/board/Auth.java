package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.repository.BoardDAO;
import com.test.toy.board.repository.BoardDTO;

public class Auth {

	public static boolean check(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		//글쓴이 본인? or 관리자?
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = dao.get(seq);
		
		if (!session.getAttribute("id").equals(dto.getId())
				&& !session.getAttribute("lv").toString().equals("3")) {
			
			PrintWriter writer = resp.getWriter();
			writer.write("<script>alert('failed'); location.href='/toy/index.do';</script>");
			writer.close();
			
			return true;
			
		}
		
		return false;
	}

	
	
}
