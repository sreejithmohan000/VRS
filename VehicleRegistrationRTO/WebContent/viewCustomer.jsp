<%-- 
    Document   : view customer
    Created on : November 15, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ page import="rtodao.AdminDao" %>
	<%@ page import="rtobeans.AdminBean" %>
	<%@ page import="rtobeans.CustomerBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<script src="UserValidation.js"></script>
</head>
<body class="secStyle">
<ul style="background: black;margin-top: -8px;width:1552px;">
  <li><a class="" href="userLogin1.jsp" style="margin-left: 575px">Home</a></li>
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
String folder="images/";
String filePath="";

ArrayList<AdminBean> ab=AdminDao.viewCustomer();
for(AdminBean cusimg:ab){
	//filePath=folder+cusimg.getImg();
}
RtoBean rtoBean=new RtoBean();

 		int size=0;
 		size=ab.size();
      if(size==0){%>
    	  <h3 align="center">NO DATA TO SHOWN</h3>
      <% }else{%>
      <table width="500" border="1"  align="center" id="tstyle">

<tr>
	<th align="center">Sl.No</th>
	
	<th align="center">Name</th>	
		
     <th align="center">Address</th> 
     
      <th align="center">Id Proof</th> 
      
       <th align="center">Id Proof Number</th>
       <th align="center">Phone Number</th>
        <th align="center">Email ID</th>
       <th align="center">User Name</th> 
       <th align="center">Image</th>
       
        <th align="center">Action1</th>
        <th align="center">Action2</th>  
    
	
</tr>
      <% 
 		int i=0;
      
 			for(AdminBean it:ab){
 				i=i+1;
 				filePath=folder+it.getImg();

 			
                %>
 
 
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i%></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getName()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getAddress()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getIdproof()%></span></div></td>
		<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getIdproofno()%></span></div></td>
			<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getMob()%></span></div></td>
				<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getEmail()%></span></div></td>
					<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getUname()%></span></div></td>
										<td width="43" align="center"><div align="center" ><span style="font-size: 14"><img alt="No Image Added" src="<%=filePath%>" width="450px" height="250px"></span></div></td>
					
						<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="customerDelete.jsp?&cusername=<%=it.getUname()%>">DELETE</a></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="customerUpdate.jsp?dname=<%=it.getName()%>&daddress=<%=it.getAddress()%>&didproof=<%=it.getIdproof()%>&didproofno=<%=it.getIdproofno()%>&dmob=<%=it.getMob()%>&demail=<%=it.getEmail()%>&dusername=<%=it.getUname()%>">UPDATE</a></span></div></td>
	</tr>
  
  <% } }%>

</table>
</div>
</body>
</html>