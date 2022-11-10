<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Date:
	 <%
         Date date = new Date();
	 	SimpleDateFormat smp=new SimpleDateFormat("yyyy-MM-dd");
	 			
      %>
<input type="date" id="myDate" name="bday" min="<%=smp.format(date) %>" >
<p><strong>Note:</strong> input elements with type="date" are not supported in Internet Explorer or Firefox.</p>


</body>
</html>