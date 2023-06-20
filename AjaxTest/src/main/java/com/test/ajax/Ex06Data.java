package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex06data.do")
public class Ex06Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Ex06Data.java

//		String txt1 = req.getParameter("txt1");
//		System.out.println("txt1 : " + txt1);
		
		//5초 동안 업무를 잠시 중단...
		try {
			Thread.sleep(5000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Calendar now = Calendar.getInstance();
		
		PrintWriter writer = resp.getWriter();
		writer.write("ajax:" + String.format("%tT", now));
		writer.close();
		
	}

}
