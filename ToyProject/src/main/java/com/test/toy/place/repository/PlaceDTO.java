package com.test.toy.place.repository;

import java.util.ArrayList;

import lombok.Data;

@Data
public class PlaceDTO {
	private String seq;
	private String name;
	private String content;
	private String pic;
	private String regdate;
	private String id;
	
	private String uname;//회원명
	
	private ArrayList<String> hashtag; //해시태그
}
