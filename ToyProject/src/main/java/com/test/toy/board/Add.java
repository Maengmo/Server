package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.repository.BoardDAO;
import com.test.toy.board.repository.BoardDTO;

@WebServlet("/board/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Add.java
		String mode = req.getParameter("mode");
		
		String thread = req.getParameter("thread");
		String depth = req.getParameter("depth");
		
		req.setAttribute("mode", mode);
		
		req.setAttribute("thread", thread);
		req.setAttribute("depth", depth);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/add.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//AddOk.java
		
		
		//1. 데이터 가져오기
		//2. DB 작업 > insert
		//3. 결과
		
		HttpSession session = req.getSession();
		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		String mode = req.getParameter("mode");
		
		
		BoardDTO dto = new BoardDTO();
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setId((String)session.getAttribute("id"));
		
		BoardDAO dao = new BoardDAO();
		
		int thread = -1;
		int depth = -1;
		
		//계산
		if (mode.equals("new")) {
			//새글 쓰기
			//1. 현존하는 모든 게시물 중에서 가장 큰 thread값을 찾아서, 그 값에 +1000을 한 값을 새글의 thread값으로 넣는다.
			thread = dao.getMaxThread() + 1000;
			
			//2. 새글의 depth는 항상 0 을 넣는다.
			depth = 0;
			
		} else {
			int parentThread = Integer.parseInt(req.getParameter("thread"));
			int parentDepth = Integer.parseInt(req.getParameter("depth"));
			//답변글 쓰기
			//1. 현존하는 모든 게시물의 thread값을 대상으로, 현재 작성중인 답변글의 부모글 thread 값보다 작고, 이전 새글의 thread값보다 큰 thread를 모두 찾아서 -1을 한다.
			int previousThread = (int)Math.floor((parentThread - 1) / 1000) * 1000;
			
			HashMap<String,Integer> map = new HashMap<String,Integer>();
			
			map.put("praentThread", parentThread);
			map.put("previousThread", previousThread);
			
			dao.updateThread(map);
			
			//2. 답변글의 thread값은 부모글의 thread-0을 넣는다.
			thread = parentThread - 1;
			
			//3. 답변글의 depth값을 부모글의 depth+1을 넣는다.
			depth = parentDepth + 1;
			
		}
		
		dto.setThread(thread);
		dto.setDepth(depth);
		
		
		
		int result = dao.add(dto);
		
		if(result == 1) {
			resp.sendRedirect("/toy/board/board.do");
		} else {
			PrintWriter writer = resp.getWriter();
			writer.print("<script>alert('failed');history.back();</script>");
			writer.close();
		}
		
		
		
	}
}



















