<%-- 
    Document   : view vehicle
    Created on : November 15, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="rtodao.DealerDao"%>
<%@ page import="rtobeans.DealerBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="UserLoginStyle.css">
<script src="UserValidation.js"></script>
</head>
<body class="secStyle">
	<ul style="background: black; margin-top: -8px; width: 1552px;">
		<li><a class="" href="userLogin3.jsp" style="margin-left: 575px">Home</a></li>
		<li><a href="contact.html">Contact</a></li>
		<li><a href="about.html">About</a></li>
		<li><a href="signout.jsp">Signout</a></li>
	</ul>
	<br>
	<div class="divStyle1">
		<%@page import="rtobeans.RtoBean"%>
		<%@page import="rtodao.RtoDAO"%>
		<%@ page import="java.util.ArrayList"%>
		<%
		DealerBean dealerBean=new DealerBean();
		String uname=(String)session.getAttribute("uname");
	    dealerBean.setUname(uname);
			ArrayList<DealerBean> db = DealerDao.viewVehicle(dealerBean);
			

			int size = 0;
			size = db.size();
			if (size == 0) {
		%>
		<h3 align="center">NO DATA TO SHOWN</h3>
		<%
			} else {
		%>
		<table width="500" border="1" align="center" id="tstyle">

			<tr>
				<th align="center">Id</th>

				<th align="center">Vehicle type</th>

				<th align="center">Vehicle class</th>

				<th align="center">Vehicle maker</th>

				<th align="center">Vehicle name</th>
				<th align="center">Vehicle color</th>


				<th align="center">Action1</th>
				<th align="center">Action2</th>


			</tr>
			<%
				int i = 0;

					for (DealerBean it : db) {
						i = i + 1;
			%>


			<tr>
				<td width="12" height="20" align="center"><span
					style="font-size: 14"><%=i%></span></td>
				

				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><%=it.getVtype()%></span>
					</div></td>
					
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><%=it.getVclass()%></span>
					</div></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><%=it.getVmaker()%></span>
					</div></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><%=it.getVname()%></span>
					</div></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><%=it.getVcolor()%></span>
					</div></td>

				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><a
							href="vehicleDelete.jsp?&id=<%=it.getId()%>">DELETE</a></span>
					</div></td>
				<td width="43" align="center"><div align="center">
						<span style="font-size: 14"><a
							href="vehicleUpdate.jsp?id=<%=it.getId()%>&vtype=<%=it.getVtype()%>&vclass=<%=it.getVclass()%>&vmaker=<%=it.getVmaker()%>&vname=<%=it.getVname()%>&vcolor=<%=it.getVcolor()%>">UPDATE</a></span>
					</div></td>
			</tr>

			<%
				}
				}
			%>

		</table>
	</div>
</body>
</html>