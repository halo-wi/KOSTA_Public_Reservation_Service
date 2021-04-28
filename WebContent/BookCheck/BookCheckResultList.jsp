<%@page import="model.RoomVO"%>
<%@page import="model.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에약 정보 확인</title>

</head>
<body>
<table>
<tr>
<td>예약 번호</td>
<td>에약 시작 시간</td>
<td>에약 종료 시간</td>
<td>에약일</td>
<td>예약 장소</td>
<td>지역구</td>
<td>전화번호</td>
<td>취소 가능일</td>


</tr>
<c:forEach items="${list}" var="lol">
<tr><td>${lol.book_id}</td></tr>
<tr><td>${lol.book_begin}</td></tr>
<tr><td>${lol.book_last}</td></tr>
<tr><td>${lol.book_date}</td></tr>
<c:forEach items="${list2} " var="lol2">
<tr><td>${lol2.adress}</td></tr>
<tr><td>${lol2.room_location}</td></tr>
<tr><td>${lol2.phone}</td></tr>
<tr><td>${lol2.room_cancel}</td></tr>
</c:forEach>


</c:forEach>
</table>
</body>
</html>