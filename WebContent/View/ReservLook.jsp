<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
<style>
h1{ color: red; }
</style>
</head>
<body>

	<jsp:include page="/common/header.jsp"></jsp:include>
	<div id="reservelook">
		<h1>${chk==null?"예약이 실패했습니다":"예약이 성공했습니다"}</h1>
		<br>
		<br>
		<div class="left">
		<c:if test="${chk!=null}"> 
			<ul  style="list-style-type: none;">
				<li>예약 번호: ${chk.book_id }</li>
				<li>주소: ${chk2.adress}</li>
				<li>예약일: ${chk.book_date }</li>
				<li>시작 시간: ${chk.book_begin }</li>
				<li>종료 시간: ${chk.book_last }</li>
			</ul>
		</c:if> 
		</div>
	<div class="right">
	<img src=${chk2.img } width="250px" height="90px">
	</div>
		<p style="font-size: 9pt;">전화번호: ${chk2.phone}    | 취소는 ${chk2.room_cancel}일 이내에 할 수 있습니다. | </p>
	</div>
	
</body>
</html>