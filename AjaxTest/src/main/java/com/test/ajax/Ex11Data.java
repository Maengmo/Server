package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex11data.do")
public class Ex11Data extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex11Data.java
		String x = req.getParameter("x");
		String y = req.getParameter("y");
		String ck = req.getParameter("ck");
		
		System.out.println(x);
		System.out.println(y);
		System.out.println(ck);
		
		Ex11DTO dto = new Ex11DTO();
		
		dto.setX(x);
		dto.setY(y);
		dto.setCk(ck);
		
		AjaxDAO dao = new AjaxDAO();
		
		//1. 검사
		// - select
		//2. 처음 클릭
		// - insert
		//3. 다시 클릭
		// - update
		
		//*** DAO에서는 1개의 메소드가 1개의 업무만 구현한다.
		//	  DAO 안에서는 알고리즘을 구현하지 않는다.
		//	  DAO.메소드() == 딱 1개의 SQL만 실행
		
		//boolean result = dao.checkCell(dto);
		
		if (dao.checkCell(dto)) {
			dao.editCell(dto);
		} else {
			dao.addCell(dto);
		}
		
		
		
	}

}