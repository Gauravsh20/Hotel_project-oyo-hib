<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.hib.oyo.SessionHelper"%>
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

<h1>Add Room</h1>
	<form >
		Enter The Room Type :
		<select name="type"><br/><br/>
			<option value="Single">Single</option>
			<option value="Double">Double</option>
		</select><br/><br/>
		Cost Of Per Day :
		<input type="number" name="costPerDay"><br/><br/>
	<input type="submit" name="Save"><br/><br/>
	
	</form>
	</center>

	<c:if test="${param.costPerDay != null }">
		<jsp:useBean id="roomDao" class="com.hib.oyo.RoomDAO"/>
	<jsp:useBean id="room" class="com.hib.oyo.Room"/>
	<jsp:setProperty property="*" name="room" />
	<c:out value="${roomDao.Addroom(room)}"></c:out>
	</c:if>
	
</body>
</html>