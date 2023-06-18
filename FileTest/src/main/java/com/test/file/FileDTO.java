package com.test.file;

//VO vs DTO
//- 데이터를 저장하는 객체
//- 자바 클래스
//- VO : Value Object
//	- DB에서 가져온 데이터를 보관하는 용도
//  - 읽기 전용 > 리터럴(상수)
//  - setter 구현 X
//- DTO : Data Transfer Object 
//- 계층간에 데이터를 전송할 때 사용되는 도구(택배 상자)
//- 수정이 가능하다.

// 목록보기 : DB > DAO > (VO) > 컨트롤러 > (VO) > JSP
// 글쓰기 : JSP > 컨트롤러 > (DTO) > DAO > DB

//AddressVO
//AddressDTO

public class FileDTO {
	
	private String seq;
	private String name;
	private String filename;
	private String regdate;
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
}
