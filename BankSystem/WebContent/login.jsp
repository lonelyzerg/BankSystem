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
<link rel="stylesheet" type="text/css" href="css/login.css" />
<style type="text/css">
table.tab {
	border-collapse: separate;
	border-spacing: 90px 40px
}
</style>
</head>
<body background="resource/Background1.jpg">
	<%
		session.setAttribute("query", false);
	%>

	<script type="text/javascript">
		function isEmail(str) {
			var t = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
			return t.test(str);
		}
		function isPNum(str) {
			var t = /^\d+$/;
			return t.test(str);
		}
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
		function reg(form) {
			if (!isPNum(form.userPhone.value)) {
				document.getElementById("rmsg").innerHTML = ("Invalid phone number!");
				return false;
			}
			if (!isPNum(form.userPostal.value)||form.userPostal.value.length != 5) {
				document.getElementById("rmsg").innerHTML = ("Invalid postal code format!");
				return false;
			}
			if (!isEmail(form.userEmail.value)) {
				document.getElementById("rmsg").innerHTML = ("Invalid E-Mail!");
				return false;
			}
			if (form.conPassword.value != form.userPassword.value) {
				document.getElementById("rmsg").innerHTML = ("Password not match!");
				return false;
			}
			if (form.fName.value == "") {
				document.getElementById("rmsg").innerHTML = ("First name cannot be empty!");
				return false;
			}
			if (form.lName.value == "") {
				document.getElementById("rmsg").innerHTML = ("Last name cannot be empty!");
				return false;
			}
			if (form.userEmail.value == "") {
				document.getElementById("rmsg").innerHTML = ("Email cannot be empty!");
				return false;
			}
			if (form.userName.value == "") {
				document.getElementById("rmsg").innerHTML = ("Username cannot be empty!");
				return false;
			}
			if (form.userPassword.value == "") {
				document.getElementById("rmsg").innerHTML = ("Password cannot be empty!");
				return false;
			}
			if (form.userPhone.value == "") {
				document.getElementById("rmsg").innerHTML = ("Pleanse enter the phone number!");
				return false;
			}
			if (form.userAddr.value == "") {
				document.getElementById("rmsg").innerHTML = ("Password cannot be empty!");
				return false;
			}
			if (form.userCity.value == "") {
				document.getElementById("rmsg").innerHTML = ("City cannot be empty!");
				return false;
			}
			if (form.userState.value == "") {
				document.getElementById("rmsg").innerHTML = ("State cannot be empty!");
				return false;
			}
			if (form.userCountry.value == "") {
				document.getElementById("rmsg").innerHTML = ("Please enter the country!");
				return false;
			}
			if (form.userPostal.value == "") {
				document.getElementById("rmsg").innerHTML = ("Please enter the postal code!");
				return false;
			}
			if (form.conPassword.value == "") {
				document.getElementById("rmsg").innerHTML = ("Please repeat the password!");
				return false;
			}

		}
	</script>
	<a href="index.jsp"><img src="resource/logo.png" width="290"
		height="119" alt="" /></a>
	<div>
		<div id=login>
			<form method="post" action="LoginServlet" onSubmit="return login(this);">
				<table  cellpadding="5" align="center" border="0" style="border-collapse: collapse;">
					<tr>
						<td colspan="2" align="center">Log In</td>
					</tr>
					<tr><td height="20px"></td></tr>
					<tr>
						<td>User Name:</td>
						<td><input type="text" name="userName" /></td>
					</tr>
					<tr><td height="20px"></td></tr>
					<tr>
						<td>Password:</td>
						<td><input type="password" name="userPassword" /></td>
					</tr>
					<tr>
						<td colspan="2" height="20px"><div id="lmsg"></div></td>
					</tr>
					<tr>
						<td height="40px" class="tdstyle" colspan="2" align="center"><input
							type="submit" value="Log In" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div id=register>
			<form method="post" action="RegServlet" onSubmit="return reg(this);">
				<table cellpadding="10" align="center" border="0"
					style="border-collapse: collapse;">
					<tr>
						<td colspan="2" align="center">Register</td>
					</tr>
					<tr>
						<td>First Name:</td>
						<td><input type="text" name="fName" /></td>
					</tr>
					<tr>
						<td>Last Name:</td>
						<td><input type="text" name="lName" /></td>
					</tr>
					<tr>
						<td>E-Mail:</td>
						<td><input type="text" name="userEmail" /></td>
					</tr>
					<tr>
						<td>User Name:</td>
						<td><input type="text" name="userName" /></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type="password" name="userPassword" /></td>
					</tr>
					<tr>
						<td>Confirm Password:</td>
						<td><input type="password" name="conPassword" /></td>
					</tr>
					<tr>
						<td>Phone Number:</td>
						<td><input type="text" name="userPhone" /></td>
					</tr>
					<tr>
						<td>Address:</td>
						<td><input type="text" name="userAddr" /></td>
					</tr>
					<tr>
						<td>Line 2 (Optional):</td>
						<td><input type="text" name="userAddr2" /></td>
					</tr>
					<tr>
						<td>City:</td>
						<td><input type="text" name="userCity" /></td>
					</tr>
					<tr>
						<td>State:</td>
						<td><input type="text" name="userState" /></td>
					</tr>
					<tr>
						<td>Country:</td>
						<td><input type="text" name="userCountry" /></td>
					</tr>
					<tr>
						<td>Postal code:</td>
						<td><input type="text" name="userPostal" /></td>
					</tr>
					<tr>
						<td colspan="2" height="20px"><div id="rmsg"></div></td>
					</tr>
					<tr>
						<td class="tdstyle" colspan="2" align="center"><input
							type="submit" value="Register" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>