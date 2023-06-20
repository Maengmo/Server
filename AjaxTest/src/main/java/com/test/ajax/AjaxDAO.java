package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.test.my.DBUtil;

public class AjaxDAO {

	   private Connection conn;
	   private Statement stat;
	   private PreparedStatement pstat;
	   private ResultSet rs;
	   
	   public AjaxDAO() {
	      this.conn = DBUtil.open();
	   }

	public int count() {
		
		try {
			
			String sql = "select count(*) as cnt from tblMemo";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public ResearchDTO getResearch(int seq) {
		
		try {
			
			String sql = "select * from tblResearch where seq = " + seq;
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				
				ResearchDTO dto = new ResearchDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setQuestion(rs.getString("question"));
				
				String[] item = { 
						rs.getString("item1"), 
						rs.getString("item2"), 
						rs.getString("item3"), 
						rs.getString("item4")
						};
				
				dto.setItem(item);
				
				String[] cnt = { 
						rs.getString("cnt1"), 
						rs.getString("cnt2"), 
						rs.getString("cnt3"),
						rs.getString("cnt4")
				};
				
				dto.setCnt(cnt);
				
				return dto;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public List<AddressDTO> listAddress() {
		
		try {
			
			String sql = "select * from tblAddress";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			List<AddressDTO> list = new ArrayList<AddressDTO>();
			
			while (rs.next()) {
				
				AddressDTO dto = new AddressDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getString("age"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				
				list.add(dto);
			}
			
				return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}

	public int checkID(String id) {
		
		try {
			
			String sql = "select count(*) as cnt from tblUser where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<ZipCode> search(String dong) {
		
		try {
			
			String sql = "select * from zipcode "
					+ "where dong like '%' || ? || '%'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dong);
			
			rs = pstat.executeQuery();
			
			List<ZipCode> list = new ArrayList<ZipCode>();
			
			while (rs.next()) {
				
				ZipCode dto = new ZipCode();
				
				dto.setZip(rs.getString("zip"));
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				dto.setBunji(rs.getString("bunji"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public boolean checkCell(Ex11DTO dto) {
		
		try {
			
			String sql = "select count(*) as cnt from ajaxTable"
						+ " where x = ? and y = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getX());
			pstat.setString(2, dto.getY());
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt") == 1 ? true : false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	public void editCell(Ex11DTO dto) {
		
		try {
			
			String sql = "update ajaxTable set ck = ? where x = ? and y = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getCk());
			pstat.setString(2, dto.getX());
			pstat.setString(3, dto.getY());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void addCell(Ex11DTO dto) {
		
		try {
			
			String sql = "insert into ajaxTable (seq, x, y, ck) values (tableseq.nextVal, ?, ?, 'y')";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getX());
			pstat.setString(2, dto.getY());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<Ex11DTO> listCell() {
		
		try {
			
			String sql = "select * from ajaxTable";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			List<Ex11DTO> list = new ArrayList<Ex11DTO>();
			
			while (rs.next()) {
				
				Ex11DTO dto = new Ex11DTO();
				
				dto.setX(rs.getString("x"));
				dto.setY(rs.getString("y"));
				dto.setCk(rs.getString("ck"));
				
				list.add(dto);
				
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void editLine(Ex12DTO dto) {

	      try {
	         
	         String sql = "update tblJournal set line = ? where seq = ?";
	         
	         pstat = conn.prepareStatement(sql);
	         pstat.setString(1, dto.getLine());
	         pstat.setString(2, dto.getSeq());
	         
	         pstat.executeUpdate();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	   }


	public List<Ex12DTO> listLine() {
		
		try {
			
			String sql = "select * from tblJournal order by seq asc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			List<Ex12DTO> list = new ArrayList<Ex12DTO>();
			
			while(rs.next()) {
				Ex12DTO dto = new Ex12DTO();
				dto.setSeq(rs.getString("seq"));
				dto.setLine(rs.getString("line"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int addProduct(Ex13DTO dto) {
		
		try {
			
			String sql = "insert into tblProduct (seq, name, price, color, pic) values (seqProduct.nextVal, ?, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getPrice());
			pstat.setString(3, dto.getColor());
			pstat.setString(4, dto.getPic());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<Ex13DTO> listProduct() {

	      try {
	         
	         String sql = "select * from tblProduct order by seq desc";
	         
	         stat = conn.createStatement();
	         rs = stat.executeQuery(sql);
	         
	         List<Ex13DTO> list = new ArrayList<Ex13DTO>();
	         
	         while (rs.next()) {
	            
	            Ex13DTO dto = new Ex13DTO();
	            
	            dto.setSeq(rs.getString("seq"));
	            dto.setName(rs.getString("name"));
	            dto.setPrice(rs.getString("price"));
	            dto.setColor(rs.getString("color"));
	            dto.setPic(rs.getString("pic"));
	            
	            list.add(dto);
	            
	         }

	         return list;
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return null;
	   }

	public Ex13DTO getProduct() {
		
		try {
			
			String sql = "select seq, pic from tblProduct"
					+ " where seq = (select max(seq) from tblProduct)";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				Ex13DTO dto = new Ex13DTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSeq(rs.getString("pic"));
				
				return dto;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int delProduct(String seq) {
		
		try {
			
			String sql = "delete from tblProduct where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int editProduct(Ex13DTO dto) {
		
		try {
			
			String sql = "update tblProduct set name = ?, price = ?, color = ? where seq = ?";
			
			pstat= conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getPrice());
			pstat.setString(3, dto.getColor());
			pstat.setString(4, dto.getSeq());
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<Ex13DTO> listProduct2(Map<String, Integer> map) {
		
		try {
	         
	         String sql = "select * from (select a.*, rownum as rnum from tblProductCopy a)\r\n"
	         		+ "    where rnum between ? and ?";
	         
	         pstat = conn.prepareStatement(sql);
	         pstat.setInt(1, map.get("begin"));
	         pstat.setInt(2, map.get("end"));
	         
	         rs = pstat.executeQuery();
	         
	         List<Ex13DTO> list = new ArrayList<Ex13DTO>();
	         
	         while (rs.next()) {
	            
	            Ex13DTO dto = new Ex13DTO();
	            
	            dto.setSeq(rs.getString("seq"));
	            dto.setName(rs.getString("name"));
	            dto.setPrice(rs.getString("price"));
	            dto.setColor(rs.getString("color"));
	            dto.setPic(rs.getString("pic"));
	            
	            list.add(dto);
	            
	         }
	
	         return list;
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
		
		return null;
	}

	public List<Q05DTO> listUser() {
		
		try {
			
			String sql = "select * from ajaxList order by seq desc";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			List<Q05DTO> list = new ArrayList<Q05DTO>();
			
			while(rs.next()) {
				
				Q05DTO dto = new Q05DTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int addlist(Q05DTO dto) {
		
		try {
			
			String sql = "insert into ajaxList values (listseq.nextVal, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getTel());
			pstat.setString(3, dto.getAddress());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	
}







