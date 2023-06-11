package com.test.mvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//자동 import : Ctrl + shift + o

@WebServlet("/address.do")
public class Address extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Address.java
		
		//DB 작업 > select > 주소록 몇명?
		//DB 작업 담당자 > "AddressDAO.java"
		
		AddressDAO dao = new AddressDAO();
		int count = dao.getCount();
		
		int[] nums = {10, 20, 30, 40, 50};
		
		List<Integer> nums2 = new ArrayList<Integer>();
		nums2.add(100);
		nums2.add(200);
		nums2.add(300);
		
		Map<String,Integer> nums3 = new HashMap<String,Integer>();
		nums3.put("kor", 100);
		nums3.put("eng", 90);
		nums3.put("math", 80);
		
		AddressVO vo = new AddressVO();
		vo.setSeq("1");
		vo.setName("홍길동");
		vo.setAge("20");
		vo.setTel("010-1234-1234");
		vo.setAddress("서울시 강남구 역삼동");
		
		String[] names = {"홍길동", "아무개", "하하하", "호호호", "후후후"};
		

		Calendar birthday = Calendar.getInstance();
		birthday.set(1998, 7, 22);
		
		Date date = birthday.getTime();
		
		ArrayList<AddressVO> list = dao.list();
		
		req.setAttribute("count", count);
		req.setAttribute("nums", nums);
		req.setAttribute("nums2", nums2);
		req.setAttribute("nums3", nums3);
		req.setAttribute("vo", vo);

		req.setAttribute("a", 10);
		req.setAttribute("b", 3);
		
		req.setAttribute("names", names);
		
		//CSV
		req.setAttribute("colors", "빨강,노랑,파랑:검정,초록");
		
		req.setAttribute("birthday", birthday);
		
		req.setAttribute("list", list);
		
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/mvc/address.jsp");
		dispatcher.forward(req, resp);
	}

}