package com.manpa.login;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class Dbconnection {

	public static Connection getConnection() throws SQLException, NamingException, 
    ClassNotFoundException{
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/manpadata");
	
	Connection conn = ds.getConnection();
	return conn;
	}
}



