package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/delcomment.do")
public class DelComment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DelComment.java

		String seq = req.getParameter("seq");
		String cseq = req.getParameter("cseq");
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.delComment2(cseq);
		
	   if (result == 1) {
         resp.sendRedirect("/toy/board/view.do?seq=" + seq);
       } else {
         PrintWriter writer = resp.getWriter();
         writer.print("<script>alert('failed'); history.back();</script>");
         writer.close();
       }
	}

}
