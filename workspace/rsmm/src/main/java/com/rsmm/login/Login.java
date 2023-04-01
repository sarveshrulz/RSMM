package com.rsmm.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.rsmm.login.dao.LoginDao;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private String hostname = "localhost";
	private String port = "22";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		hostname = request.getParameter("hostname");
		port = request.getParameter("port");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");

		LoginDao dao = new LoginDao();

		if (dao.check(uname, pass)) {
			dao.loginAt(getHostname(), getPort(), uname);
			HttpSession session = request.getSession();
			session.setAttribute("uname", uname);
			session.setAttribute("hostname", getHostname());
			response.sendRedirect("homepage.jsp");
		} else
			response.sendRedirect("index.jsp?cred=invalid");
	}

	public String getHostname() {
		return hostname;
	}

	public String getPort() {
		return port;
	}
}
