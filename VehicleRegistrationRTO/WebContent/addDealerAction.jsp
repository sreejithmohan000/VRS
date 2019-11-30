<%-- 
    Document   : Add Dealer Action
    Created on : November 15, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="rtodao.AdminDao" %>
	<%@ page import="rtobeans.AdminBean" %>
	<%@ page import="java.util.ArrayList" %>
	<%@page import="java.sql.*"%>
      <%@page import="java.util.*"%>
      <%@page import="java.util.Date" %>
      <%@page import="java.text.*" %>
      <%@page import="java.io.*" %>
  <%
    String dname=request.getParameter("dname");
    String daddress=request.getParameter("daddress");
    String didproof=request.getParameter("didproof");
    String didproofno=request.getParameter("didproofno");
    String dusername=request.getParameter("dusername");
    String dpswd=request.getParameter("dpswd");
    String dmob=request.getParameter("dmob");
    String demail=request.getParameter("demail");
    AdminBean adminBean=new AdminBean();
    adminBean.setUname(dusername);
    ArrayList<AdminBean> ab=AdminDao.checkUname(adminBean);
    int size=ab.size();
    if(size==0){
    
     adminBean=new AdminBean();
     adminBean.setName(dname);
     adminBean.setAddress(daddress);
     adminBean.setIdproof(didproof);
     adminBean.setIdproofno(didproofno);
    adminBean.setMob(dmob);
    adminBean.setEmail(demail);
    adminBean.setUname(dusername);
    
    
   boolean flag=AdminDao.addDealer(adminBean);
   if(flag==true){
	   AdminBean adminBean1=new AdminBean();
	   adminBean1.setUname(dusername);
	   
	   adminBean1.setUpswd(dpswd);
   //ArrayList<UserBean> ub=UserDAO.selectId(userBean1);
   ResultSet rs=AdminDao.selectId(adminBean1);
   String i=null;
   int d=0;
   //for(UserBean it:ub){
	   while(rs.next()){
    //i=it.getI();
    i=rs.getString(1);
     
   }
   d=Integer.parseInt(i);
   AdminBean adminBean2=new AdminBean();
   adminBean2.setUname(dusername);
   adminBean2.setUpswd(dpswd);
   adminBean2.setId(d);
   flag=AdminDao.LoginDealer(adminBean2);
   		if(flag==true){
       
   			response.sendRedirect("userLogin1.jsp?val=Successfully Added");
   		}
   		else{
     
      response.sendRedirect("error.html");
   
	  }
       
       
   }
   else{
     
      response.sendRedirect("error.html");
   
	  }
 

}
else{
 response.sendRedirect("userLogin1.jsp?val=Username already exist!");
 out.print("Username already exist!");
//UserBean userBean=new UserBean();

}
    %>