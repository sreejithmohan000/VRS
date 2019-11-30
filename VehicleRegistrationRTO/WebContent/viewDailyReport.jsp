<%-- 
    Document   : View Daily Report
    Created on : November 15, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Date "%>
    <%@ page import="rtobeans.AdminBean"%>
    <%@ page import="rtodao.AdminDao"%>
    <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Report</title>
</head>
<body class="secStyle">
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin1.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<h1 align="center">Daily Report</h1>
<div class="divStyle">
<form action="actionBookVehicle.jsp" method="post">
		<table border="1" id="tstyle"><tr><th>From Date</th><th>To Date</th><th>Permanent Number</th><th>USerNAme</th><th>Type</th><th>Maker</th></tr>
<%
java.util.Date now = new java.util.Date();
java.sql.Date sqlDate = new java.sql.Date(now.getTime()); 
AdminBean adminbean = new AdminBean();
adminbean.setCurrentDate(sqlDate);
ArrayList<AdminBean> alist = new ArrayList<AdminBean>();
alist = AdminDao.viewDailyReport(adminbean);
for(AdminBean ab: alist){

%>
<tr><td><%=ab.getFromDate() %></td><td><%=ab.getToDate()%></td>
<td><%=ab.getPermanantNumber() %></td>
<td><%=ab.getUserName()%></td>
<td><%=ab.getVehicleType() %></td>
<td><%=ab.getVehicleMaker() %></td>
</tr>
<%
}
%>
</table>			
</form>
	</div>
</body>
</html>