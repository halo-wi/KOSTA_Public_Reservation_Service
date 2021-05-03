<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Bootstrap icon-->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->


<title>Insert title here</title>

<script>
$(function() {
	
    /* 검색 버튼 클릭 시 셀렉트 된 옵션을 서블릿으로 전달 */ 
	$(".btn_search_dd").on("click", function() {
		// 지역구 선택유도
		/* if($("#room_location option:selected").val() == "지역구"){
			alert("지역구를 선택해주세요.");
		} */
		console.log($("#room_location option:selected").val());
		console.log($(".btn_search_dd").val());
		var date = new Date($('#date_input').val());
		$.ajax({
			url:"searchall2",
			data: {"room_location":$("#room_location option:selected").val(),
				"page_num":$(this).val(),
				"year":${year},
				"month":${month},
				"day":${day}}, 
			success:function(responseData) {
				$("#here").html(responseData); /* 받아온 값들을 here에 찍어줌 */
			}
		});
	});
	$('html').scrollTop(0);
	
});
</script>
</head>
<body>


<!-- 서블릿에서 보내준 값을 찍는 jsp -->
<div id="search_room">
    <c:set var="cnt" value="0"/>
	<ul>
		<c:forEach var="room" items="${room_list}">
		<c:set var="cnt" value="${cnt+1}"/>
			<div id="room_container" class="row">
			<div class="col" id="room_container_col" style="padding-left:0px;">
			<li id="room_list">
				<span id="room_img">
					<img src="${room.img}" loading="lazy">
					<div id="info_img">
						<span id="room_info_roomid">No.&nbsp;${room.room_id}</span>
							<c:choose>
						    	<c:when test="${room.today_state eq true}">
						    		<span id="room_info_state">${room.room_state}</span>
						    	</c:when>
								<c:when test="${room.today_state eq false}">
									<span id="room_info_state" style="background-color: black;">접수종료</span>
						    	</c:when>
						    </c:choose>			
					</div>
				</span>
				<span id="room_info">
					<div id="room_info_address">${room.adress}</div>
				</span>
					<span id="room_info_content">
						<div id="room_info_location">
							<span>
								<i class="fas fa-map-marked-alt" aria-hidden="true"></i>
							</span>
							${room.room_location}
						</div>
						<div id="room_info_phone">
							<span>
								<i class="fas fa-phone-alt" aria-hidden="true"></i>
								문의 전화 &nbsp;
							</span>
							${room.phone}
						</div>
						<div id="room_info_time">
							<span>
								<i class="fas fa-clock" aria-hidden="true"></i>
								사용 가능 시간 &nbsp;
							</span>
							${room.room_start}~${room.room_end}
						</div>
					</span>		
				<div>
					<form id="detalform${cnt}" action="searchDetail">
					    <input type="hidden" name="roomid" value="${room.room_id}">
					    <input type="hidden" name="year" value="${year}">
					    <input type="hidden" name="month" value="${month}">
					    <input type="hidden" name="day" value="${day}">
					    <input type="hidden" name="search_date" value="${search_date}">
					    <input type="hidden" name="mapx" value="${room.mapx}">
					    <input type="hidden" name="mapy" value="${room.mapy}">
					    <input type="hidden" name="room_start" value="${room.room_start}">
					    <input type="hidden" name="room_end" value="${room.room_end}">
					    <c:choose>
					    	<c:when test="${room.today_state eq true}">
					    		<input class="reservation_btn_on" type="button" value="예약하기" onclick="onver(${cnt})">
					    	</c:when>
							<c:when test="${room.today_state eq false}">
								<span class="reservation_btn_off" value="예약불가">예약불가</span>		    
					    	</c:when>
					    </c:choose>
					</form>
				</div>
			</c:forEach>
		</ul>
		<!-- page숫자 띄워주는 부분 -->
		<ul id="room_page">
			<c:forEach var="row" items="${pages}" begin="0" end="${searchRow}"
				varStatus="status">
				<input type="button" class="btn_search_dd" value="${row}">
			</c:forEach>
		</ul>
	</div>

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
					style="margin-left: -40px; font-size: 1px; color: white;">
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

		</c:forEach>
	</ul>
	<!-- page숫자 띄워주는 부분 -->
	<ul id="room_page">
	<c:forEach var="row" items="${pages}" begin="0" end="${searchRow}" varStatus="status">
		<input type="button" class="btn_search_dd" value="${row}">
	</c:forEach>
	</ul>
</div>
<script type="text/javascript">
function onver(cnt) {

	var uid="<%=(String) session.getAttribute("email")%>";
	
	if (uid == "null") {
		location.href = "../Login/login.jsp";
	} else {
 		 $('#detalform'+cnt).submit();
	}
}
</script>
	<!-- header -->
	<header><jsp:include page="/common/header2.jsp"></jsp:include></header>
</body>
</html>
