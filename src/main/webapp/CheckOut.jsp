<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Out</title>
</head>
<body>
<jsp:include page="Header.jsp"/>
<center>
<h1>*******----------BILLING----------*********</h1>
	<form action="">
		<input type="text" name="bookId" placeholder="Room ID">
		<input type="submit" value="Check Out">
	</form>
<h1>*******----------*********----------*********</h1>

	<c:if test="${param.bookId != null }">
		<jsp:useBean id="beanDAO"  class="com.hib.oyo.BookingDAO" />
		<h1><c:out value="${beanDAO.checkoutDAO(param.bookId) }"/></h1>
		<h1>*******----------*********----------*********</h1>	
	</c:if>
</center>	
</body>
</html>