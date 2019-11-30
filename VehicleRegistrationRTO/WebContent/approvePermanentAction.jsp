<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="rtobeans.PermanentRegBean"%>
<%@page import="rtodao.AdminDao"%>
<%@page import="rtobeans.NumberPlateBean"%>
<%@page import="java.util.*"%>
<%@page import="rtodao.Emailer"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		int number = 0;
		int letter = 0;
		String permanentNo = "KL-07";
		String email = request.getParameter("email");
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" + email);
		int pId = Integer.parseInt(request.getParameter("pId"));
		java.util.Date now = new java.util.Date();
		ArrayList<NumberPlateBean> alist = new ArrayList<NumberPlateBean>();
		alist = AdminDao.getNumberPlateDet();
		for (NumberPlateBean npb : alist) {
			number = npb.getNumber();
			letter = npb.getLetter();
		}

		String let = Character.toString((char) letter);
		String num = Integer.toString(number);

		permanentNo = permanentNo + "-" + let + "-" + num;
		System.out.println("{{{{{{{{{}}}}}}}}}}{{{{{{{{{}}}}}}}}}{{{{{{{{{}}}}}}}}" + permanentNo);

		java.sql.Date sqlDate = new java.sql.Date(now.getTime());
		PermanentRegBean pbean = new PermanentRegBean();
		pbean.setApprovedDate(sqlDate);
		pbean.setpId(pId);
		pbean.setPermanentNo(permanentNo);

		boolean flag = AdminDao.updatePermanentDet(pbean);

		if (flag == true) {
			
			//String from = "archalal95@gmail.com";
			//String password = "archa@28";
			String from="vehiclereg30@gmail.com";
			String password="vrs123456";
		
			String to = email;
			String sub = "Permanent Registration Number";
			String msg = "Your Permanent Registration number has been approved.Registration number is "+permanentNo;
			System.out.println("++++++++++++++++++++++++++++++++"+to);
			Emailer.send(from,password,to,sub,msg);
			
			NumberPlateBean nplate = new NumberPlateBean();
			number = number + 1;
			nplate.setNumber(number);
			nplate.setLetter(letter);
			boolean flag1 = AdminDao.updateNumberPlate(nplate);
			if (flag1 == true) {
				response.sendRedirect("approvePermanent.jsp");
				System.out.println("****************number******************>" + number);
				if (number == 10) {
					number = 1;
					letter = letter + 1;
					nplate.setNumber(number);
					nplate.setLetter(letter);
					boolean flag2 = AdminDao.updateNumberPlate(nplate);

				}
			}

		}
	%>
</body>
</html>