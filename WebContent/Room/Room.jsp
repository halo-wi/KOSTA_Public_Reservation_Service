<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<td>회의실 번호</td>
<td>회의실 상태</td>
<td>회의실 주소</td>
<td>회의실 경도</td>
<td>회의실 위도</td>
<td>회의실 지역구</td>
<td>회의실 이미지</td>
<td>회의실 전화번호</td>
<td>회의실 여는 시간</td>
<td>회의실 닫는 시간</td>
<td>회의실 취소기준일</td>
</tr>
${roomall}
<aa:forEach items="${roomall}" var="room">
<tr>
<td>${room.room_id}</td>
<td>${room.room_state}</td>
<td>${room.adress}</td>
<td>${room.mapx}</td>
<td>${room.mapy}</td>
<td>${room.room_location}</td>
<td>${room.img}</td>
<td>${room.phone}</td>
<td>${room.room_start}</td>
<td>${room.room_end}</td>
<td>${room.room_cancel}</td>

</tr>
</aa:forEach>
</table>

</body>
</html>