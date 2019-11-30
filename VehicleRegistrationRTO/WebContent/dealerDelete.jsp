<%-- 
    Document   : Delete Dealer
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
    String dusername=request.getParameter("dusername");
    
    AdminBean adminBean=new AdminBean();
    adminBean.setUname(dusername);
    //rtoBean.setUpswd(dpswd);
    
   boolean flag=AdminDao.deleteDealer(adminBean);
   		if(flag==true){
       
   			response.sendRedirect("viewDealer.jsp");
   		}
   		else{
     
      		response.sendRedirect("error.html");
   
	 	 }
       

    %>