<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <%@ page import="rtodao.RtoDAO" %>
	<%@ page import="rtobeans.RtoBean" %>
	<%@page import="java.sql.*"%>
      <%@page import="java.util.*"%>
      <%int id=Integer.parseInt(request.getParameter("id")); %>
<html>
<head>

<style>

</style>


<link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<meta charset="ISO-8859-1">
<title>SignIn</title>
</head>
<body class="secStyle"> <div class="single-slide-item"> 
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin3.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<!--  <h1 style="    margin-left: 251px;
    font-size: 60px;
    color: blue;">VEHICLE REGISTRATION SYSTEM</h1>-->

<div class="divStyle">

<form action="tempRegAction.jsp">
<input type="hidden" name="id" value="<%=id%>">
<input type="text" name="engineno" placeholder="Enter engine number"><br>

<input type="text" name="chasisno" placeholder="Enter chasis number">
<input type="submit" name="sub" value="submit"></form>
</div>
</div>

<footer style="margin-left: 300px">
<ul style="margin-top: -19px;margin-right: -10px;     margin-left: -300px;">
<li style="margin-left: 432px;"><a href="">Copyright</a></li><li><a href="">Privacy Policy</a></li><li ><a href="contact.html">Contact Us</a></li></ul>
</footer>

</body>

</html>












