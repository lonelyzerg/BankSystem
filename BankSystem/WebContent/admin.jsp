<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="data.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	Author: Tianhang Lan
	This page is the index page for administrator.
 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In</title>
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<style type="text/css">

</style>
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
		if (user == null || !user.isAdmin()) {
			session.invalidate();
			response.sendRedirect("login.jsp?info=Please+Login+First");
		} else {
	%>
	<div id="Header">
		<div id="Logo">
			<a href="admin.jsp"><img src="resource/logo.png" width="290"
				height="119" alt="" /></a>
		</div>
		<div id="login_after">
			Welcome, <a href="admin.jsp" rel="nofollow"><%=user.getUsername()%></a>
			| <a href="logout.jsp" rel="nofollow">Log Out</a>
		</div>
	</div>
	<nav>
	<ul class="nav">
		<li><a href="admin.jsp">Main Page</a></li>
		<li><a href="deposit_withdraw.jsp">Deposit & WithDraw</a></li>
		<!--<li><a href="transfer.jsp">Transfer</a></li> -->
		<li><a href="logout.jsp">Log Out</a></li>
	</ul>
	</nav>
	<%
		}
	%>
</body>
</html>