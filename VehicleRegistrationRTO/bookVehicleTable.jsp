<%-- 
    Document   : Send Message 
    Created on : October 30, 2019
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
	ArrayList<CustomerBean> cb=CustomerDao.selectVehicle();

	CustomerBean customerBean=new CustomerBean();
	 
	%><div class="divStyle"><form action="actionBookVehicle.jsp" name="sendMsg" method="post">
	<table><tr><td>
	Vehicle Type</td><td>
				<select name="vtype">
				<option>select</option>
				<% 
		         for(CustomerBean it:cb){ %>
		            <option><%= it.getVtype()%></option>
		        <% } %>
		        </select></td></tr><tr><td>
    <tr><td>
	Vehicle Class</td><td>
				<select name="vclass"><option>select</option><% 
		         for(CustomerBean it:cb){ %>
		            <option><%= it.getVclass()%></option>
		        <% } %>
		        </select></td></tr><tr><td>
	<tr><td>
	Vehicle Maker</td><td>
				<select name="vmaker"><option>select</option><% 
		         for(CustomerBean it:cb){ %>
		            <option><%= it.getVmaker()%></option>
		        <% } %>
		        </select></td></tr><tr><td>
	<tr><td>
	Vehicle Name</td><td>
				<select name="vname"><option>select</option><% 
		         for(CustomerBean it:cb){ %>
		            <option><%= it.getVname()%></option>
		        <% } %>
		        </select></td></tr><tr><td>
    <tr><td>
	Vehicle Color</td><td>
				<select name="vcolor"><option>select</option><% 
		         for(CustomerBean it:cb){ %>
		            <option><%= it.getVcolor()%></option>
		        <% } %>
		        </select></td></tr><tr><td></td><td>
		        <input type="submit" value="submit"></td></tr>
		        
</table>				
</form>
</div>
</body>
</html>

