package com.test.toy.board;

import java.io.IOException;
import java.util.HashMap;
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

@WebServlet("/board/board.do")
public class Board extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		test(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		test(req, resp);
	}

	private void test(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Board.java
		
		//1. DB 작업 > select
		//2. 결과 반환
		
		HttpSession session = req.getSession();
		
		//읽음 제어
		session.setAttribute("read", "n");
		
		
		//board.do == page=1
		//board.do?page=1
		//board.do?page=2
		
		//?page=5
		//?page=5&column=&word= > ""
		//?page=5&column=subject&word=자바 > "subject"
		
		String page = req.getParameter("page");
		
		//페이징
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 10;		//한페이지에서 출력할 게시물 수
		int totalPage = 0;		//총 페이지 수
		int begin = 0;			//
		int end = 0;			//
		int n = 0;				//
		int loop = 0;			//
		int blockSize = 10;		//한번에 보여질 페이지 개수
		
		if (page == null || page == "") nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		//nowPage > 현재 보려는 페이지 번호
		//board.do?page=1 > where rnum between 1 and 10
		//board.do?page=1 > where rnum between 11 and 20
		//board.do?page=1 > where rnum between 21 and 30
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;
		
		
		
		
		
		//2가지 용도로 호출
		//1. 일반 목록 보기
		//2. 검색 결과 보기 
		
		//1.
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = "n"; //검색중(O,X)
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		if ((column == null && word == null)
	             || (column.endsWith("") && word.equals(""))) {
	         search = "n";
	      } else {
	         search = "y";
	      }
		
//		System.out.println("search" + search);
		
		map.put("column", column);
		map.put("word", word);
		map.put("search", search);
		
		map.put("begin", begin + "");
		map.put("end", end + "");
		
		
		
		BoardDAO dao = new BoardDAO();
		
		List<BoardDTO> list = dao.list(map);
		
		//데이터 조작
		for (BoardDTO dto : list) {
			
			//날짜 출력(기준: 당일)
			//- 년월일 
			//- 시분초
//			System.out.println(dto.getRegdate());
			//dto.setRegdate(dto.getRegdate().substring(0, 10));
			
			String subject = dto.getSubject();
			
			//태그 이스케이프
			subject = subject.replace("<", "&lt;")
					         .replace(">", "&gt;");
			
			//제목에서 검색 중.. 검색어를 강조
			if(search.equals("y") && column.equals("subject")) {
				//새글입니다.
				//<span style="background-color:yellow; color:red;">새글</span>입니다.
				subject = subject.replace(word, "<span style=\"background-color:yellow; color:red;\">" + word + "</span>");
			}
			
			dto.setSubject(subject);
		}
		
		//페이징 작업
		//총 게시물
		totalCount = dao.getTotalCount(map);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		
		/*
		 
		  	<a href="/toy/board/board.do?page=1">[이전 10페이지]</a>
			<a href="/toy/board/board.do?page=1">1</a>
			<a href="/toy/board/board.do?page=2">2</a>
			<a href="/toy/board/board.do?page=3">3</a>
			<a href="/toy/board/board.do?page=4">4</a>
			<a href="/toy/board/board.do?page=5">5</a>
			<a href="/toy/board/board.do?page=6">6</a>
			<a href="/toy/board/board.do?page=7">7</a>
			<a href="/toy/board/board.do?page=8">8</a>
			<a href="/toy/board/board.do?page=9">9</a>
			<a href="/toy/board/board.do?page=10">10</a>
			<a href="/toy/board/board.do?page=1">[다음 10페이지]</a>
		 
		 */
		
		StringBuilder sb = new StringBuilder();
		
//		for (int i=1; i<=totalPage; i++) {
//			if (i == nowPage) {
//				sb.append(String.format(" <a href=\"#!\" style='color:tomato;'>%d</a> ", i));				
//			} else {
//				sb.append(String.format(" <a href=\"/toy/board/board.do?page=%d\">%d</a> ", i, i));			
//			}
//		}
		
		//board.do?page=1
		//[] 1 2 3 4 5 6 7 8 9 10 []
		
		//board.do?page=5
		//[] 1 2 3 4 5 6 7 8 9 10 []
		
		//board.do?page=10
		//[] 1 2 3 4 5 6 7 8 9 10 []
				
		//board.do?page=11
		//[] 11 12 13 14 15 16 17 18 19 20 []
		
		loop = 1;	//루프 변수
		n = ((nowPage -1) / blockSize) * blockSize + 1; //페이지 번호
		
		//이전 10페이지
		if(n == 1) {
			sb.append(String.format("<a href=\"#!\">[이전 %d페이지]</a>",blockSize ));			
		}else {
			sb.append(String.format("<a href=\"/toy/board/board.do?page=%d\">[이전 %d페이지]</a>", n-1 ,blockSize ));						
		}
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) {
				sb.append(String.format(" <a href=\"#!\" style='color:tomato;'>%d</a> ", n));				
			} else {
				sb.append(String.format(" <a href=\"/toy/board/board.do?page=%d\">%d</a> ", n, n));			
			}
			
			loop++;
			n++;
		}
		
		//다음 10페이지
		if(n > totalPage) {
			sb.append(String.format("<a href=\"#!\">[다음 %d페이지]</a>", blockSize));
		}else {
			sb.append(String.format("<a href=\"/toy/board/board.do?page=%d\">[다음 %d페이지]</a>", n, blockSize));			
		}

		req.setAttribute("list", list);
		req.setAttribute("map", map);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pagination", sb);
		
		//JSP 페이지 알 수 있는 정보
		//1. req를 통해서 전달된 정보
		//2. session/cookie
		//3. application 
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/board.jsp");
		dispatcher.forward(req, resp);
	}

}
