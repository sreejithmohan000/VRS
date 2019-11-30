<%-- 
    Document   : Add dealer
    Created on : November 15, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<script src="UserValidation.js"></script>
<meta charset="ISO-8859-1">
<title>Add Dealer</title>
</head>
<body class="secStyle">
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin1.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<h1 align="center">Add Dealer</h1>
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
     %>
<div class="divStyle">
<form action="addDealerAction.jsp" name="dealer" method='post'>
<table cellspacing="10" id="tstyle"><tr><td>
Name</td><td><input type="text" name="dname" required></td></tr><tr><td>
<tr><td>
Address</td><td><input type="text" name="daddress" required></td></tr><tr><td>
<tr><td><label>Id proof</label>
                        </td><td><select name="didproof" >
                        <option>Select</option>
                        <option value="aadhar" name="aadhar">Aadhar card</option>
                    <option value="votersid" name="votersid">Voters Id</option>
                    <option value="drivinglicense" name="drivinglicense">Driving License</option></select>
                    </td></tr>   <tr><td>
                                         
Id proof No</td><td><input type="text" name="didproofno" required></td></tr><tr><td>
Username</td><td><input type="text" name="dusername" required></td></tr><tr><td>
                       
Password</td><td><input type="password" name="dpswd" required></td></tr><tr><td>
Mobile</td><td><input type="text" name="dmob"></td></tr><tr><td>
Email</td><td><input type="text" name="demail"></td></tr><tr><td></td><td>

<input type="submit" value="submit"><br></td></tr>
</table>
</form>
</div>
<label name="msg" value="<%=val%>" style="margin-left: 580px;color:red;"><%=val%></label>
</body>
</html>