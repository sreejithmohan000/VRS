<%-- 
    Document   : view registration details
    Created on : November 16, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
          <%@ page import="rtodao.CustomerDao" %>
    <%@ page import="rtobeans.CustomerBean" %>
    <%@ page import="java.util.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<script src="UserValidation.js"></script>
</head>
<body class="secStyle">
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin2.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<div class="divStyle1">
<%@page import="rtobeans.RtoBean" %>
<%@page import="rtodao.RtoDAO" %>
<%@ page import="java.util.ArrayList" %>
<%
String uname=(String)session.getAttribute("uname");
    CustomerBean customerBean=new CustomerBean();
    customerBean.setUname(uname);
    ArrayList<CustomerBean> cb=CustomerDao.getTempNo(customerBean);
    String tempno=null;
    for(CustomerBean it:cb){
    	tempno=it.getTempno();
    }
    //customerBean.setUname(uname);
    customerBean.setTempno(tempno);
    ArrayList<CustomerBean> eb=CustomerDao.displayMsg(customerBean);


		int size=0;
		size=eb.size();
  if(size==0){%>
	  <h3 align="center">NO DATA TO SHOWN</h3>
  <% }else{%>
  <table border="1"  align="center" width="45%">

<tr>
<td align="center">Sl.No</td>

<td align="center">Date</td>	
  <td align="center">Vehicle name</td> 
 <td align="center">Temporary Number status</td> 
 <td align="center">Temporary Number</td>
  <td align="center">Permanent Number</td> 
 <td align="center">Permanent Number status</td> 
 
</tr>
  <% 
		int i=0;
  
			for(CustomerBean it:eb){

			i=i+1;

            %>


<tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i %></span></td>
<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getVdate() %> </span></div></td>
<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getVname()%> </span></div></td> 
<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getStatus()%></span></div></td>
<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getTempno()%></span></div></td>
<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getPno()%></span></div></td>
<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getStatus()%></span></div></td>

 
 

</tr>

<% } }%>


</table>
</div>
</body>
</html>