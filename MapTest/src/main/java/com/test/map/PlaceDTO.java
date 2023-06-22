package com.test.map;

import lombok.Data;

@Data
public class PlaceDTO {
	private String seq;
	private String name;
	private String lat;
	private String lng;
	
	private String cseq;
	private String cicon;
}
