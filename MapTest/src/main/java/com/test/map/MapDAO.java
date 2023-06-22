package com.test.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class MapDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MapDAO() {
		this.conn = DBUtil.open();
	}

	public List<CategoryDTO> clist() {
		
		try {
			
			String sql = "select * from tblPlaceCategory order by name asc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			List<CategoryDTO> clist = new ArrayList<CategoryDTO>();
			
			while (rs.next()) {
				
				CategoryDTO dto = new CategoryDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setMarker(rs.getString("marker"));
				
				clist.add(dto);
				
			}
			
			return clist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	public int add(PlaceDTO dto) {
		
		try {
			
			String sql = "insert into tblPlace (seq, name, lat, lng, cseq) values (seqPlace.nextVal, ?, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getLat());
			pstat.setString(3, dto.getLng());
			pstat.setString(4, dto.getCseq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<PlaceDTO> mlist() {
		
		try {
			
			String sql = "select * from tblPlace order by name asc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			List<PlaceDTO> mlist = new ArrayList<PlaceDTO>();
			
			while (rs.next()) {
				
				PlaceDTO dto = new PlaceDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setCseq(rs.getString("cseq"));
				
				mlist.add(dto);
				
			}
			
			return mlist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
}
