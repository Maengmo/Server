package com.test.toy.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.fasterxml.jackson.databind.ser.std.MapProperty;
import com.test.my.DBUtil;
import com.test.toy.board.Comment;

public class BoardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO() {
		this.conn = DBUtil.open();
	}

	public int add(BoardDTO dto) {
		
		try {
			
			String sql = "insert into tblBoard (seq, subject, content, id, regdate, readcount, thread, depth) values (seqBoard.nextval, ?, ?, ?, default, default, ?, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getId());
			
			pstat.setInt(4, dto.getThread());
			pstat.setInt(5, dto.getDepth());
			

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//Board 서블릿이 게시판 목록 출력 요청
	public List<BoardDTO> list(HashMap<String, String> map) {
		
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			
			String where ="";
			
			if (map.get("search").equals("y")) {
	            where = String.format("where %s like '%%%s%%'"
	                              , map.get("column")
	                              , map.get("word"));
	         }

	         String sql = String.format("select * from (select a.*, rownum as rnum from vwBoard a %s) where rnum between %s and %s "
	                              , where
	                              , map.get("begin")
	                              , map.get("end")
	                              );

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readcount"));
				
				dto.setName(rs.getString("name"));
				
				dto.setIsnew(rs.getDouble("isnew"));
				
				dto.setCcnt(rs.getString("ccnt"));
				
				dto.setDepth(rs.getInt("depth"));
				
				list.add(dto);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	//View 서블릿이 번호를 줄테니 레코드 1줄(DTO)를 주세요~
	public BoardDTO get(String seq) {
		
		try {

			String sql = "select \r\n"
					+ "    tblBoard.*,\r\n"
					+ "    (select name from tblUser where id = tblBoard.id) as name\r\n"
					+ "from tblBoard\r\n"
					+ "    where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			rs = pstat.executeQuery();

			if (rs.next()) {

				BoardDTO dto = new BoardDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getString("readCount"));
				dto.setName(rs.getString("name"));
				
				dto.setThread(rs.getInt("thread"));
				dto.setDepth(rs.getInt("depth"));
				
				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	//View 서블릿이 글번호를 건내주면, 조회수 +1 증가
	public void updateReadCount(String seq) {
		
		try {

			String sql = "update tblBoard set readcount = readcount + 1 where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	//Edit 서블릿이 DTO를 건내주면, 수정
	public int edit(BoardDTO dto) {
		
		try {

			String sql = "update tblBoard set subject = ?, content = ? where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int del(String seq) {
		
		try {

			String sql = "delete from tblBoard where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int addContent(CommentDTO cdto) {
		
		try {

			String sql = "insert into tblComment (seq, content, id, regdate, bseq) values (seqComment.nextVal, ?, ?, default, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, cdto.getContent());
			pstat.setString(2, cdto.getId());
			pstat.setString(3, cdto.getBseq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//View 서블릿이 현재 보고 있는 글의 딸려있는 댓글 목록을 출력.
	public List<CommentDTO> clist(String bseq) {
		
		try {

			String sql = "select tblComment.*, (select name from tblUser where id = tblComment.id) as name from tblComment where bseq = ? order by seq desc";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, bseq);

			rs = pstat.executeQuery();

			List<CommentDTO> list = new ArrayList<CommentDTO>();

			while (rs.next()) {

				CommentDTO dto = new CommentDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setBseq(rs.getString("bseq"));
				dto.setName(rs.getString("name"));
				
				list.add(dto);
			}
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//Del 서블릿이 글번호를 줄테니, 글에 달려있는 댓글도 다 삭제해주세요.
	public int delComment(String bseq) {
	
		try {

			String sql = "delete from tblComment where bseq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, bseq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int editComment(CommentDTO cdto) {
		
		try {

			String sql = "update tblComment set content = ? where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, cdto.getContent());
			pstat.setString(2, cdto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delComment2(String cseq) {
		
		try {

			String sql = "delete from tblComment where seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, cseq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	//Board 서블릿이 게시물 총개수를 달라고 요청
	public int getTotalCount(HashMap<String, String> map) {
		
		try {

			String where ="";
			
			if (map.get("search").equals("y")) {
				where = String.format("where %s like '%%%s%%'", map.get("column"), map.get("word") );
			}

			String sql = String.format("select count(*) as cnt from vwBoard %s", where);

			pstat = conn.prepareStatement(sql);

			rs = pstat.executeQuery();

			if (rs.next()) {

				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int getMaxThread() {
		
		try {

			String sql = "select nvl(max(thread), 0) as thread from tblBoard";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {
				return rs.getInt("thread");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public void updateThread(HashMap<String, Integer> map) {
		
		try {

			String sql = "update tblBoard set thread = thread -1 where thread > ? and thread < ?";

			pstat = conn.prepareStatement(sql);

			pstat.setInt(1, map.get("previousThread"));
			pstat.setInt(2, map.get("parentThread"));

			pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
