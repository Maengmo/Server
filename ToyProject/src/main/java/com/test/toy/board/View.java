package com.test.toy.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.repository.BoardDAO;
import com.test.toy.board.repository.BoardDTO;
import com.test.toy.board.repository.CommentDTO;

@WebServlet("/board/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//View.java
		
		//1. 데이터 가져오기(seq)
		//2. DB 작업 > select	
		//3. 결과 > JSP 호출하기
		
		HttpSession session = req.getSession();
		
		//무분별한 조회 막기
		//- 무분별 새로 고침 > 조회수 증가X
		//- 다른 경로를 통해서 유입
		//	- list.do > view.do > 조회수 증가O
		//	- view.do 즐겨찾기 > 조회수 증가O
		//  - 링크 > 조회수 증가 O
		
		//요철 헤더 > referer
		//현재 페이지릴 보기전에 어디서 왔는지? 이전 페이지 주소반환
		//String referer = req.getHeader("referer");
		//System.out.println(referer);
		
		
		//1.
		String seq = req.getParameter("seq");
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = req.getParameter("search");
		
		//2.
		BoardDAO dao = new BoardDAO();
		
		//무분별한 조회수 막기 ( 새로고침 막기 )
		if (session.getAttribute("read") == null
					|| session.getAttribute("read").toString().equals("n")) {
			
			//조회수 증가
			dao.updateReadCount(seq);
			session.setAttribute("read", "y");
		}
		
		
		BoardDTO dto = dao.get(seq);
		
		
		String content = dto.getContent();
		
		//HTML 태그 이스케이프
		content = content.replace("<", "&lt;")
						 .replace(">", "&gt;");
		
		//글 내용 개행 문자 처리
		content = content.replace("\r\n", "<br>");
		
		//내용으로 검색중.. 검색어 강조!!
		if(search.equals("y") && column.equals("content")) {
			//새글입니다.
			//<span style="background-color:yellow; color:red;">새글</span>입니다.
			content = content.replace(word, "<span style=\"background-color:yellow; color:red;\">" + word + "</span>");
		}
		
		dto.setContent(content);
		
		String subject = dto.getSubject();
		
		//태그 이스케이프
		subject = subject.replace("<", "&lt;")
				         .replace(">", "&gt;");
		
		dto.setSubject(subject);
		
		
		//댓글 목록 가져오기 
		List<CommentDTO> clist = dao.clist(seq);
		
		
		
		
		//3
		req.setAttribute("dto", dto);
		req.setAttribute("clist", clist);
		req.setAttribute("column", column);
		req.setAttribute("word", word);
		req.setAttribute("search", search);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/view.jsp");
		dispatcher.forward(req, resp);
	}

}
