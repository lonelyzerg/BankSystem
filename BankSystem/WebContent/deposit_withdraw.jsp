<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="data.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deposit and Withdraw</title>
<link rel="stylesheet" type="text/css" href="css/dw.css" />
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
		if (user == null || !user.isAdmin()) {
			session.invalidate();
			response.sendRedirect("login.jsp?info=Please+Login+First");
		} else {
			String i =(String) request.getAttribute("wInfo");
	%>
	<script type="text/javascript">
		function test(str) {
			var t = /^\d+(\.\d+)?$/;
			return t.test(str);
		}
		function dw(form) {
			if (form.username.value == "") {
				document.getElementById("dmsg").innerHTML = ("Username cannot be empty!");
				document.getElementById("wmsg").innerHTML = ("Username cannot be empty!");
				return false;
			}
			if (form.amount.value == "") {
				document.getElementById("dmsg").innerHTML = ("Amount cannot be empty!");
				document.getElementById("wmsg").innerHTML = ("Amount cannot be empty!");
				return false;
			}
			if (!test(form.amount.value)) {
				document.getElementById("dmsg").innerHTML = ("Invalid money format!");
				document.getElementById("wmsg").innerHTML = ("Invalid money format!");
				return false;
			}
		}
		function deposit(){
			document.getElementById("depositDiv").style.display = "block";
			document.getElementById("withdrawDiv").style.display = "none";
		}
		function withdraw(){
			document.getElementById("withdrawDiv").style.display = "block";
			document.getElementById("depositDiv").style.display = "none";
		}
	</script>
	<div id="Header">
		<div id="Logo">
			<a href="admin.jsp"><img src="resource/logo.png" width="290"
				height="119" alt="" /></a>
		</div>
		<div id="login_after">
			<a href="admin.jsp" rel="nofollow">Welcome, <%=user.getUsername()%></a>
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
	<br><br>
	<table align="center" cellpadding="10">
	<tr><td>
		<input type="radio" name="type" onclick="deposit()" id="deposit" value="deposit" checked="checked"><label for="deposit">Deposit</label> 
	</td><td>
		<input type="radio" name="type" onclick="withdraw()" id="withdraw" value="withdraw"><label for="withdraw">Withdraw</label> 
	</td></tr>
	</table>
	<div id="depositDiv">
		<form method="post" action="DepositServlet" onSubmit="return dw(this);">
			<table align="center" cellpadding="10">
				<tr align="center">
					<td>Deposit <input type="text" name="amount" /> $ to User <input
						type="text" name="username" />'s account.</td>
				</tr>
				<tr align="center">
					<td height="20px"><div id="dmsg"><%if(i!=null) out.print(i);%></div></td>
				</tr >
				<tr align="center">
					<td> <input type="submit" value="Deposit" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="withdrawDiv" style="display:none">
		<form method="post" action="WithdrawServlet" onSubmit="return dw(this);">
			<table align="center" cellpadding="10">
				<tr align="center">
					<td>Withdraw <input type="text" name="amount" /> $ from User
						<input type="text" name="username" />'s account.</td>
				</tr>
				<tr align="center">
					<td height="20px"><div id="wmsg"><%if(i!=null) out.print(i);%></div></td>
				</tr>
				<tr align="center">

					<td><input type="submit" value="Withdraw" /></td>
				</tr>
			</table>
		</form>
	</div>
	
	<%
		}
	%>
</body>
</html>