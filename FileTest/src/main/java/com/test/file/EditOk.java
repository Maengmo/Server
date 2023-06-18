package com.test.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/editok.do")
public class EditOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//EditOk.java
		
		//1. 데이터 가져오기
		//2. DB 작업 > DAO 위임 > update
		//3. 첨부 파일 교체
		
		String name = "";
		String filename = "";
		String seq = "";
		
		try {
			
			MultipartRequest multi = new MultipartRequest(
					req,
					req.getRealPath("/files"),
					1034 *1024 *100,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
			
			System.out.println("attach : " + multi.getFilesystemName("attach"));
			
			name = multi.getParameter("name");
			filename = multi.getFilesystemName("attach");
			seq = multi.getParameter("seq");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		FileDAO dao = new FileDAO();
		
		if(filename != "") {
			
			//기존 파일 삭제 > 새 파일 교체
			File file = new File(req.getRealPath("/files") + "\\" + dao.get(seq).getFilename());
			
			file.delete();
			
		}
		
		FileDTO dto = new FileDTO();
		
		dto.setName(name);
		dto.setFilename(filename);
		dto.setSeq(seq);
		
		int result = dao.edit(dto);
		
		req.setAttribute("result", result);
		req.setAttribute("seq", seq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/editok.jsp");
		dispatcher.forward(req, resp);
	}

}