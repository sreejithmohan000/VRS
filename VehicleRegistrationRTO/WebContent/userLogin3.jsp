<%-- 
    Document   : User Home
    Created on : November 07, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
   <%@ page import="rtodao.RtoDAO" %>
	<%@ page import="rtobeans.RtoBean" %>
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

	session=request.getSession(false);
    
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
    
    String userName = (String) session.getAttribute("uname");
    if (userName==null || userName=="") {
        response.sendRedirect("index.jsp");
    }
    
  String un=(String)session.getAttribute("uname");
  String rl=(String)session.getAttribute("role");
  
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dealer Home</title>
</head>
<body class="secStyle">
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin3.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<div class="divStyle">
<b>Welcome <%=un%> Role <%=rl %></b>
<br><a href='addVehicle.jsp' style="color: green">Add Vehicle</a>
<br><a href='tempReg.jsp' style="color: green">Temporary Registration</a>
<br><a href='viewVehicle.jsp' style="color: green">view Vehicle</a>
<!--  <br><a href='signout.jsp' style="color: green">Signout</a>-->
</div>
<label name="msg" value="<%=val%>" style="margin-left: 580px;color:red;"><%=val%></label>
</body>
</html>