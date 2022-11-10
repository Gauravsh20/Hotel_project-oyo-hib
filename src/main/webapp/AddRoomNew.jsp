<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header.jsp"/>
<center>
<h1>Booking Rooms</h1>
<jsp:useBean id="beanDao" class="com.hib.oyo.RoomDAO"/>
<form action="">
	
	Available Room :
	<select name="roomStatus">
	<c:forEach var="room" items="${beanDao.showAvailableRooms()}">
		<option  var="roomID" value="${room}"> ${room}</option>
	</c:forEach>
	</select><br/><br/>
	<input type="submit" name="Booking"/><br/><br/><br/><br/>
</form>

<c:if test="${param.roomStatus!=null }">
<h1>********---------********----------********------------********</h1>
	  <%
         Date date = new Date();
	 	 SimpleDateFormat smp=new SimpleDateFormat("yyyy-MM-dd");
	 			
      %>
	<h2>Enter The Details</h2>
	
	<form action="">
	Room ID:
	<input type="text" name="roomId"  value="${param.roomStatus}" readonly="readonly"/><br/><br/>
	Enter The Customer Name: 
	<input type="text" name="custName" required="required"/><br/><br/>
	Enter the City: 
	<input type="text" name="city" required="required"/><br/><br/>
	
	Enter the CheckIn Date: 
	<input type="date" name="chkInDate" required="required" min="<%=smp.format(date) %>"/><br/><br/>
	Enter the CheckOut Date: 
	<input type="date" name="chkOutDate" required="required" min="<%=smp.format(date) %>"/><br/><br/>
	<input type="submit" value="Booking"/><br/><br/>
	</form>
	</c:if>	
	
	
<c:if test="${param.custName!=null}">
<jsp:useBean id="bookingDAO" class="com.hib.oyo.BookingDAO"/>
	<jsp:useBean id="booking" class="com.hib.oyo.Booking"/>
	<jsp:setProperty property="roomId" name="booking"/>
	<jsp:setProperty property="custName" name="booking"/>
	<jsp:setProperty property="city" name="booking"/>
	<fmt:parseDate value="${param.chkInDate}" pattern="yyyy-MM-dd" var="cd1"/>
	
	<c:set var="sqlDate1" value="${bookingDAO.convertDate(cd1)}" />
	<c:out value="${sqlDate1}"/>
	
	<fmt:parseDate value="${param.chkOutDate}" pattern="yyyy-MM-dd" var="cd2"/>
	<c:set var="sqlDate2" value="${bookingDAO.convertDate(cd2)}"  />
	<c:out value="${sqlDate2}"/>
	
	<jsp:setProperty property="chkInDate" name="booking" value="${sqlDate1}"/>
	<jsp:setProperty property="chkOutDate" name="booking" value="${sqlDate2}"/>
	<c:out value="${bookingDAO.AddBooking(booking)}"/>

</c:if>
	
</center>	
</body>
</html>