<%-- 
    Document   : Delete Vehicle
    Created on : November 15, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="rtodao.DealerDao" %>
	<%@ page import="rtobeans.DealerBean" %>
	<%@ page import="java.util.ArrayList" %>
	<%@page import="java.sql.*"%>
  <%
    int id=Integer.parseInt(request.getParameter("id"));
    
    DealerBean dealerBean=new DealerBean();
    dealerBean.setId(id);
    //rtoBean.setUpswd(dpswd);
    
   boolean flag=DealerDao.deleteVehicle(dealerBean);
   		if(flag==true){
       
   			response.sendRedirect("viewVehicle.jsp");
   		}
   		else{
     
      		response.sendRedirect("error.html");
   
	 	 }
       

    %>