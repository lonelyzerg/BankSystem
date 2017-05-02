package jspservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.User;
import db.TransactionModify;
import db.UserModify;

/**
 * Servlet implementation class TransferServlet
 */
@WebServlet("/TransferServlet")
public class TransferServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1894144215879051024L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserModify um = new UserModify();
		TransactionModify tm = new TransactionModify();
		User sourceUser = (User) request.getSession().getAttribute("user");
		double amount = Double.parseDouble(request.getParameter("amount"));
		String destUser = request.getParameter("destUser");
		String info = "Transaction failed: User do not exist.";
		if (um.userIsExist(destUser)) {
			User dest = um.fetch(destUser);
			dest.setBalance(dest.getBalance() + amount);
			sourceUser.setBalance(sourceUser.getBalance() - amount);
			um.updateBalance(sourceUser);
			um.updateBalance(dest);
			tm.newTransaction(sourceUser.getId(), dest.getId(), amount);
			info = "Transaction completed!";
		} 
		request.setAttribute("tranInfo", info);
		request.getRequestDispatcher("transfer.jsp").forward(request, response);
	}
}
