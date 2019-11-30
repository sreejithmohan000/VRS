<%-- 
    Document   : Temporary registration
    Created on : November 16, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Date "%>
        <%@ page import="rtodao.DealerDao" %>
	<%@ page import="rtobeans.DealerBean" %>
	<%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Temporary Registration</title>
</head>
<body class="secStyle">
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin3.jsp" style="margin-left: 575px">Home</a></li>
  <li><a href="contact.html">Contact</a></li>
  <li><a href="about.html">About</a></li>
  <li><a href="signout.jsp">Signout</a></li>
</ul>
<br>
<h1 align="center">Temporary Registration</h1>
<div class="divStyle1">
		<table>
			<%
			String un=(String)session.getAttribute("uname");
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
			session=request.getSession(false);
ArrayList<DealerBean> db=DealerDao.displayNewBooking(un);


 		int size=0;
 		size=db.size();
      if(size==0){%>
    	  <h3 align="center">NO NEW REQUESTS</h3>
      <% }else{%>
      <table border="1"  align="center" width="45%">

<tr>
	<th align="center" id="tstyle">Sl.No</th>
	
	<td align="center">Date</td>	
		
     <td align="center">Name</td> 
     <td align="center">Dealer</td> 
     <td align="center">Maker</td> 
     <td align="center">Vehicle name</td> 
     <td align="center">class</td> 
     <td align="center">Type</td> 
     <td align="center">Engine number</td>
</tr>
      <% 
 		int i=0;
      
 			for(DealerBean it:db){

 			i=i+1;
  
                %>
 

    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i %></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getDate() %> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getUname() %></span></div></td>
	 
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getVdealer()%></span></div></td>
	 <td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getVmaker()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getVname()%> </span></div></td>
	  <td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getVclass()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getVtype()%> </span></div></td>
	
	 <td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="tempAddField.jsp?id=<%=it.getId() %>">Approve</a> </span></div></td>
	 
	</tr>
  
  <% } }%>
			
		</table>
	</div>
	<label name="msg" value="<%=val%>" style="margin-left: 580px;color:red;"><%=val%></label>
</body>
</html>