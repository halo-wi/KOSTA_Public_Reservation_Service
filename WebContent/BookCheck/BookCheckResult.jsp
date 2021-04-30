<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
<link href="../CSS/footer.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&family=Noto+Sans+KR:wght@100&family=Nunito+Sans:wght@200&display=swap"
	rel="stylesheet">
<style>
h1 {
	color: red;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/common/header.jsp"></jsp:include>

	<div id="contents"">
		<h2 id="BookCheckResultTitle"
			style="font-family: 'Noto Sans KR', sans-serif;">예약내역</h2>
		<div id="room-img">
			<img
				style="border: 1px solid black; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;"
				src="../img/test.jpg" width="500px" height="400px">
		</div>

		<div id="BookCheck">
			<h3>${bookinfo2.adress}</h3>
			<div id="bookchkcontents">
				<p class="bookchkcontentsText">예약번호 : ${bookinfo.book_id }</p>
				<p class="bookchkcontentsText">예약일 : ${bookinfo.book_date }</p>
				<p class="bookchkcontentsText">시작시간 : ${bookinfo.book_begin }</p>
				<p class="bookchkcontentsText">종료시간 : ${bookinfo.book_last }</p>

				<div id="bookCancel">
					<button type="button" id="bookCancelBtn" class="btn btn-dark">예약취소</button>
				</div>
			</div>
		</div>


	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


	<div id="footer">
		<p>&copyZOOMOUT 팀원 강성빈 고석우 김성휘 남후승 임세혁</p>
		<p>
			<a href="https://github.com/halo-wi/KOSTA_Public_Reservation_Service"
				target="_blank" style="color: grey;">
				https://github.com/halo-wi/KOSTA_Public_Reservation_Service</a>
		</p>

	</div>


</body>
</html>