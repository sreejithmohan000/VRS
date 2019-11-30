<%-- 
    Document   : signup user
    Created on : November 06, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  <li><a class="" href="index.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<div class="divStyle">
<form action="signupAction.jsp" name="signup" method='post'>
<table><tr><td>
Name</td><td><input type="text" name="rname" required></td></tr><tr><td>
<tr><td><label>Gender</label></td><td><input type="radio" name="rgender" id="rgender" value="male">Male</td>
                        <td><input type="radio" name="rgender" id="rgender" value="female">Female</td></tr><tr><td>
<tr><td><label>Id proof</label>
                        </td><td><select name="ridproof" >
                        <option>Select</option>
                        <option value="aadhar" name="aadhar">Aadhar card</option>
                    <option value="votersid" name="votersid">Voters Id</option>
                    <option value="drivinglicense" name="drivinglicense">Driving License</option></select>
                    </td></tr>   <tr><td>
                                         
Id proof No</td><td><input type="text" name="ridproofno" required></td></tr><tr><td>
Username</td><td><input type="text" name="rusername" required></td></tr><tr><td>
                       
Password</td><td><input type="password" name="rpswd" required></td></tr><tr><td>
Mobile</td><td><input type="text" name="rmob"></td></tr><tr><td>
Email</td><td><input type="text" name="remail"></td></tr><tr><td></td><td>

<input type="submit" value="submit"><br></td></tr>
</table>
<a href="index.jsp">Home</a>
<label name="msg" value="<%=val%>" style="margin-left: 580px;color:red;"><%=val%></label>
</form>
</div>
</body>
</html>