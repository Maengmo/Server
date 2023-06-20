package com.test.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex07data.do")
public class Ex07Data extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      //Ex07Data.java

      String type = req.getParameter("type");
      
      if (type.equals("1")) {
         m1(req, resp);
      } else if (type.equals("2")) {
         m2(req, resp);
      } else if (type.equals("3")) {
         m3(req, resp);
      } else if (type.equals("4")) {
         m4(req, resp);
      } else if (type.equals("5")) {
         m5(req, resp);
      } else if (type.equals("6")) {
         m6(req, resp);
      } 
      
   }

   private void m6(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
	   AjaxDAO dao = new AjaxDAO();
	   
	   List<AddressDTO> list = dao.listAddress();
	   
	   /*
	     
	     [
	     	{
	     		"seq" : "1",
	     		"name" : "이름",
	     		"age" : 20,
	     		"tel" : "010"
	     		"address" : "주소"
	     	}
	     	,
	     	{
	     		"seq" : "1",
	     		"name" : "이름",
	     		"age" : 20,
	     		"tel" : "010"
	     		"address" : "주소"
	     	},
	     ]
	     
	   */
	   
	   resp.setContentType("application/json");
	   resp.setCharacterEncoding("UTF-8");
	   
	   PrintWriter writer = resp.getWriter();
	   
	   String temp = "";
	   
	   temp += ("[");
	   
	   for (AddressDTO dto : list) {
		   
		   temp += "{";
         temp += String.format("\"seq\": \"%s\",", dto.getSeq());
         temp += String.format("\"name\": \"%s\",", dto.getName());
         temp += String.format("\"age\": %s,", dto.getAge());
         temp += String.format("\"tel\": \"%s\",", dto.getTel());
         temp += String.format("\"address\": \"%s\"", dto.getAddress());
         temp += "}";
         temp += ",";
      }
	   
	   temp = temp.substring(0, temp.length()-1);
	   
	   temp += "]";
	   
	   writer.print(temp);
	   
	   writer.close();
   }

   private void m5(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
	   AjaxDAO dao = new AjaxDAO();
	   ResearchDTO dto = dao.getResearch(1);
	   
	   /*
	     
	    	JSON
	    	- 키와 값을 쌍옴표로 표기한다.
	    	- 메소드는 표시 불가
	    	
	    	{
	    		"키" : "값",
	    		"키" " "값"
	    	}
	    	
	    	[ 10, 20, 30 ]
	    	
	    	[
	    		{
	    			"키" : "값"
	    			"키" : "값"
	    		}
	    	]
	    	
	    	{
	    		"question" : "질문"
	    	}
	    
	    */
	   	
	   
	    resp.setContentType("application/json");
	    resp.setCharacterEncoding("UTF-8");
	   
	   	PrintWriter writer = resp.getWriter();
	   	
	   	writer.print("{");
	   	writer.printf("'question' : \"%s\"", dto.getQuestion());
	   	writer.print("}");
	   	
	   	writer.close();
   }

   private void m4(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      AjaxDAO dao = new AjaxDAO();
      
      List<AddressDTO> list = dao.listAddress();
      
      /* 
      
         <?xml version='1.0' encoding='UTF-8'?>
         <list>
            <item>
               <seq>1</seq>
               <name>홍길동</name>
               <age>20</age>
               <tel>010</tel>
               <address>서울시</address>
            </item>
         </list>
      
      */
      
      resp.setContentType("text/xml");
      resp.setCharacterEncoding("UTF-8");
      
      PrintWriter writer = resp.getWriter();
      
      writer.print("<?xml version='1.0' encoding='UTF-8'?>");
      
      writer.print("<list>");
      
      for (AddressDTO dto : list) {
         writer.print("<item>");
            writer.printf("<seq>%s</seq>", dto.getSeq());
            writer.printf("<name>%s</name>", dto.getName());
            writer.printf("<age>%s</age>", dto.getAge());
            writer.printf("<tel>%s</tel>", dto.getTel());
            writer.printf("<address>%s</address>", dto.getAddress   ());
         writer.print("</item>");
      }
      
      writer.print("</list>");
      
      writer.close();
      
   }

   private void m3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      AjaxDAO dao = new AjaxDAO();
      
      ResearchDTO dto = dao.getResearch(1);
      
      resp.setCharacterEncoding("UTF-8");
      resp.setContentType("text/plain");
      
      PrintWriter writer = resp.getWriter();
      
      writer.print("<?xml version='1.0' encoding='UTF-8'?>");
      writer.printf("<question id='q1'>%s</question>"
                  , dto.getQuestion());
      writer.close();
      
   }

   private void m2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      AjaxDAO dao = new AjaxDAO();
      
      List<AddressDTO> list = dao.listAddress();
      
      //CSV
      String temp = "";
      
      for (AddressDTO dto : list) {
         temp += String.format("%s,%s,%s,%s,%s\r\n"
                           , dto.getSeq()
                           , dto.getName()
                           , dto.getAge()
                           , dto.getTel()
                           , dto.getAddress());
      }
      
      resp.setContentType("text/plain");
      resp.setCharacterEncoding("UTF-8");
      
      PrintWriter writer = resp.getWriter();
      
      writer.print(temp);
      
      writer.close();
      
   }

   private void m1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      AjaxDAO dao = new AjaxDAO();
      
      int count = dao.count();
      
      
      //서버가 브라우저(Ajax)에게 건내는 데이터 이런 형식이다~ 알려주는 작업
      resp.setContentType("text/plain"); //텍스트 형식
      resp.setCharacterEncoding("UTF-8");
      
      
      PrintWriter writer = resp.getWriter();
      
      writer.print(count + "");
      
      writer.close();
      
   }

}













