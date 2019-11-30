<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="rtobeans.CustomerBean" %>
<%@ page import="rtodao.CustomerDao" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
	
</div>

<% 

session = request.getSession();
String tempno = request.getParameter("tempno");
String un=(String)session.getAttribute("uname");

java.util.Date now = new java.util.Date();
java.sql.Date sqlDate = new java.sql.Date(now.getTime());        

CustomerBean customerBean = new CustomerBean();
customerBean.setTempno(tempno);
customerBean.setUname(un);
customerBean.setVdate(sqlDate);
boolean flag = CustomerDao.insertPermanent(customerBean);

if(flag==true){
    
    response.sendRedirect("userLogin2.jsp?val=Succesfully Registered");
}
else{
  
   response.sendRedirect("error.html");

  }
%>





</body>
</html>