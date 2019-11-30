<%-- 
    Document   : Customer update action
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
    String dname=request.getParameter("dname");
    String daddress=request.getParameter("daddress");
    String didproof=request.getParameter("didproof");
    String didproofno=request.getParameter("didproofno");
    String dusername=request.getParameter("dusername");
    //String dpswd=request.getParameter("dpswd");
    String dmob=request.getParameter("dmob");
    String demail=request.getParameter("demail");
    
    AdminBean adminBean=new AdminBean();
    
       
    adminBean.setName(dname);
    adminBean.setAddress(daddress);
    adminBean.setIdproof(didproof);
    adminBean.setIdproofno(didproofno);
    adminBean.setMob(dmob);
    adminBean.setEmail(demail);
    adminBean.setUname(dusername);
    //rtoBean.setUpswd(dpswd);
    
   boolean flag=AdminDao.updateCustomer(adminBean);
   		if(flag==true){
       
   			response.sendRedirect("viewCustomer.jsp");
   		}
   		else{
     
      		response.sendRedirect("error.html");
   
	 	 }
       

    %>