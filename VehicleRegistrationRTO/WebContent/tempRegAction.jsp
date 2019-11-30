<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="rtobeans.DealerBean" %>
<%@ page import="rtodao.DealerDao" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="rtodao.DealerDao" %> 

<%
int id=Integer.parseInt(request.getParameter("id"));
String cno=request.getParameter("chasisno");
String eno=request.getParameter("engineno");
/*  
id=0;
ResultSet rs=DealerDao.selectId(name);
while(rs.next()){
	id=rs.getInt(1);
}*/
String temp="TEMPABC0";
temp= temp.concat(String.valueOf(id));
out.print(temp);
java.util.Date now = new java.util.Date();
java.sql.Date sqlDate = new java.sql.Date(now.getTime()); 
DealerBean dealerBean = new DealerBean();
dealerBean.setDate(sqlDate);
dealerBean.setTempno(temp);
dealerBean.setId(id);
dealerBean.setChno(cno);
dealerBean.setEno(eno);
boolean flag = DealerDao.approveTemporary(dealerBean);
if(flag){
	response.sendRedirect("tempReg.jsp?val=Approved");
}
else{
	response.sendRedirect("tempReg.jsp?val=could not approved");

}
%>