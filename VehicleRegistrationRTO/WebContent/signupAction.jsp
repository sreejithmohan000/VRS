<%-- 
    Document   : user signup
    Created on : November 06, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="rtodao.RtoDAO" %>
	<%@ page import="rtobeans.RtoBean" %>
	<%@ page import="java.util.ArrayList" %>
	<%@page import="java.sql.*"%>
      <%@page import="java.util.*"%>
      <%@page import="java.util.Date" %>
      <%@page import="java.text.*" %>
      <%@page import="java.io.*" %>
  <%
    String rname=request.getParameter("rname");
    String rgender=request.getParameter("rgender");
    String ridproof=request.getParameter("ridproof");
    String ridproofno=request.getParameter("ridproofno");
    String rusername=request.getParameter("rusername");
    String rpswd=request.getParameter("rpswd");
    String rmob=request.getParameter("rmob");
    String remail=request.getParameter("remail");
    String img=(String)session.getAttribute("img");
    String add=request.getParameter("address");
    RtoBean rtoBean=new RtoBean();
    rtoBean.setUname(rusername);
    ArrayList<RtoBean> rb=RtoDAO.checkUname(rtoBean);
    int size=rb.size();
    if(size==0){
    
     rtoBean=new RtoBean();
    rtoBean.setName(rname);
    rtoBean.setGender(rgender);
    rtoBean.setIdproof(ridproof);
    rtoBean.setIdproofno(ridproofno);
    rtoBean.setMob(rmob);
    rtoBean.setEmail(remail);
    rtoBean.setUname(rusername);
    rtoBean.setImg(img);
    rtoBean.setAdd(add);
    
    
    
   boolean flag=RtoDAO.signUp(rtoBean);
   if(flag==true){
	   RtoBean rtoBean1=new RtoBean();
	   rtoBean1.setUname(rusername);
	   
	   rtoBean1.setUpswd(rpswd);
   //ArrayList<UserBean> ub=UserDAO.selectId(userBean1);
   ResultSet rs=RtoDAO.selectId(rtoBean1);
   String i=null;
   int d=0;
   //for(UserBean it:ub){
	   while(rs.next()){
    //i=it.getI();
    i=rs.getString(1);
     
   }
   d=Integer.parseInt(i);
   RtoBean rtoBean2=new RtoBean();
   rtoBean2.setUname(rusername);
   rtoBean2.setUpswd(rpswd);
   rtoBean2.setId(d);
   flag=RtoDAO.Login(rtoBean2);
   		if(flag==true){
       
   			response.sendRedirect("index.jsp");
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
 response.sendRedirect("signUpcopy.jsp?val=Username already exist!");
 out.print("Username already exist!");
//UserBean userBean=new UserBean();

}
    %>