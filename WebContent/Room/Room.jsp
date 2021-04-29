<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 정보</title>
<style >
table{margin-top: 100px;}
#tt img{width:300px; height: 150px;}
#tt{border: 2px double black;
background-color: royalblue;
padding: 10px;
text-align: center;
}
td,tr{
border: 2px double black;
}
tr:first-child{
background-color: steelblue;}
body a{color: skyblue;}
</style>
</head>
<body>
<header><jsp:include page="/common/header.jsp"></jsp:include></header>
<table id="tt">

<tr>

<td>회의실 상태</td>
<td>회의실 주소</td>
<td>회의실 <br>지역구</td>
<td>회의실 이미지</td>
<td>회의실 전화번호</td>
<td>회의실 <br>여는 <br>시간</td>
<td>회의실 <br>닫는 <br>시간</td>
<td>회의실 <br>취소<br>기준일</td>
</tr>

<aa:forEach items="${roomall}" var="room">
<aa:url value="searchDetail" var="rd">
<aa:param name="roomid" value="${room.room_id}"></aa:param>
<aa:param name="mapx" value="${room.mapx}"></aa:param>
<aa:param name="mapy" value="${room.mapy}"></aa:param>
<aa:param name="adress" value="${room.adress}"></aa:param>
</aa:url>
<tr>

<td><a href="${rd}">${room.adress}</a></td>
<td>${room.room_state}</td>
<td>${room.room_location}</td>
<td><img src="${room.img}"></td>
<td>${room.phone}</td>
<td>${room.room_start}</td>
<td>${room.room_end}</td>
<td>${room.room_cancel}</td>

</tr>
</aa:forEach>
</table>


<div id="footer">
		<p>&copyZOOMOUT 팀원 강성빈 고석우 김성휘 남후승 임세혁</p>
		<p>
			<a href="https://github.com/halo-wi/KOSTA_Public_Reservation_Service"
				target="_blank" style="color: grey;">
				https://github.com/halo-wi/KOSTA_Public_Reservation_Service</a>
		</p>

	</div>


	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
	<!-- Contact form JS-->
	<script src="assets/mail/jqBootstrapValidation.js"></script>
	<script src="assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

</body>
</html>
