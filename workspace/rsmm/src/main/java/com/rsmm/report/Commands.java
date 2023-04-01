package com.rsmm.report;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/commands")
public class Commands {
	String url = "jdbc:mysql://localhost:3306/rsmm";
	String username = "root";
	String password = "";
	String sql = "select * from commands;";

	@OnMessage
	public void commands(Session session, String msg, boolean last) throws InterruptedException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String user = rs.getString("user");
				String time = rs.getString("time");
				String host = rs.getString("host");
				int port = rs.getInt("port");
				String cmd = rs.getString("cmd");
				session.getBasicRemote()
						.sendText("<b>User</b> " + user + " <b>executed</b> " + cmd
								+ " <b>on host</b> " + host + " <b>with port</b> " + port + " <b>on time</b> " + time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
