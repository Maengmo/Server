package com.test.crawling;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class Ex02 {

	public static void main(String[] args) {
		
		try {
			
			String url = "http://www.yes24.com/Product/Goods/118625612";
			
			Document doc = Jsoup.connect(url).get();
			
			//#yDetailTopWrap > div.topColRgt > div.gd_infoTop > div > h2
			
			Element title = doc.select("#yDetailTopWrap > div.topColRgt > div.gd_infoTop > div > h2").get(0);

			System.out.println(title.text());
			
			System.out.println(doc.select("#yDetailTopWrap > div.topColRgt > div.gd_infoTop > span.gd_pubArea > span.gd_auth > a").get(0).text());
			
			System.out.println(doc.select("#yDetailTopWrap > div.topColRgt > div.gd_infoBot > div.gd_infoTbArea > div:nth-child(3) > table > tbody > tr.accentRow > td > span > em").get(0).text());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
