package com.manpa.post;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;







/**
 * Servlet implementation class loginDao
 */

public class postDao {

	
	private static postDao instance = new postDao(); 
	
	private postDao() {
		
	}
	
		public static postDao getInstance() {
			return instance;
		}


	public ArrayList<postDto> postCheck(String juso)  {
		ArrayList<postDto> list = new ArrayList<postDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		postDto dto = null;
		String query = "select * from zip_code where juso like '%"+ juso +"%'";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, juso);
			set = pstmt.executeQuery();
			
			while(set.next()){
				dto = new postDto();
				dto.setPost(set.getString("post"));
				dto.setJuso(set.getString("juso"));
				list.add(dto);
			} 
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
		
		return list;
		
		}
		
			
		

	
	public Connection getConnection() {
		
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





