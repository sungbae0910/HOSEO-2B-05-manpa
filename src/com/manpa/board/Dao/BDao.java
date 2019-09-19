package com.manpa.board.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import com.manpa.board.Dto.BDto;
import com.manpa.board.Dto.BPaging;

public class BDao {

	DataSource dataSource;

	public BDao() {

		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/manpaDB");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void write(String name, String title, String content) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "insert into board(name, title, content, readcount) values(?,?,?,0)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			int rn = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public int getListCount(HashMap<String, Object> listopt) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		int x = 0;
		String opt = (String)listopt.get("opt");
		String condi = (String)listopt.get("condi");

		try {
			conn = dataSource.getConnection();

			if(opt == null) {
			String query = "select count(*) from board";
			pstmt = conn.prepareStatement(query);
			}else if(opt.equals("0")) {
				String query = "select count(*) from board where title like ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+condi+"%");
			}else if(opt.equals("1")) {
				String query = "select count(*) from board where content like ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+condi+"%");
			}else if(opt.equals("2")) {
				String query = "select count(*) from board where title like ? or content like ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+condi+"%");
				pstmt.setString(2, "%"+condi+"%");
			}else if(opt.equals("3")) {
				String query = "select count(*) from board where name like ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+condi+"%");
			}
			set=pstmt.executeQuery();

			if (set.next()) {
				x = set.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (set != null)
					set.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return x;
	}

	public ArrayList<BDto> list(int startRow, int endRow, HashMap<String, Object> listopt) {

		ArrayList<BDto> dtos = new ArrayList<BDto>();
		String opt = (String)listopt.get("opt");
		String condi = (String)listopt.get("condi");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;

		try {
			conn = dataSource.getConnection();
			
			if(opt == null){
				String query="select * from board order by id desc limit "+startRow+","+endRow;
				pstmt = conn.prepareStatement(query);
			}else if(opt.equals("0")) { //제목검색
				String query="select * from board where title like ? order by id desc limit "+startRow+","+endRow;
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+condi+"%");
			}else if(opt.equals("1")) { //내용검색
				String query="select * from board where content like ? order by id desc limit "+startRow+","+endRow;
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+condi+"%");
			}else if(opt.equals("2")) { //제목+내용 검색
				String query="select * from board where content like ? or title like ? order by id desc limit "+startRow+","+endRow;
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+condi+"%");
				pstmt.setString(2, "%"+condi+"%");
			}else if(opt.equals("3")) {
				String query="select * from board where name like ? order by id desc limit "+startRow+","+endRow;
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+condi+"%");
			}	
			set = pstmt.executeQuery();

			while (set.next()) {
				int id = set.getInt("id");
				String name = set.getString("name");
				String title = set.getString("title");
				String content = set.getString("content");
				Timestamp bDate = set.getTimestamp("bDate");
				int readcount = set.getInt("readcount");

				BDto dto = new BDto(id, name, title, content, bDate, readcount);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (set != null)
					set.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}

	public BDto contentView(String num) {

		upCount(num);

		BDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;

		try {
			conn = dataSource.getConnection();

			String query = "select * from board where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num));
			set = pstmt.executeQuery();

			if (set.next()) {
				int id = set.getInt("id");
				String name = set.getString("name");
				String title = set.getString("title");
				String content = set.getString("content");
				Timestamp bDate = set.getTimestamp("bDate");
				int readcount = set.getInt("readcount");

				dto = new BDto(id, name, title, content, bDate, readcount);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (set != null)
					set.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}

	public void modify(String id, String name, String title, String content) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dataSource.getConnection();

			String query = "update board set name=?, title=?, content=? where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setInt(4, Integer.parseInt(id));
			int rn = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String query="delete from board where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(id));
			int rn = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}	
	}

	private void upCount(String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dataSource.getConnection();
			String query = "update board set readcount=readcount+1 where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);

			int rn = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
