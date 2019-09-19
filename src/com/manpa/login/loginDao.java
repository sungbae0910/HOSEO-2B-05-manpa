package com.manpa.login;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;






/**
 * Servlet implementation class loginDao
 */

public class loginDao {
	
	public static final int MEMBER_NONEXISTENT  = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	public static final int MEMBER_ID_FIND_SUCESS = 1;

	
	private static loginDao instance = new loginDao();
	
	private loginDao() {
		
	}
		
		public static loginDao getInstance() {
			return instance;
		}
		


	public int insertMember(loginDto dto){
				
		int ri=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "insert into mp_login values(?,?,?,?,?,?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getYear()+"년"+dto.getMonth()+"월"+dto.getDay()+"일");
			pstmt.setString(5, dto.geteMail());
			pstmt.setString(6, dto.getGender());
			pstmt.setString(7, dto.getPost()+"/"+dto.getAdress()+"/"+dto.getAdress2());
			pstmt.setTimestamp(8, dto.getrDate());
			pstmt.executeUpdate();
			ri = loginDao.MEMBER_JOIN_SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ri;
		
		}
		

	public int confirmId(String id) {
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from mp_login where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()){
				ri = loginDao.MEMBER_EXISTENT;
			} else {
				ri = loginDao.MEMBER_NONEXISTENT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ri;
	}
	
	public int userCheck(String id, String pass) {
		int ri = 0;
		String dbpw;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pass from mp_login where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dbpw = set.getString("pass");
				if(dbpw.equals(pass)) {
					ri = loginDao.MEMBER_LOGIN_SUCCESS; //�α��� ����
				}else {
					ri = loginDao.MEMBER_LOGIN_PW_NO_GOOD; // ���x 
				}
			}else {
				ri = loginDao.MEMBER_LOGIN_IS_NOT; //ȸ��X
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				set.close();
				pstmt.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public loginDto getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from mp_login where id = ?";
		loginDto dto = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dto = new loginDto();
				dto.setId(set.getString("id"));
				dto.setPass(set.getString("pass"));
				dto.setName(set.getString("name"));
				dto.setGender(set.getString("gender"));
				dto.setrDate(set.getTimestamp("rDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
		
	}	
	
	
	public String idFind(loginDto dto) {
		String dbid = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from mp_login where name = ? and eMail = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.geteMail());
			set = pstmt.executeQuery();
			while(set.next()) {
				dbid=set.getString("id");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dbid;
	}
	
	public String pwFind(loginDto dto) {
		String dbpw = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pass from mp_login where id = ? and eMail = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.geteMail());
			set = pstmt.executeQuery();
			while(set.next()) {
				dbpw=set.getString("pass");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dbpw;
	}
	
	public int changePass(loginDto dto) {
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "update mp_login set pass=? where id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getPass());
			pstmt.setString(2, dto.getId());
			ri = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	
	private Connection getConnection() {
		
		Context context = null;
		DataSource dataSource = null;
		Connection conn = null;
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/manpaDB");
			conn = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
	}





