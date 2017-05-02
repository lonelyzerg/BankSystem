<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="data.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Money</title>
<link rel="stylesheet" type="text/css" href="css/transfer.css" />
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("login.jsp?info=Please+Login+First");
		} else {
			String info = (String) request.getAttribute("tranInfo");
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
		<script type="text/javascript">
		function transform(form) {
			<% if (user.isAdmin()) {%>
			if (form.sourceUser.value == "") {
				document.getElementById("tmsg").innerHTML = ("Sender's username cannot be empty!");
				return false;
			}
			<%} %>
			if (form.destUser.value == "") {
				document.getElementById("tmsg").innerHTML = ("Receiver's username cannot be empty!");
				return false;
			}
			if (form.amount.value == "") {
				document.getElementById("tmsg").innerHTML = ("Receiver's username cannot be empty!");
				return false;
			}
			
			if (isNaN(form.amount.value)) {
				document.getElementById("tmsg").innerHTML = ("Please enter a number!");
				return false;
			}
			
			if (parseFloat(form.amount.value) < 0) {
				document.getElementById("tmsg").innerHTML = ("Input value should be greater than 0!");
				return false;
			}
			
			if (parseFloat(form.amount.value) > <%=user.getBalance() %>) {
				document.getElementById("tmsg").innerHTML = ("You don't have enough money!");
				return false;
			}
		}
		</script>
	<br><br>
	<div id="table" >
		<form method="post" action="TransferServlet" onSubmit="return transform(this);">
			<table align="center" cellpadding="10">
				<tr>
					<td>From:</td>
					<td>
						<%
							if (user.isAdmin()) {
						%> <input type="text" name="sourceUser" /> <%
						 	} else {
						 		out.println(user.getUsername());
						 	}
						%>
					</td>
				<tr>
					<td>To:</td>
					<td><input type="text" name="destUser" /></td>
				</tr>
				<tr>
					<td>Amount:</td>
					<td><input type="text" name="amount" /></td>
				</tr>
				<tr>
					<td colspan="2" height="20px"><div id="tmsg"><%if(info != null) out.println(info); %></div></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="Transfer" /></td>
				</tr>
			</table>
		</form>
	</div>
	<%
		}
	%>
</body>
</html>