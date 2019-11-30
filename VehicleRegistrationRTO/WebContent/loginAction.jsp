<%-- 
    Document   : Login Action
    Created on : November 06, 2019
    Author     : Sreejith
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@ page import="rtodao.RtoDAO"%>
<%@ page import="rtodao.CustomerDao"%>
<%@ page import="rtodao.AdminDao"%>
<%@ page import="rtobeans.RtoBean"%>
<%@ page import="rtobeans.CustomerBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.Math"%>
<%@ page import="java.util.concurrent.TimeUnit"%>
<%@page import="rtodao.Emailer"%>
<%
	String uname = request.getParameter("uname");
	String pswd = request.getParameter("pswd");
	RtoBean rtoBean = new RtoBean();
	rtoBean.setUname(uname);
	rtoBean.setUpswd(pswd);

	ResultSet rs = RtoDAO.check(rtoBean);
	String name = null, role = null, pass = null;

	while (rs.next()) {

		name = rs.getString(2);
		pass = rs.getString(3);
		role = rs.getString(4);

	}
	out.print(role);

	session = request.getSession();

	if (name != null && role.equalsIgnoreCase("admin")) {
		session.setAttribute("uname", name);
		session.setAttribute("role", role);
		ArrayList<CustomerBean> alist1 = new ArrayList<CustomerBean>();
		alist1 = CustomerDao.getId();

		java.util.Date now = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(now.getTime());
		//CustomerBean custbean = new CustomerBean();

		//custbean.getCurDate();
		/*ArrayList<CustomerBean>alist = new ArrayList<CustomerBean>();
		alist = CustomerDao.getDifferOfTempDate(custbean);*/
		System.out.println("--------------------------<<<<<<<<<<<" + sqlDate);
		Date regDate;
		int tId;
		long diff;
		long days = 0;
		for (CustomerBean cb : alist1) {
			tId = cb.getId();
			regDate = cb.getRegDate();
			cb.setId(cb.getId());
			cb.setRegDate(cb.getRegDate());
			String un = cb.getUname();
			out.println(un);
			/*for(CustomerBean cub:alist){
				tId = cub.getId();
				regDate = cub.getRegDate();*/
			diff = sqlDate.getTime() - regDate.getTime();
			//days = Math.abs(diff);
			days = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
			System.out.println("----------------------->>>>>>>>>>regDAte:" + days);

			if(days==25){
 				ArrayList<CustomerBean> arlist = new ArrayList<CustomerBean>();
 				String to = AdminDao.getEmailAdress(un);
 				//String from = "aravindrajbathery@gmail.com";
     			//String password="aravind1996";
     			String from="vehiclereg30@gmail.com";
			    String password="vrs123456";
     			String sub = "Expiry Date";
     			String msg="Your Temporary registration number will exiperd in 5 days";
 				//String to = AdminDao.getEmail();
 				out.println(to);
 				Emailer.send(from, password, to, sub, msg);
 			}
			
			
			if (days > 30) {
				boolean flag = CustomerDao.updateTempStatus(cb);
				if (flag = true) {
					System.out.println("Updated");
				}
			}
		}

		response.sendRedirect("userLogin1.jsp");

	} else if (name != null && role.equalsIgnoreCase("user")) {
		out.println("hai");
		session.setAttribute("uname", name);
		session.setAttribute("role", role);
		String status = null;
		String st = "Expired";
		String s = null;
		String sta = "processing";
		String stat = "approved";
		CustomerBean customerBean = new CustomerBean();
		customerBean.setUname(name);
		ArrayList<CustomerBean> alist1 = new ArrayList<CustomerBean>();
		alist1 = CustomerDao.getStatus(customerBean);

		/*  
		for(CustomerBean cb:alist1){
			status= cb.getStatus();
			out.println(status);
		}
			if(status.equalsIgnoreCase(st)){
				
				response.sendRedirect("expired.jsp");
			}
			else if(status==null || status.equalsIgnoreCase(sta) || status.equalsIgnoreCase(stat)){
		
		
		response.sendRedirect("userLogin2.jsp"); 
			}
			else{
				response.sendRedirect("error.jsp");	
			}
		}
		  
		
		*/
		for (CustomerBean cb : alist1) {
			status = cb.getStatus();
			out.println(status);
		}
		  if (status == null || status.equalsIgnoreCase(sta) || status.equalsIgnoreCase(stat)) {

			response.sendRedirect("userLogin2.jsp");
		}
		//else if(status.equalsIgnoreCase(st)){
		else if (status.equals("Expired")) {

			response.sendRedirect("expired.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	} else if (name != null && role.equalsIgnoreCase("dealer")) {

		session.setAttribute("uname", name);
		session.setAttribute("role", role);

		response.sendRedirect("userLogin3.jsp");
	} else {
		//out.println("Invalid");
		response.sendRedirect("index.jsp?val=Invalid username or password");
	}
%>