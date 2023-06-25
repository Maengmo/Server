package com.test.toy.user.repository;

import lombok.Data;

@Data
public class UserDTO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String lv;
	private String pic;
	private String profile;
}
