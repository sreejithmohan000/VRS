<%-- 
    Document   : dealer update 
    Created on : November 15, 2019
    Author     : SREEJITH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rtobeans.AdminBean" %>
<%@page import="rtodao.AdminDao" %>

<%   
String dname=request.getParameter("dname");
String daddress=request.getParameter("daddress");
String didproof=request.getParameter("didproof");
String didproofno=request.getParameter("didproofno");
String dusername=request.getParameter("dusername");
String dpswd=request.getParameter("dpswd");
String dmob=request.getParameter("dmob");
String demail=request.getParameter("demail");
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
  <li><a class="" href="userLogin1.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<div class="divStyle">
<form action="dealerUpdateAction.jsp" name="dealerupdate" method='post'>
<table><tr><td>
Name</td><td><input type="text" name="dname"  value=<%=dname%> required></td></tr><tr><td>
<tr><td>
Address</td><td><input type="text" name="daddress" value=<%=daddress%> required></td></tr><tr><td>
<tr><td><label>Id proof</label>
                        </td><td><select name="didproof" >
                        <option>Select</option>
                        <option value="aadhar" name="aadhar">Aadhar card</option>
                    <option value="votersid" name="votersid">Voters Id</option>
                    <option value="drivinglicense" name="drivinglicense">Driving License</option></select>
                    </td></tr>   <tr><td>
                                         
Id proof No</td><td><input type="text" name="didproofno" value=<%=didproofno%> required></td></tr><tr><td>
Username</td><td><input type="text" name="dusername" value=<%=dusername%> required readonly="readonly"></td></tr><tr><td>
                       

Mobile</td><td><input type="text" name="dmob" value=<%=dmob%> required></td></tr><tr><td>
Email</td><td><input type="text" name="demail" value=<%=demail%> required></td></tr><tr><td></td><td>

<input type="submit" value="update"><br></td></tr>
</table>
<a href="index.jsp">Home</a>
</form>
</div>
</body>
</html>