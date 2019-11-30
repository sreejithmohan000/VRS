<%-- 
    Document   : Profile edit action
    Created on : November 06, 2019
    Author     : VRS
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="rtodao.RtoDAO" %>
    <%@page import="rtobeans.RtoBean" %>

<%@ page import="java.sql.ResultSet" %>
    
<%

int iid=Integer.parseInt(request.getParameter("id"));
out.print(iid);
String rpswd=request.getParameter("rpswd");
String rname=request.getParameter("rname");
String remail=request.getParameter("remail");
String rmob=request.getParameter("rmob");
RtoBean rtoBean=new RtoBean();
rtoBean.setEmail(remail);
rtoBean.setUpswd(rpswd);
rtoBean.setId(iid);
rtoBean.setMob(rmob);
rtoBean.setName(rname);
boolean flag=RtoDAO.updateCustomerDetails(rtoBean);
if(flag)
	response.sendRedirect("userLogin2.jsp?val=sucessfully updated");
else
	response.sendRedirect("userLogin2.jsp?val=could not updated");
%>