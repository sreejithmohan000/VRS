<%-- 
    Document   : Approve Permanent Registration
    Created on : November 17, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="rtobeans.AdminBean" %>
<%@ page import="rtodao.AdminDao" %>
<%@page import="rtobeans.PermanentRegBean"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approve Permanent Registration</title>
</head>
<body class="secStyle">
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin1.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<h1 align="center">Approve Permanent Registration</h1>
<div class="divStyle1">
<table border=1 align="center" id="tstyle"><tr><th>Applied Date</th><th>Vehicle Name</th><th>Vehicle Type</th><th>Vehicle Class</th><th>Vehicle Maker</th><th>Temp No</th><th>User Name</th><th>Reg Name</th><th>Id Proof</th><th>Id ProofNo</th><th>Mobile</th><th>Status</th><th>Action</th></tr>
<% 
AdminBean adbean = new AdminBean();
//rayList<AdminBean> alist = new ArrayList<AdminBean>();
ArrayList<PermanentRegBean> alist = new ArrayList<PermanentRegBean>();
alist = AdminDao.approvePermanentNumber();
for(PermanentRegBean pb:alist){
	int pId = pb.getpId();
	String email = pb.getEmail();
	//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+pId);
%>
<tr>
<td><%=pb.getAppliedDate()%></td>
<td><%=pb.getVehicleName()%></td>
<td><%=pb.getVehicleType()%></td>
<td><%=pb.getVehicleClass()%></td>
<td><%=pb.getVehicleMaker()%></td>
<td><%=pb.getTempNo()%></td>
<td><%=pb.getUname()%></td>
<td><%=pb.getRegName()%></td>
<td><%=pb.getIdProof()%></td>
<td><%=pb.getIdProofNo()%></td>
<td><%=pb.getRegMob()%></td>
<td><%=pb.getStatus()%></td>
<td><button><a href="approvePermanentAction.jsp?pId=<%=pId %>&email=<%=email %>">Approve</a></button></td>
</tr>
<%
}
%>
</table>
        </div>
</body>
</html>