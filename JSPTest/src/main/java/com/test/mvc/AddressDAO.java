package com.test.mvc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.my.DBUtil;

public class AddressDAO {
	
	private Connection conn = null;
	private Statement stat = null;
	private ResultSet rs = null;
	
	public AddressDAO() {
		
		conn = DBUtil.open();
	
	}
	
	public int getCount() {
		
		try {
			
			
			
			
			String sql = "select count(*) as cnt from tblAddress";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				
				return rs.getInt("cnt");
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public ArrayList<AddressVO> list() {
		
		try {
			
			String sql = "select * from tblAddress";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			//ResultSet > ArrayList<AddressVO>
			ArrayList<AddressVO> list = new ArrayList<AddressVO>();
			
			while (rs.next()) {
				//레코드 1줄 > AddressVO
				AddressVO vo = new AddressVO();
				
				vo.setSeq(rs.getString("seq")); //DB 컬럼값 > 객체 멤버변수
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getString("age"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				
				list.add(vo);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
