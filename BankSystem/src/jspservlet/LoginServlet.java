package jspservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;


import data.User;
import db.UserModify;;

/**
 * 
 * @author Tianhang Lan
 * User Login
 * 
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = -8222986955558364956L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("userName");
		String password = request.getParameter("userPassword");
		UserModify um = new UserModify();
		User user = um.login(username, password);
		if (user != null) {
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("account.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("login.jsp?info=Invalid+User+Name+or+Password").forward(request, response);
		}
	}

}
