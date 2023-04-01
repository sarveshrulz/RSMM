package com.rsmm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class TerminalDao {
	String url = "jdbc:mysql://localhost:3306/rsmm";
	String username = "root";
	String password = "";
	
	public void saveCommand(String cmd) {
		try {
			String sql = "insert into commands select time, host, port, user, '" + cmd + "' from login order by time desc limit 1;";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
