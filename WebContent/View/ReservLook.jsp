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
		<div class="reservelook_left">
			<img src=${chk2.img } width="250px" height="90px">
		</div>
		<div class="reservelook_right">
		<c:if test="${chk!=null}"> 
			<ul style="list-style-type: none;">
				<li>
					<i class="fas fa-angle-right"></i>
					<div class="reservelook_right_contents_f">예약 번호</div>
					<div class="reservelook_right_contents_s">${id}</div><br>
				</li>
				<li>
					<i class="fas fa-angle-right"></i>
					<div class="reservelook_right_contents_f">주소</div>
					<div class="reservelook_right_contents_s">${chk2.adress}</div><br>
				</li>
				<li>
					<i class="fas fa-angle-right"></i>
					<div class="reservelook_right_contents_f">예약일</div>
					<div class="reservelook_right_contents_s">${chk.book_date }</div><br>
				</li>
				<li>
					<i class="fas fa-angle-right"></i>	
					<div class="reservelook_right_contents_f">예약 시간	</div>
					<div class="reservelook_right_contents_s">${chk.book_begin}~${chk.book_last}</div><br>
				</li>
				<li>
					<i class="fas fa-angle-right"></i>
					<div class="reservelook_right_contents_f">전화번호</div>
					<div class="reservelook_right_contents_s">${chk2.phone}<br>
					</div>
				</li>
				<li>
					<div class="reservelook_bottom_contents">※ 예약 취소는 예약일로부터 ${chk2.room_cancel}일전까지 가능합니다.</div>
				</li>
			</ul>
		</c:if> 
		<button type="button">홈 화면</button>
		</div>
	</div>
	
</body>
</html>