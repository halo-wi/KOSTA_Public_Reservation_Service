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
<jsp:include page="/common/header.jsp"></jsp:include>

<table id="bookchklist">
<tr>
<td>예약 번호</td>
<td>예약 시작 시간</td>
<td>예약 종료 시간</td>
<td>예약일</td>
<td>예약 장소</td>
<td>전화번호</td>
<td>취소 가능일</td>
</tr>
<c:forEach items="${list}" var="list">
<c:url value="BookNum" var="bn">
<c:param name="booknum" value="${list.book_id}"></c:param>
</c:url>
<tr><td><a href="${bn}">${list.book_id}</a></td>
<td>${list.book_begin}</td>
<td>${list.book_last}</td>
<td>${list.book_date}</td>
<td>${list.adress}</td>
<td>${list.phone}</td>
<td>예약일기준 ${list.room_cancel}일 전 까지</td></tr>
</c:forEach>
</table>
</body>
</html>