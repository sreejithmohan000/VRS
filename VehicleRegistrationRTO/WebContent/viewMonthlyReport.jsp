<%-- 
    Document   : View Monthly Report 
    Created on : October 30, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="rtobeans.AdminBean" %>
<%@ page import="java.util.*" %>
<%@ page import="rtodao.AdminDao" %>
<%@page import="java.sql.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Monthly Report</title>
</head>
<body class="secStyle">
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin1.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<h1 align="center">Monthly Report</h1>
<div class="divStyle">
		<table cellspacing="10" border="1" id="tstyle">
<tr><th>Apply Date</th><th>Approve Date</th><th>Permanent Number</th><th>UserNAme</th><th>Type</th><th>Maker</th></tr>

<%
Date fromDate = Date.valueOf(request.getParameter("fromDate")); 
Date toDate = Date.valueOf(request.getParameter("toDate"));
AdminBean adminbean = new AdminBean();
adminbean.setFromDate(fromDate);
adminbean.setToDate(toDate);
ArrayList<AdminBean> alist = new ArrayList<AdminBean>();
alist = AdminDao.viewMonthlyReport(adminbean);
for(AdminBean rb: alist){
%>
<tr><td><%=rb.getFromDate() %></td><td><%=rb.getToDate()%></td>
<td><%=rb.getPermanantNumber() %></td>
<td><%=rb.getUserName()%></td>
<td><%=rb.getVehicleType() %></td>
<td><%=rb.getVehicleMaker() %></td>
</tr>



<%
}
%>

        </table>
        </div>
</body>
</html>