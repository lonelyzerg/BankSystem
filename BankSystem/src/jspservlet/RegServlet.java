package jspservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.User;
import db.UserModify;

/**
 * 
 * @author Tianhang Lan
 * User Registration.
 * 
 */
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 684188497983509885L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "login.jsp?info=Register+failed!";
		String username = request.getParameter("userName");
		String password = request.getParameter("userPassword");
		String email = request.getParameter("userEmail");
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		int phone = Integer.parseInt (request.getParameter("userPhone"));
		int postal = Integer.parseInt (request.getParameter("userPostal"));
		String addr = request.getParameter("userAddr");
		String addr2 = request.getParameter("userAddr2");
		String city = request.getParameter("userCity");
		String state = request.getParameter("userState");
		String country = request.getParameter("userCountry");
		
		UserModify um = new UserModify();
		if(username != null && !username.isEmpty()){
			if(!um.userIsExist(username)){		
				User user = new User();		
				user.setUsername(username);	
				user.setEmail(email);
				user.setPassword(password);
				user.setFirstName(fName);
				user.setLastName(lName);
				user.setPhone(phone);
				user.setPostal(postal);
				user.setAddr(addr);
				user.setAddr2(addr2);
				user.setCity(city);
				user.setState(state);
				user.setCountry(country);
				um.saveUser(user);	
				url = "login.jsp?info=Registered!+Please+log+in!";
			}else{
				url = "login.jsp?info=Sorry!+The+user+name+already+exist!";
			}
		}
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
