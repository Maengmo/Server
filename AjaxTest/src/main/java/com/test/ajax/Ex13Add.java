package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ex13add.do")
public class Ex13Add extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex13Add.java
		
		try {
			
			//System.out.println(req.getRealPath("/pic"));
			
			MultipartRequest multi = new MultipartRequest(
										req,
										req.getRealPath("/pic"),
										1024 * 1024 * 100,
										"UTF-8",
										new DefaultFileRenamePolicy()
									);
					
			
			String name = multi.getParameter("name");
			String price = multi.getParameter("price");
			String color = multi.getParameter("color");
			String pic = multi.getFilesystemName("pic");
			
			Ex13DTO dto = new Ex13DTO();
			
			dto.setName(name);
			dto.setPrice(price);
			dto.setColor(color);
			dto.setPic(pic);
			
			AjaxDAO dao = new AjaxDAO();
			
			int result = dao.addProduct(dto);
			
			//방금 등록한 상품 가져오기
			Ex13DTO newProduct = dao.getProduct();
			
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			
			PrintWriter writer = resp.getWriter();
			//writer.printf("{ \"result\": %d }", result);
			
			JSONObject obj = new JSONObject();
			obj.put("result", result);
			obj.put("pic", newProduct.getPic());
			obj.put("seq", newProduct.getSeq());
			
			writer.print(obj);
			
			writer.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
		
	}

}
