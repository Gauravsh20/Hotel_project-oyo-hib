<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="roomDao" class="com.hib.oyo.RoomDAO"/>
<center>
<h1>Available Rooms</h1>
<table border="3">
	<tr>
		<th>ID</th>
		<th>Type Of Room</th>
		<th>Cost Of Room/Day</th>
		<th>Booking</th>
 	</tr>
 	<c:forEach var="room" items="${roomDao.showAvailRoom()}">
 		<tr>
		<th><c:out value="${room.getRoomId() }"/></th>
		<th><c:out value="${room.getType()}"/></th>
		<th><c:out value="${room.getStatus()}"/></th>
		<th><a href="" ></a><button>Book</button></th>
 	</tr>
 	
 	</c:forEach>
 

</table>
</center>

</body>
</html>