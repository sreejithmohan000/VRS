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
<title>Book Vehicle Action</title>
</head>
<body>
<div>
	
</div>

<% 
session = request.getSession();
String vtype = request.getParameter("vtype");
String vclass = request.getParameter("vclass");
String  vmaker = request.getParameter("vmaker");
String  vname = request.getParameter("vname");
String  vcolor = request.getParameter("vcolor");
String  vdate = request.getParameter("vdate");
String  vdealer = request.getParameter("vdealer");
String un=(String)session.getAttribute("uname");
//Date tempDate = Date.valueOf(request.getParameter("tempDate")); 
//DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
//LocalDateTime tempDate = LocalDateTime.now();
//java.sql.Date sqlDate = java.sql.Date.valueOf(now);
java.util.Date now = new java.util.Date();
java.sql.Date sqlDate = new java.sql.Date(now.getTime());        
//int rid = (Integer)session.getAttribute("rid");
//String key = "";
//key = "temp"+"0"+rid+"k"+rid;

CustomerBean customerBean = new CustomerBean();
customerBean.setVtype(vtype);
customerBean.setVclass(vclass);
customerBean.setVmaker(vmaker);
customerBean.setVname(vname);
customerBean.setVname(vname);
customerBean.setVcolor(vcolor);
customerBean.setVdate(sqlDate);
customerBean.setVdealer(vdealer);
customerBean.setUname(un);
boolean flag = CustomerDao.insertTemp(customerBean);

if(flag==true){
    
    response.sendRedirect("userLogin2.jsp?val=Succesfully Booked");
}
else{
  
   response.sendRedirect("error.html");

  }
%>





</body>
</html>