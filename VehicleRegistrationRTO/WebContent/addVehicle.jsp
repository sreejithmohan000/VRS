<%-- 
    Document   : Add Vehicle 
    Created on : November 15, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Vehicle</title>
</head>
<body class="secStyle">
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin3.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<h1 align="center">Add Vehicle</h1>
<div class="divStyle">
<form action="addVehicleAction.jsp" method="post" name="login">
		<table cellspacing="10" id="tstyle"><tr><td>Vehicle type</td><td>
		<select name="vtype" >
                        <option>Select</option>
                        <option value="Two-Wheeler">Two-Wheeler</option>
                    <option value="Four-Wheeler">Four-Wheeler</option>
                    </select></td></tr>  
                    <tr><td>vehicle_class</td><td>
                    <select name="vclass" >
                        <option>Select</option>
                        <option value="Motor Cycle-below 95CC">Motor Cycle-below 95CC</option>
                    <option value="Motor Cycle-above 95CC">Motor Cycle-above 95CC</option>
                    </select></td></tr>
                    <tr><td>Vehicle maker</td><td>
                    <select name="vmaker" >
                        <option>Select</option>
                        <option value="Honda">Honda</option>
                    <option value="Bajaj">Bajaj</option>
                    </select></td></tr>
                    <tr><td>Vehicle Name</td><td>
                    <input type="text" name="vname"></td></tr>
                    <tr><td>Vehicle Color</td><td>
                    <select name="vcolor" >
                        <option>Select</option>
                        <option value="Black">Black</option>
                    <option value="Red">Red</option>
                    </select></td></tr>
                    <tr><td></td><td>
        <input type="submit" value="Submit"><br><br></td></tr>
        </table>
        </form>
        </div>
</body>
</html>