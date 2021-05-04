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

<!-- jQeury -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 세션 없을 시 예약취소 비활성화 -->
<script type="text/javascript">
$(function() {
	var uid="<%=(String) session.getAttribute("email")%>";
	if (uid == "null") {
		$('.bookCancelBtn').attr('disabled', true);
		console.log("여기");
	} 
});
</script>
	
</head>
<body>
	<jsp:include page="/common/header2.jsp"></jsp:include>
	
	<!-- <div id="contents">
		<h2 id="BookCheckResultTitle"
			style="font-family: 'Noto Sans KR', sans-serif;">예약내역</h2> -->
		
			<div id="BookCheckResultreservelook">
			<span id="tabcon4" class="BookCheckResultreservelook_title">예약상세조회</span>
			<div id="BookCheckResultreservelook_inner">
				<div class="BookCheckResult_reservelook_left">
					<img src=${bookinfo2.img } width="250px" height="90px">
				</div>
				<div class="BookCheckResult_reservelook_right">
					<c:if test="${bookinfo!=null}"> 
						<ul style="list-style-type: none;">
							<li>
								<i class="fas fa-angle-right"></i>
								<div class="BookCheckResult_reservelook_right_contents_f">예약 번호</div>
								<div class="BookCheckResult_reservelook_right_contents_s">${bookinfo.book_id}</div><br>
							</li>
							<li>
								<i class="fas fa-angle-right"></i>
								<div class="BookCheckResult_reservelook_right_contents_f">주소</div>
								<div class="BookCheckResult_reservelook_right_contents_s">${bookinfo2.adress}</div><br>
							</li>
							<li>
								<i class="fas fa-angle-right"></i>
								<div class="BookCheckResult_reservelook_right_contents_f">예약일</div>
								<div class="BookCheckResult_reservelook_right_contents_s">${bookinfo.book_date }</div><br>
							</li>
							<li>
								<i class="fas fa-angle-right"></i>	
								<div class="BookCheckResult_reservelook_right_contents_f">예약 시간	</div>
								<div class="BookCheckResult_reservelook_right_contents_s">${bookinfo.book_begin}~${bookinfo.book_last}</div><br>
							</li>
							<li>
								<i class="fas fa-angle-right"></i>
								<div class="BookCheckResult_reservelook_right_contents_f">전화번호</div>
								<div class="BookCheckResult_reservelook_right_contents_s">${bookinfo2.phone}<br>
								</div>
							</li>
							<li>
								<div class="BookCheckResult_reservelook_bottom_contents">※ 예약 취소는 예약일로부터 ${bookinfo2.room_cancel}일전까지 가능합니다.</div>
							</li>
						</ul>
					</c:if> 
				</div>
			</div>
			
		<!-- 오시는 길 -->
			<div class="BookCheckResult_item_viewbox_top_tabcon_box" style=" clear: both; margin-left: 100px;">
				<span id="tabcon4" class="BookCheckResult_sub_text_tit_type01">오시는 길</span>
				<div class="BookCheckResult_map_address">
					<i class="fas fa-map-marker-alt" style="color:blue" aria-hidden="true"></i>
					<p class="item_viewbox_top_tabcon_box05_text">${bookinfo2.adress}</p>
				</div>
				<!-- 네이버 map -->
				<div id="map" style="width:780px;height:330px;"></div>
			</div>
			<button type="button" class="bookCancelBtn" onclick="bookdelet()">예약취소</button>
		</div>	


	<!-- footer -->
   <footer class="footer py-4" style="background-color: black !important;">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-4 text-lg-left">
               <span style="color: white !important;">Copyright &copy;
                  ZOOMOUT <!-- This script automatically adds the current year to your website footer-->
                  <!-- (credit: https://updateyourfooter.com/)--> <script>
                     document.write(new Date().getFullYear());
                  </script>
               </span>
            </div>
            <div class="col-lg-4 my-3 my-lg-0"
               style="margin-left: -40px; font-size: 3px; color: white;">
               <a
                  href="https://github.com/halo-wi/KOSTA_Public_Reservation_Service"><img
                  src="../img/git-logo-black.png"
                  style="width: 35px; height: 35px; display: inline-block;"> <span
                  style="margin-left: 10px; color: white;">https://github.com/halo-wi/KOSTA_Public_Reservation_Service</span></a>
            </div>
            <div class="col-lg-4 text-lg-right">
               <p
                  style="color: white; font-size: 0.8em; margin-top: 10px; margin-right: -35px;">Members
                  : 김성휘 남후승 임세혁 고석우 강성빈</p>
            </div>
         </div>
      </div>
   </footer>
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