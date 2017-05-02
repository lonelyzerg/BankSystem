package jspservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.User;
import db.UserModify;

public class AdminLoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3713422612430809547L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("userName");
		String password = request.getParameter("userPassword");
		UserModify um = new UserModify();
		User user = um.adminLogin(username, password);
		if (user != null) {
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("adminLogin.jsp?info=Invalid+user+name+or+password!").forward(request, response);
		}
	}
}
