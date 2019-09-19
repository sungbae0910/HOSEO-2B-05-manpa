package manpaboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class commentDao {
		
		private Connection conn;
		private ResultSet rs;
		
		public commentDao() {
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
		public int commetplus(String writer, String contents, int starpoint, int division) {
			String SQL = "insert into comment values (?,?,?,?,?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,writer);
				pstmt.setString(2,contents);
				pstmt.setInt(3,starpoint);
				pstmt.setInt(4, division);
				pstmt.setInt(5, division+1);
				
				
				
				return pstmt.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
		public ArrayList<commentDto> getList(int num){
			String SQL = "select * from comment where division = ?";
				ArrayList<commentDto> list = new ArrayList<commentDto>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					commentDto man = new commentDto();
				
					man.setWriter(rs.getString(1));
					man.setContents(rs.getString(2));
					man.setStarpoint(rs.getInt(3));
					man.setDivision(rs.getInt(4));
				
					list.add(man);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
}
