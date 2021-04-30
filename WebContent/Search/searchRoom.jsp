<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">  
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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
	<ul>
		<c:forEach var="room" items="${room_list}">
			<div id="room_container" class="row">
			<div class="col">
			<li id="room_list">
				<span id="room_img">
					<img style="width:300px; height:200px" src="${room.img}">
				</span>
				<span id="room_info">
					<div>${room.room_location}</div>
					<div>${room.adress}</div>		
					<div>${room.room_id}</div>
					<div>${room.room_state}</div>
					<div>${room.phone}</div>
					<div>${room.room_start}~${room.room_end}</div>
				</span>
				<div>
					<form action="searchDetail">
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
					    		<input type="submit" value="예약하기">
					    	</c:when>
							<c:when test="${room.today_state eq false}">
								<span>예약불가</span>				    
					    	</c:when>
					    </c:choose>
					</form>
				</div>
				<!-- <td><a href="../Room/roomdetail.jsp">예약하기</button> -->
			</li>
			</div>
			</div>
		</c:forEach>
	</ul>
	<!-- page숫자 띄워주는 부분 -->
	<ul id="room_page">
	<c:forEach var="row" items="${pages}" begin="0" end="${searchRow}" varStatus="status">
		<input type="button" class="btn_search_dd" value=${row}>
	</c:forEach>
	</ul>
</div>
<!-- header -->
<header><jsp:include page="/common/header2.jsp"></jsp:include></header>
</body>
</html>
