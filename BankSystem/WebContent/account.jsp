<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="data.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Information</title>
<link rel="stylesheet" type="text/css" href="css/account.css" />
<style>
table, td, th {
    
}

table {
    width: 100%;
    
}

th {
    height: 50px;
}
</style>
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
	<div id="table">
		<table  border="0" valign="center">
			<tr>
				<th colspan="2"><font size="5" face="verdana">Account Status</font></th>
			</tr>
			<tr>
				<th><font>Account holder:</font></th>
				<th><font>Account balance:</font></th>
				
			</tr>
			<tr>
				<td><font> <%=user.getFirstName() + " " + user.getLastName()%></font></td>
				<td><font></font> <%=user.getBalance()%></td>
				
			</tr>
		</table>
		<br><br>
		<table  border="0" valign="center">
			<tr>
				<th colspan="3"><font size="5" face="verdana">Contact Information</font></th>
			</tr>
			<tr>
				<th><font>Email:</font></th>
				<th><font>Phone Number:</font></th>
				<th><font>Billing Address:</font></th>
			</tr>
			<tr>
				<td><font><%=user.getEmail()%></font></td>
				<td><font><%=user.getPhone()%></font></td>
				<td><font><%=user.getAddr() + " " + user.getAddr2() + "," + user.getCity() + "," + user.getState() + ","
						+ user.getCountry() + "," + user.getPostal()%></font></td>
			</tr>
			<!--  <tr>
				<td><input type="button" value="Change Account Information"
					onclick="location='edit.jsp'" /></td>
			</tr>
			-->
		</table>
	</div>
	<%
		}
	%>
</body>
</html>