<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	Author: Tianhang Lan
	This page clear the session and return back to the log in page.
 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logging Out...</title>
</head>
<body>
<%
session.invalidate();
response.sendRedirect("login.jsp?info=You+Have+logged+out!");
%>
</body>
</html>