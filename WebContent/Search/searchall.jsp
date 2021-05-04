<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQeury -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 제이쿼리 ui css -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- //제이쿼리 ui js -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="../common/header2.jsp"></jsp:include>

</head>

<body id="page-top">

	<section id="search_page">
		<!-- 지역구 리스트 값 받아오는 부분 -->
		<div id="room_location_list">
			<select name="room_location" id="room_location">
				<option>
					<p>전체지역</p>
				</option>
				<c:forEach var="location" items="${room_location_list}">
					<option>
						<p>${location}</p>
					</option>
				</c:forEach>
			</select>
			<!-- 날짜 입력하는 부분 -->
			<input type="text" class="date_input" id="date_input">

			<!-- 셀렉트 된 입력 값들 전송하는 버튼 -->
			<button type="button" class="btn_search" id="btn_search" value="1">검색</button>
		</div>
		<!-- 받아온 값 띄워주는 부분 -->
		<div id="here"></div>

	</section>
	

	<script>
	$(function() {
	 	
	 	 // datepicker의 default값을 오늘 날짜로 바꿔준다./ 오늘 날짜 이전은 비활성화 시킴
	     jQuery( "#date_input" ).datepicker({ 
	     	minDate: 0,       
	         dateFormat : "yy-mm-dd",
	 	  	changeYear: true, 
	 	  	changeMonth: true,
	 	  	yearRange : 'c-80:c+10',
	 	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	 	  	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	     
	     }).datepicker("setDate", new Date());
	   
	 	 
	 	console.log($("#room_location option:selected").val());
	 	console.log($(".btn_search_dd").val());
	    /* 검색 버튼 클릭 시 셀렉트 된 옵션을 서블릿으로 전달 */ 
	 	$("#btn_search").on("click", function() {
	 		// 지역구 선택유도
	 		/* if($("#room_location option:selected").val() == "지역구"){
	 			alert("지역구를 선택해주세요.");
	 		} */
	 		console.log($("#room_location option:selected").val());
	 		var date = new Date($('#date_input').val());
	 		$.ajax({
	 			url:"searchall2",
	 			data: {"room_location":$("#room_location option:selected").val(),
	 				"page_num":$(".btn_search").val(),
	 				"year":date.getFullYear(),
	 				"month":date.getMonth() + 1,
	 				"day":date.getDate()}, 
	 			success:function(responseData) {
	 				$("#here").html(responseData); /* 받아온 값들을 here에 찍어줌 */
	 			}
	 		});

	 	});

    // onload시 바로 전체 검색 되도록 설정
    $("#btn_search").trigger("click");
   
});
</script>
</body>
</html>