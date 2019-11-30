<%-- 
    Document   : vehicle update 
    Created on : November 15, 2019
    Author     : SREEJITH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rtobeans.DealerBean" %>
<%@page import="rtodao.DealerDao" %>

<%  
int id=Integer.parseInt(request.getParameter("id"));
String vtype=request.getParameter("vtype");
String vclass=request.getParameter("vclass");
String vmaker=request.getParameter("vmaker");
String vname=request.getParameter("vname");
String vcolor=request.getParameter("vcolor");

%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<script src="UserValidation.js"></script>
<meta charset="ISO-8859-1">
<title>SignUp</title>
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
<form action="vehicleUpdateAction.jsp" name="vehicleupdate" method='post'>
<table>
<tr><td></td><td><input type="hidden" name="id"  value=<%=id%> ></td></tr>

<tr><td>
Vehicle type</td><td><input type="text" name="vtype"  value=<%=vtype%> required></td></tr><tr><td>
<tr><td>
Vehicle class</td><td><input type="text" name="vclass" value=<%=vclass%> required></td></tr><tr><td>

                                         
Vehicle maker</td><td><input type="text" name="vmaker" value=<%=vmaker%> required></td></tr><tr><td>
Vehicle name</td><td><input type="text" name="vname" value=<%=vname%> required></td></tr><tr><td>
                       

Vehicle color</td><td><input type="text" name="vcolor" value=<%=vcolor%> required></td></tr><tr><td>

<input type="submit" value="update"><br></td></tr>
</table>
</form>
</div>
</body>
</html>