<%-- 
    Document   : Delete Customer
    Created on : November 15, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="rtodao.AdminDao" %>
	<%@ page import="rtobeans.AdminBean" %>
	<%@ page import="java.util.ArrayList" %>
	<%@page import="java.sql.*"%>
  <%
    String cusername=request.getParameter("cusername");
    
    AdminBean adminBean=new AdminBean();
    adminBean.setUname(cusername);
    //rtoBean.setUpswd(dpswd);
    
   boolean flag=AdminDao.deleteCustomer(adminBean);
   		if(flag==true){
       
   			response.sendRedirect("viewCustomer.jsp");
   		}
   		else{
     
      		response.sendRedirect("error.html");
   
	 	 }
       

    %>