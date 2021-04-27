<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<!-- 서블릿에서 보내준 값을 찍는 jsp -->
<table>
	<c:forEach var="room" items="${room_list}" > 
		<tr>
			<td>${room.room_id}</td>
			<td>${room.room_state}</td>
			<td>${room.adress}</td>
			<td><img style="width:500px" src="${room.img}"></td>
			<td>${room.phone}</td>
			<td>${room.room_start}~${room.room_end}</td>
			<td>
				<form action="searchDetail">
				    <input type="hidden" name="roomid" value="${room.room_id}">
				    <input type="hidden" name="year" value="${year}">
				    <input type="hidden" name="month" value="${month}">
				    <input type="hidden" name="day" value="${day}">
				    <input type="hidden" name="search_date" value="${search_date}">
				    <input type="hidden" name="mapx" value="${room.mapx}">
				    <input type="hidden" name="mapy" value="${room.mapy}">
				    <c:choose>
				    	<c:when test="${room.today_state eq true}">
				    		<input type="submit" value="예약하기">
				    	</c:when>
						<c:when test="${room.today_state eq false}">
							<p>예약불가</p>				    
				    	</c:when>
				    </c:choose>
				</form>
			</td>
			<!-- <td><a href="../Room/roomdetail.jsp">예약하기</button> -->
		</tr>			
	</c:forEach>
</table>
</body>
</html>