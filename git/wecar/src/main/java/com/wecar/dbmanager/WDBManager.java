package com.wecar.dbmanager;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class WDBManager {
	private Connection con;
	
	public Connection getCon() {
	
	try {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource db = (DataSource) envContext.lookup("jdbc/jh6194");
		
		con = db.getConnection();
	} catch (Exception e) { e.printStackTrace(); }
	
	return con;
	}
}
