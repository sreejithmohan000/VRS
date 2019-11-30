<%-- 
    Document   : index
    Created on : November 06, 2019
    Author     : VRS
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <%@ page import="rtodao.RtoDAO" %>
	<%@ page import="rtobeans.RtoBean" %>
	<%@page import="java.sql.*"%>
      <%@page import="java.util.*"%>
      <%
      String val="";
      try{
      val=request.getParameter("val"); 
      if(val.equals(null)){
    	  val="";
      }
      }
      catch(Exception e){
    	  val="";
      }
      %>

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
  <li><a class="" href="index.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
</ul>
<br>
<!--  <h1 style="    margin-left: 251px;
    font-size: 60px;
    color: blue;">VEHICLE REGISTRATION SYSTEM</h1>-->
    <div >
 <img src="logo2.jpg" style="    width: 236px;
    height: 162px;
    margin-left: 37px;
    margin-top: -19px;"/> </div> 
<div class="divStyle">

<form action="loginAction.jsp" name="login" method="post">
<label name="msg" value="<%=val%>" style="margin-left: -20px;color:red;"><%=val%></label>
<table>

<tr><td>
Username</td><td><input type="text" name="uname"></td></tr><tr><td>
Password</td><td><input type="password" name="pswd"></td><td></td></tr><tr><td></td><td>
<input type="submit" value="submit" style="background-color: black;color: white;" id="btn"></td><td></td></tr><tr><td>
For Users only<a href="signUpcopy.jsp" style="color: red">SignUp</a></td></tr>


</table>

</form>
</div>
</div>
<footer style="margin-left: 300px;margin-top: 20px;">
<ul style="margin-top: -19px;margin-right: -10px;     margin-left: -300px;">
<li style="margin-left: 575px;"><a href="">Copyright</a></li><li><a href="">Privacy Policy</a></li><li ><a href="contact.html">Contact Us</a></li></ul>
</footer>

</body>

</html>