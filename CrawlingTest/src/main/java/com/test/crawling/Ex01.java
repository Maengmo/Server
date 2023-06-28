package com.test.crawling;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex01 {

	public static void main(String[] args) {
		
		//Jsoup
		//- 브라우저처럼 사이트 접속 > 접속한 URL 페이지 소스 읽기 > 브라우저처럼 소스 분석 > 탐색 + 데이터 읽기
		//- JavaScript DOM 느낌
		
		
		try {
			String url = "http://localhost:8090/crawling/ex01.do";
			
			//문서 최상위 객체 > 읽어온 페이지 소스를 관리 객체
			Document doc = Jsoup.connect(url).get();
			
			//System.out.println(doc.html());
			
			//선택자를 이용하여 가져오기
			Elements list = doc.select("h1");
			
			Element h1 = list.get(0);
			
			System.out.println(h1.text());
			
			Elements plist = doc.select(".desc");
			
			for (Element e : plist) {
				System.out.println(e.text());
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
