<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="data.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	<%
		}
	%>
	
</body>
</html>