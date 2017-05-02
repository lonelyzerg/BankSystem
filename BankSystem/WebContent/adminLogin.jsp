<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	Author: Tianhang Lan
	This page is for log in and register.
 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In</title>
<link rel="stylesheet" type="text/css" href="css/adminLogin.css" />
<style type="text/css">
table.tab {
	border-collapse: separate;
	border-spacing: 90px 40px
}
</style>
</head>
<body>
	<script type="text/javascript">
		function login(form) {
			if (form.userName.value == "") {
				document.getElementById("lmsg").innerHTML = ("Username cannot be empty!");
				return false;
			}
			if (form.userPassword.value == "") {
				document.getElementById("lmsg").innerHTML = ("Password cannot be empty!");
				return false;
			}
		}
	</script>
	<a href="index.html"><img src="resource/logo.png" width="290"
		height="119" alt="" /></a>
	<div id="msg">
		<%
			String inf = request.getParameter("info");
			if (inf != null)
				out.print(inf);
		%>
	</div>
	<div>
		<div id="login">
			<form method="post" action="AdminLoginServlet"
				onSubmit="return login(this);">
				<table cellpadding="10" align="center" border="0"
					style="border-collapse: collapse;">
					<tr>
						<td colspan="2" align="center">Administrator Log In</td>
					</tr>
					<tr>
						<td height="40px"></td>
					</tr>
					<tr>
						<td>User Name:</td>
						<td><input type="text" name="userName" /></td>
					</tr>
					<tr>
						<td height="40px"></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type="password" name="userPassword" /></td>
					</tr>
					<tr>
						<td colspan="2" height="20px"><div id="lmsg"></div></td>
					</tr>
					<tr>
						<td height="70px" class="tdstyle" colspan="2" align="center"><input
							type="submit" value="Log In" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>