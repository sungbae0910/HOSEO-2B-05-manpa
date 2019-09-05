package BDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import com.manpa.board.Dto.BDto;

public class BDao{
	
	DataSource dataSource;
	
	public BDao() {
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/manpaDB");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void write(String writer, String title, String content) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "insert into notice (num, writer, title, content, issue_date) values(?,?,?,?,?)"; 
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			int rn = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public ArrayList<BDto> list() {
		
		ArrayList<BDto> dtos = new ArrayList<BDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		
		try {
			conn = dataSource.getConnection();
			
			String query = "select num, write, title, issue_date, readcount from notice";
			pstmt = conn.prepareStatement(query);
			set = pstmt.executeQuery();
			
			while(set.next()) {
				int num = set.getInt("num");
				String write = set.getString("write");
				String title = set.getString("title");
				String content = set.getString("content");
				Timestamp issue_date = set.getTimestamp("issue_date");
				int readcount = set.getInt("readcount");
				
				BDto dto = new BDto(num, write, title, content, issue_date, readcount);
				dtos.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(set != null) set.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
}



