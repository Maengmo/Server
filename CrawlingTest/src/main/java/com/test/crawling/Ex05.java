package com.test.crawling;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class Ex05 {

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
			
			String url = "http://lms1.sist.co.kr/worknet/SLogin.asp";
			driver.get(url);
			
			//아이디, 암호 입력
			WebElement id = driver.findElement(By.id("strLoginID"));
			id.sendKeys("유동현");
			
			WebElement pwd = driver.findElement(By.id("strLoginPwd"));
			pwd.sendKeys("1102");
			
			//버튼 클릭
			WebElement btn = driver.findElement(By.cssSelector("#content > div > form > table > tbody > tr > td > div > div.login-form > div.login-btn > input"));
	        btn.click();
	         
	        //딜레이
	        try {
				//driver.wait(3000);
				Thread.sleep(1000);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	        
	        WebElement period = driver.findElement(By.cssSelector("#content > div > div > div > div.panel-body > form > table > thead > tr:nth-child(5) > td:nth-child(2)"));
			System.out.println("period:" + period.getText());
			
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
