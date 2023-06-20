package com.test.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/q05add.do")
public class Q05Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Q05Add.java

		try {
			
			MultipartRequest multi = new MultipartRequest(
								req,
								req.getRealPath("/pic"),
								1024 * 1024 * 100,
								"URF-8",
								new DefaultFileRenamePolicy()
					);
			
			String name = multi.getParameter("name");
			String tel = multi.getParameter("tel");
			String address = multi.getParameter("address");
			
			Q05DTO dto = new Q05DTO();
			
			dto.setName(name);
			dto.setTel(tel);
			dto.setAddress(address);
			
			AjaxDAO dao = new AjaxDAO();
			
			int result = dao.addlist(dto);
					
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
