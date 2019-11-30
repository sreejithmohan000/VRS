<%-- 
    Document   : Permanent Registration  
    Created on : November 17, 2019
    Author     : Sreejith
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" type="text/css" href="UserLoginStyle.css"></head>
<body class="secStyle">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="rtobeans.CustomerBean" %>
<%@ page import="rtodao.CustomerDao" %>
	<%@ page import="java.util.ArrayList" %>
	<%
	CustomerBean customerBean=new CustomerBean();
	String uname=(String)session.getAttribute("uname");
    customerBean.setUname(uname);
	ArrayList<CustomerBean> cb=CustomerDao.getTempNo(customerBean);
	%>
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin2.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
	<div class="divStyle"><form action="permanentRegAction.jsp" name="sendMsg" method="post">
	<table id="tstyle">
    <tr><td>
	Temporary Number</td><td>
				<select name="tempno"><option>select</option><% 
		         for(CustomerBean it:cb){ %>
		            <option><%= it.getTempno()%></option>
		        <% } %>
		        </select></td></tr>
	<tr><td></td><td>
		        <input type="submit" value="submit"></td></tr>
		        
</table>				
</form>
</div>
</body>
</html>

