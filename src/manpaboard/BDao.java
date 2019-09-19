package manpaboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class BDao {
	
	private Connection conn;
	private ResultSet rs;
	
	public BDao() {
		try {
			String dbURL  = "jdbc:mysql://localhost:3306/manpaDB";
			String dbID = "root";
			String dbPassword = "1235";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public int getNext() {
		String SQL = "select num from manpaboard order by num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1 ;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String title, String categori,String price,String mainimg,String content,String pi) {
		String SQL = "insert into manpaboard values (?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext());
			pstmt.setString(2,getDate());
			pstmt.setString(3,title);
			pstmt.setString(4,categori);
			pstmt.setString(5, price);
			pstmt.setString(6, mainimg);
			pstmt.setString(7, content);
			pstmt.setString(8, pi);
			pstmt.setInt(9, 1);
			
			
			return pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int upload(String fileName, String fileRealName) {
		String SQL = "INSERT INTO FILE VALUES(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<Bdto> getList(int pageNumber, int start, int end){
		String SQL = "select * from manpaboard where available = 1 order by num desc limit ?,?";
			ArrayList<Bdto> list = new ArrayList<Bdto>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, start-1 );
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bdto bdto = new Bdto();
				bdto.setNum(rs.getInt(1));
				bdto.setWritedate(rs.getString(2));
				bdto.setTitle(rs.getString(3));
				bdto.setCategori(rs.getString(4));
				bdto.setPrice(rs.getString(5));
				bdto.setMainimg(rs.getString(6));
				bdto.setContent(rs.getString(7));
				bdto.setPi(rs.getString(8));
				bdto.setAvailable(rs.getInt(9));
				
				list.add(bdto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "select * from manpaboard where num < ? and available = 1 order by num desc limit 9";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, getNext() - (pageNumber -1) * 9 );
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return true;
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return false;
	}
	
	public Bdto getBdto(int num) {
		String SQL = "select * from manpaboard where num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bdto bdto = new Bdto();
				bdto.setNum(rs.getInt(1));
				bdto.setWritedate(rs.getString(2));
				bdto.setTitle(rs.getString(3));
				bdto.setCategori(rs.getString(4));
				bdto.setPrice(rs.getString(5));
				bdto.setMainimg(rs.getString(6));
				bdto.setContent(rs.getString(7));
				bdto.setPi(rs.getString(8));
				return bdto;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		}
	public int update(String title, String categori,String price,String mainimg,String content) {
		String SQL = "update manpaboard set title = ?, categori = ?, price = ?, mainimg = ?,  content = ? where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,title);
			pstmt.setString(2,categori);
			pstmt.setString(3, price);
			pstmt.setString(4, mainimg);
			pstmt.setString(5, content);
			
			return pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int delete(int num) {
		String SQL = "update manpaboard set available = 0 where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	//
	public int getpage() {
		int count = 0;
		String SQL = "select count(*) from manpaboard";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1)+1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
		}
}
		
	
