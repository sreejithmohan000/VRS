<%-- 
    Document   : Monthly Report 
    Created on : October 30, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Monthly Report</title>
</head>
<body class="secStyle">
	<ul style="background: black; margin-top: -8px; width: 1552px;">
		<li><a class="" href="userLogin1.jsp" style="margin-left: 575px">Home</a></li>
		<li><a href="contact.html">Contact</a></li>
		<li><a href="about.html">About</a></li>
		<li><a href="signout.jsp">Signout</a></li>
	</ul>
	<br>
	<h1 align="center">Monthly Report</h1>
	<div class="divStyle">
		<form action="viewMonthlyReport.jsp" method="post" name="login">
			<table cellspacing="10">
				<tr>
					<td>From Date</td>
					<td><input type="date" name="fromDate"></td>
				</tr>
				<tr>
					<td>To Date</td>
					<td><input type="date" name="toDate"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Submit"><br>
					<br></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>