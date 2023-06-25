package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.repository.BoardDAO;
import com.test.toy.board.repository.CommentDTO;

@WebServlet("/board/comment.do")
public class Comment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Comment.java
		HttpSession session = req.getSession();
		
		String content = req.getParameter("content");
		String bseq = req.getParameter("bseq");
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = req.getParameter("search");
		
		BoardDAO dao = new BoardDAO();
		CommentDTO cdto = new CommentDTO();
		
		cdto.setContent(content);
		cdto.setBseq(bseq);
		cdto.setId((String)session.getAttribute("id"));
		
		int result = dao.addContent(cdto);
		
		if (result == 1) {
			resp.sendRedirect("/toy/board/view.do?seq=" + bseq + "&column=" + column + "&word=" + URLEncoder.encode(word, "UTF-8")  + "&search=" + search);
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
	}

}
