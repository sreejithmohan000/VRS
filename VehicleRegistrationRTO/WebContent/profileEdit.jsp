<%-- 
    Document   : Edit user
    Created on : November 06, 2019
    Author     : VRS
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@page import="rtodao.RtoDAO" %>
    <%@page import="rtobeans.RtoBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>

    <%
    String un=(String)session.getAttribute("uname");
   // int id=(Integer)session.getAttribute("id");
  int id=0;
    RtoBean rtoBean=new RtoBean();
    
    rtoBean.setUname(un);
    ResultSet rs=RtoDAO.selectId(rtoBean);
    while(rs.next()){
  id=rs.getInt(1);
    }
  rtoBean.setId(id);
   
    ArrayList<RtoBean> rb=RtoDAO.viewCustDetails(rtoBean);


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
<html>
<head>

<style>

</style>


<link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<meta charset="ISO-8859-1">
<title>SignIn</title>
</head>
<body> 
<div class="single-slide-item"> 
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin2.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<div class="divStyle">
<form action="profileEditAction.jsp" name="signup" method='post' pattern="[a-zA-Z]+" >
<%for(RtoBean it:rb){ %>
<table><tr><td>

Name</td><td><input type="text" name="rname" required value="<%=it.getName()%>"></td></tr><tr><td>

Password</td><td><input type="text" name="rpswd" required value="<%=it.getUpswd()%>"title="Password must contain at least 6 characters, including UPPER/lowercase and numbers" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" onchange="
  this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"></td></tr><tr><td>
Mobile</td><td><input type="text" name="rmob"value="<%=it.getMob()%>" pattern="[7|8|9][0-9]{9}"></td></tr><tr><td>
Email</td><td><input type="email" name="remail" value="<%=it.getEmail()%>"></td></tr><tr><td>
</td><td><input type="hidden" name="id" value="<%=it.getId()%>"></td></tr><tr><td></td><td>
<input type="submit" value="submit"><br></td></tr>
</table>
<%} %>

<label name="msg" value="<%=val%>" style="margin-left: 580px;color:red;"><%=val%></label>
</form>
 </div>
 </div>
</body>
</html>