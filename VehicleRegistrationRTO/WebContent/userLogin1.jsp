<%-- 
    Document   : Admin Home
    Created on : November 15, 2019
    Author     : VRS
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
<title>Admin Home</title>
</head>
<body class="secStyle">
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin1.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<div class="divStyle">
<b>Welcome <%=un%> Role <%=rl %></b>
<br><a href='viewDailyReport.jsp' style="color: green">View Daily Report</a>
<br><a href='monthlyReport.jsp' style="color: green">View Monthly Report</a>
<br><a href='addDealer.jsp' style="color: green">Add dealer</a>
<br><a href='viewDealer.jsp' style="color: green">View dealer</a>
<br><a href='viewCustomer.jsp' style="color: green">View Customer</a>
<br><a href='approvePermanent.jsp' style="color: green">Approve Permanent Registration</a>
<!--  <br><a href='signout.jsp'>Signout</a>-->
</div>
<label name="msg" value="<%=val%>" style="margin-left: 580px;color:red;"><%=val%></label>
</body>
</html>