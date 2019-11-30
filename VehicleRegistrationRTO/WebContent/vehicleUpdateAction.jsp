<%-- 
    Document   : Vehicle update action
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
    String vtype=request.getParameter("vtype");
    String vclass=request.getParameter("vclass");
    String vmaker=request.getParameter("vmaker");
    String vname=request.getParameter("vname");
    String vcolor=request.getParameter("vcolor");
    
    DealerBean dealerBean=new DealerBean();
    
       
    dealerBean.setVtype(vtype);
    dealerBean.setVclass(vclass);
    dealerBean.setVmaker(vmaker);
    dealerBean.setVname(vname);
    dealerBean.setVcolor(vcolor);

   boolean flag=DealerDao.updateVehicle(dealerBean);
   		if(flag==true){
       
   			response.sendRedirect("viewVehicle.jsp");
   		}
   		else{
     
      		response.sendRedirect("error.html");
   
	 	 }
       

    %>