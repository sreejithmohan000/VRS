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
<link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<script type="text/javascript">
	function check(){
		var idtype= document.getElementById("ridproof");
		var optionSelIndex = idtype.options[idtype.selectedIndex].value;
		var optionSelText = idtype.options[idtype.selectedIndex].text;
		if(optionSelIndex==0)
		{
		alert("Please select an option");
		}
		else if(optionSelIndex==1) {
			alert("Please enter 10 aadhar number");
			proofNo();
		}
		else if(optionSelIndex==2) {
			alert("Please enter voters number");
		}
		else if(optionSelIndex==3) {
			alert("Please enter driving number");
		}
        return true;	
	}
	function proofNo(){
		var pNo=document.getElementById("ridproofno").value;
		var pNoText = pNo.options[pNo.selectedIndex].text;
			if(pNo.length!=10) {
				alert("Please enter correct aadhar number");
			}
		
	}
	
</script>
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
<form action="imageUpload.jsp" enctype="multipart/form-data" method="post"><tr>
Image</td><td><input type="file" name="file" required size="50"></td><td><input type="submit" value="Upload"></td></tr>
</form>
<form action="signupAction.jsp" name="signup" method='post'>
<table><tr><td>
<font style="color:red">*</font> Name </td><td><input type="text" name="rname" required pattern="[a-zA-Z]+" /></td></tr><tr><td>
<tr><td><label><font style="color:red">*</font> Gender </label></td><td><input type="radio" name="rgender" id="rgender" value="male">Male</td>
                        <td><input type="radio" name="rgender" id="rgender" value="female">Female</td></tr><tr><td>
<tr><td><label><font style="color:red">*</font> Id proof </label>
                        </td><td><select name="ridproof" required id="ridproof" onchange="check()">
                        <option value="0">Select</option>
                        <option value="1" name="aadhar">Aadhar card</option>
                    <option value="2" name="votersid">Voters Id</option>
                    <option value="3" name="drivinglicense">Driving License</option></select>
                    </td></tr>   <tr><td>
                                         
<font style="color:red">*</font> Id proof No </td><td><input type="text" name="ridproofno" required onchange="proofNo(this.value)"></td></tr><tr><td>
<font style="color:red">*</font> Username </td><td><input type="text" name="rusername" required pattern="[a-zA-Z]+" /></td></tr><tr><td>
                      
<font style="color:red">*</font> Password </td><td><input type="password" name="rpswd" title="Password must contain at least 6 characters, including UPPER/lowercase and numbers" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" onchange="
  this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"></td></tr><tr><td>
<font style="color:red">*</font> Mobile</td><td><input type="text" name="rmob" required pattern="[7|8|9][0-9]{9}"></td></tr><tr><td>
 <font style="color:red">*</font> Email </td><td><input type="email" name="remail" required></td></tr><tr><td>
<font style="color:red">*</font> Address </td><td><textarea name="address" required></textarea> </td></tr><tr><td></td><td>
<input type="submit" value="submit"><br></td></tr>
</table>
<a href="index.jsp">Home</a>
<label name="msg" value="<%=val%>" style="margin-left: 580px;color:red;"><%=val%></label>
</form>

</div>
</body>
</html>