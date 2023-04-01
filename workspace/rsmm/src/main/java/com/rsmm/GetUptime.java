package com.rsmm;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.rsmm.login.Login;

@ServerEndpoint("/uptime")
public class GetUptime {
	Process process;

	@OnMessage
	public void uptime(Session session, String msg, boolean last) throws InterruptedException {
		Login login = new Login();

		String command = "sshpass -f ~/.sshpass ssh -t -t " + login.getHostname() + " -p " + login.getPort()
				+ " /home/sarvesh/.local/bin/getUptime";
		if (session.isOpen()) {
			ProcessBuilder processBuilder = new ProcessBuilder();
			processBuilder.command("bash", "-c", command);
			try {
				process = processBuilder.start();
				BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
				String line;

				while ((line = reader.readLine()) != null) {
					session.getBasicRemote().sendText(line, last);
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
