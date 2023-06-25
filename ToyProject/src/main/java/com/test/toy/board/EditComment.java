package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.toy.board.repository.BoardDAO;
import com.test.toy.board.repository.CommentDTO;

@WebServlet("/board/editcomment.do")
public class EditComment extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      //EditComment.java
      String bseq = req.getParameter("bseq");
      String cseq = req.getParameter("cseq");
      String content = req.getParameter("content");
      
      
      BoardDAO dao = new BoardDAO();
      CommentDTO cdto = new CommentDTO();
      
      cdto.setSeq(cseq);
      //cdto.setBseq(bseq);
      cdto.setContent(content);
      
      int result = dao.editComment(cdto);
      
      if (result == 1) {
         resp.sendRedirect("/toy/board/view.do?seq=" + bseq);
      } else {
         PrintWriter writer = resp.getWriter();
         writer.print("<script>alert('failed'); history.back();</script>");
         writer.close();
      }
      
      
   }

}
