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
</head>
<body>
	<jsp:include page="/common/header.jsp"></jsp:include>
	<div id = "contents" style = "border : 1px solid black;">
	
			<h2 id = "BookCheckResultTitle" style="font-family: 'Noto Sans KR', sans-serif;">
				예약내역
			</h2>
			<div id = "room-img" ></div>
			<div id = "BookCheck"></div>

	</div>
	
	
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