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
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=99s5cztafe"></script>
	<link href="../CSS/footer.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/common/header2.jsp"></jsp:include>
	
	<div id="contents">
		<h2 id="BookCheckResultTitle"
			style="font-family: 'Noto Sans KR', sans-serif;">예약내역</h2>
		<div id="room-img">
			<img
				style="border: 1px solid black; border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;"
				src="${bookinfo2.img}" width="500px" height="400px">
		</div>

		<div id="BookCheck">
			<h3>${bookinfo2.adress}</h3>
			<div id="bookchkcontents">
				<p class="bookchkcontentsText">예약번호 : ${bookinfo.book_id }</p>
				<p class="bookchkcontentsText">예약일 : ${bookinfo.book_date }</p>
				<p class="bookchkcontentsText">시작시간 : ${bookinfo.book_begin }</p>
				<p class="bookchkcontentsText">종료시간 : ${bookinfo.book_last }</p>

				<div id="bookCancel">
					<button type="button" id="bookCancelBtn" class="btn btn-dark" onclick="bookdelet()">예약취소</button>
				</div>
			</div>
		</div>
		<!-- 오시는 길 -->
			<div class="item_viewbox_top_tabcon_box" style=" clear: both; margin-left: 100px;">
				<p id="tabcon4" class="sub_text_tit_type01">오시는 길</p>
				<div class="map_address">
					<i class="fas fa-map-marker-alt" style="color:blue" aria-hidden="true"></i>
					<p class="item_viewbox_top_tabcon_box05_text">${list.adress}</p>
				</div>
				<!-- 네이버 map -->
				<div id="map" style="width:780px;height:330px;"></div>
			</div>
	</div>
	
	<div id="footer">
		<p>&copyZOOMOUT 팀원 강성빈 고석우 김성휘 남후승 임세혁</p>
		<p>
			<a href="https://github.com/halo-wi/KOSTA_Public_Reservation_Service"
				target="_blank" style="color: grey;">
				https://github.com/halo-wi/KOSTA_Public_Reservation_Service</a>
		</p>

	</div>

<script>
	function bookdelet() {
		var bookid=${bookinfo.book_id };
			location.href = "../BookCheck/DeleteServelet?bookid="+bookid;
	}
</script>



	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script>
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(${bookinfo2.mapy}, ${bookinfo2.mapx}),
    zoom: 17
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(${bookinfo2.mapy}, ${bookinfo2.mapx}),
    map: map
});
</script>
</body>
</html>