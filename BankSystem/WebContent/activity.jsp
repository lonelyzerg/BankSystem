<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="data.User"%>
<%@ page import="data.Transaction"%>
<%@ page import="db.TransactionModify"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Activity</title>
<link rel="stylesheet" type="text/css" href="css/activity.css" />
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("login.jsp?info=Please+Login+First");
		} else {
	%>
	<div id="Header">
		<div id="Logo">
			<a href="account.jsp"><img src="resource/logo.png" width="290"
				height="119" alt="" /></a>
		</div>
		<div id="login">
			<a href="account.jsp" rel="nofollow">Welcome,<%=user.getUsername()%></a>
		</div>
	</div>
	<nav>
	<ul class="nav">
		<li><a href="account.jsp">Main Page</a></li>
		<li><a href="activity.jsp">Activity</a></li>
		<li><a href="transfer.jsp">Transfer</a></li>
		<li><a href="logout.jsp">Log Out</a></li>
	</ul>
	</nav>
	<br><br>
	<div id="h2">
		<h2>Your account activity</h2>
	</div>
	<div>
		<table align="center">
			<tr>
				<th>Transaction ID</th>
				<th>Detail</th>
				<th>Amount</th>
				<th>Type</th>
				<th>Time</th>
			</tr>
			<%
				TransactionModify tm = new TransactionModify();
					List<Transaction> tl = tm.fetchTransaction(user.getId());
					for (Transaction t : tl) {
			%>
			<tr align="center">
				<td style="width:150px"><%=t.getId()%></td>
				<td style="width:250px">
					<%
						if (t.getType().equals("Transaction")) {
									if (t.getSource().equals(user.getUsername())) {
										t.setAmount(-t.getAmount());
										out.println("Sent to " + t.getDest());
									} else {
										out.println("Received from " + t.getSource());
									}
								} else {
									if (t.getType().equals("Withdraw")) {
										out.println("Withdraw");
									} else {
										if (t.getType().equals("Deposit"))
											out.println("Deposit");
									}
								}
					%>
				</td>
				<td style="width:150px"><%=t.getAmount()%></td>
				<td style="width:100px"><%=t.getType()%></td>
				<td style="width:300px"><%=t.getTime()%></td>
			</tr>
			<%
				}
				}
			%>
		</table>
	</div>
</body>
</html>