package com.test.crawling;


import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class Ex04 {

	public static void main(String[] args) {
		
		
		try {
			
			//셀레니움 기초 셋팅
			String webDriverID = "webdriver.chrome.driver";
			String path = "C:\\class\\dev\\chromedriver.exe";
	      
			System.setProperty(webDriverID, path);
	      
			ChromeOptions options = new ChromeOptions();
			options.setCapability("ignoreProtectedModeSettings", true);
			
			//실제적인 사용
			
			//브라우저 참조 객체
			WebDriver driver = new ChromeDriver(options);
			
			String url = "http://localhost:8090/crawling/ex01.do";
			driver.get(url);
			
			WebElement title = driver.findElement(By.id("title"));
			System.out.println(title.getText());
			
			List<WebElement> list = driver.findElements(By.className("item"));
			
			for (WebElement item : list) {
				System.out.println(item.getText());
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
