package com.test.toy.board;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.test.my.DBUtil;

public class Dummy {

	public static void main(String[] args) throws Exception{
		
		Connection conn = null;
		PreparedStatement stat = null;
		
		conn = DBUtil.open();
		
		String sql = "insert into tblBoard values (seqBoard.nextVal, ?, '내용', 'admin', default, default)";
		
		stat = conn.prepareStatement(sql);
		
		for (int i=0; i<250; i++) {
			
			stat.setString(1, "게시판 페이징 처리 테스트중입니다.." + i);
			stat.executeUpdate();
			System.out.println(i);
			
		}
		
		stat.close();
		conn.close();
		
		
	}
	
}
