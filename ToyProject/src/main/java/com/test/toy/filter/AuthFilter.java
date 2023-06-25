package com.test.toy.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthFilter implements Filter {

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
//		System.out.println("권한 체크");
		
		//누가 요청하는지?
		HttpServletRequest req = (HttpServletRequest)request;
		
		HttpSession session = req.getSession();
		
//		if (session.getAttribute("id")==null) {
//			System.out.println("비회원");
//		} else {
//			System.out.println(session.getAttribute("id"));
//		}
		
		//익명 사용자 배제
		//System.out.println(req.getRequestURI());
		
		if (session.getAttribute("id") == null) {
			
			if (req.getRequestURI().endsWith("add.do")
					|| req.getRequestURI().endsWith("edit.do")
					|| req.getRequestURI().endsWith("del.do")
					|| req.getRequestURI().endsWith("info.do")) {
				
				PrintWriter writer = ((HttpServletResponse)response).getWriter();
				writer.write("<script>alert('failed'); location.href='/toy/index.do';</script>");
				writer.close();
				
				return;
			}
			
		}
		
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		
	}

	
	
}
