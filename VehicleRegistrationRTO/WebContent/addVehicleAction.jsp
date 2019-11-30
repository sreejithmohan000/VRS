<%-- 
    Document   : Add vehicle
    Created on : November 12, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="rtobeans.DealerBean" %>
	<%@ page import="rtodao.DealerDao" %>
	<%@ page import="java.util.ArrayList" %>
	<%@page import="java.sql.*"%>
      <%@page import="java.util.*"%>
  <%
    String vtype=request.getParameter("vtype");
    String vclass=request.getParameter("vclass");
    String vmaker=request.getParameter("vmaker");
    String vname=request.getParameter("vname");
    String vcolor=request.getParameter("vcolor");
    session=request.getSession(false);
    String un=(String)session.getAttribute("uname");
    DealerBean dealerBean=new DealerBean();
    dealerBean.setUname(un);
    dealerBean.setVtype(vtype);
    dealerBean.setVclass(vclass);
    dealerBean.setVmaker(vmaker);
    dealerBean.setVname(vname);
    dealerBean.setVcolor(vcolor);
   boolean flag =DealerDao.insertVehicle(dealerBean);
		    if(flag==true){
		        
		        response.sendRedirect("userLogin3.jsp?val=Vehicle Added Succesfully");
		    }
		    else{
		      
		       response.sendRedirect("error.html");
		    
			  }
		 
    %>