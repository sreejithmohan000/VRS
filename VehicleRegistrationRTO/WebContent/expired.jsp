<%-- 
    Document   : Expired
    Created on : November 06, 2019
    Author     : Sreejith
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
<body> <div class="single-slide-item"> 
<ul style="background: black">
  <li><a class="" href="index.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
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

Your Temporary Registration Expired...Please visit RTO..!!
</div>
</div>
<label name="msg" value="<%=val%>" style="margin-left: 580px;color:red;"><%=val%></label>
<footer style="margin-left: 300px">
<ul style="margin-top: -19px;margin-right: -10px;     margin-left: -300px;">
<li style="margin-left: 432px;"><a href="">Copyright</a></li><li><a href="">Privacy Policy</a></li><li ><a href="contact.html">Contact Us</a></li></ul>
</footer>

</body>

</html>