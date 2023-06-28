package com.test.crawling;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex03 {

	public static void main(String[] args) {
		
		
		try {
			
			//가져올 URL
			String url = "https://movie.daum.net/ranking/boxoffice/weekly";
			
			//URL을 연결 
			Document doc = Jsoup.connect(url).get();
			
			//System.out.println(doc.select(".list_movieranking").size());
			
			//자식 태그 찾기
			
			//영화 목록
			Elements list = doc.select(".list_movieranking li");
			
			System.out.println("영화 목록 : " + list.size() + "편");
			
			//데이터 가져오기
			for (Element movie :list) {
				
				//영화 제목
				String title = movie.select(".link_txt").text();
				System.out.println(title);
				
				
				//개봉 날짜
				String date = movie.select(".txt_num").text();
				System.out.println(date);
				
				//관객수
				String num = movie.select(".info_txt:nth-child(2)").text();
				System.out.println(num.replace("관객수", ""));
				
				//설명
				String story = movie.select(".link_story").text();
				System.out.println(story);
				
				//이미지
				String poster = movie.select(".img_thumb").attr("src");
				System.out.println(poster);
				
				//이미지 다운로드
				URL posterUrl = new URL(poster);
		         
		        BufferedImage image = ImageIO.read(posterUrl);
		        File file = new File("poster\\" + title + ".png");

		        ImageIO.write(image, "png", file);
				
				System.out.println();
				
				
			}
			
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
	
	
}
