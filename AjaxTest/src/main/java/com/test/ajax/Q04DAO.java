package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.my.DBUtil;

public class Q04DAO {

	   private Connection conn;
	   private Statement stat;
	   private PreparedStatement pstat;
	   private ResultSet rs;
	   
	   public Q04DAO() {
	      this.conn = DBUtil.open();
	   }

	public int update(Q04DTO dto) {
		
		try {
			
			String sql = "update ajaxCat set x = ?, y = ? where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getX());
			pstat.setString(2, dto.getY());
			pstat.setString(3, dto.getId());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	   
	   
}
