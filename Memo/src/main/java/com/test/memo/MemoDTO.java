package com.test.memo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//코드 자동생성 + 코드 축소
/*@Setter
@Getter
@ToString*/
@Data //@ToString + @Getter + @Setter + @EqualsAndHashCode + @RequiredArgsConstructor

public class MemoDTO {
	private String seq;
	private String memo;
	private String regdate;
	private String cseq;
	
	private String icon;
	private String color;
}


