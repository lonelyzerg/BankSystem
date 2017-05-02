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
 * Servlet implementation class WithdrawServlet
 */
@WebServlet("/WithdrawServlet")
public class WithdrawServlet extends HttpServlet {
    
	/**
	 * 
	 */
	private static final long serialVersionUID = 4613248542592269951L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		String info = "Withdraw Failed. Please try again later.";
		if (user.isAdmin()){
			UserModify um = new UserModify();
			TransactionModify tm = new TransactionModify();
			String username = request.getParameter("username");
			double amount = Double.parseDouble(request.getParameter("amount"));
			User dest = um.fetch(username);
			if(dest.getBalance() - amount>0){
			dest.setBalance(dest.getBalance() - amount);
			tm.newWithdraw(dest.getId(), -amount);
			um.updateBalance(user);
			info = "Withdraw complete!";
			}else{
				info = "Withdraw Failed. You don't have enough money in your account!";
			}
			
		}
		request.setAttribute("wInfo", info);
		request.getRequestDispatcher("deposit_withdraw.jsp").forward(request, response);
	}

}
