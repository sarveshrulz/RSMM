package com.rsmm;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.rsmm.dao.TerminalDao;
import com.rsmm.login.Login;

@ServerEndpoint("/terminal")
public class Terminal {
	Process process;

	@OnMessage
	public void terminal(Session session, String msg, boolean last) throws InterruptedException {
		Login login = new Login();

		String command = "sshpass -f ~/.sshpass ssh -t -t " + login.getHostname() + " -p " + login.getPort() + " "
				+ msg;
		if (session.isOpen() && !msg.equals("Hello server!")) {
			ProcessBuilder processBuilder = new ProcessBuilder();
			processBuilder.command("bash", "-c", command);
			try {
				process = processBuilder.start();
				BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
				String line;

				session.getBasicRemote().sendText("> " + msg, last);
				while ((line = reader.readLine()) != null) {
					session.getBasicRemote().sendText(line, last);
				}

				int exitCode = process.waitFor();
				if (exitCode == 0) {
					new TerminalDao().saveCommand(msg);
				} else {
					session.getBasicRemote().sendText(
							"Some problem occured while executing the command, error code: " + exitCode, last);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@OnClose
	public void close() {
		process.destroy();
	}
}
