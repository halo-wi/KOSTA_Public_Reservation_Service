<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 상세 표시</title>
<style >

/* #getdown{margin-top: 130px;
font-size: 25px;
text-align: center;}
#roomlist{
float: right;
margin-right: 250px;
}
#img{
position:relative;
float:left;
margin-left: 250px;
}
img{
width: 450px;
height: 480px;}
#map{postion:absolute;}
#former{
text-align: center;}

#submit{
 background-color:  Silver; 
  color: black; 
  border: 2px solid  Silver;
  padding:5px;
}
#submit:hover {
  background-color: Khaki;
  color: white;
  border: 2px solid  Khaki;
   padding:5px;
}
#ctg{
padding:5px;
}
#ctg_nm{
padding:5px;
} */
</style>
<!-- jQeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 네이버 지도 API -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=99s5cztafe"></script>

</head>
<body>
<jsp:include page="/common/header2.jsp"></jsp:include>




<div class="center_box">
	<div class="item_viewbox_top">
		<div class="item_viewbox_top_left">
			<!-- 제일 상단 컨텐츠 --> 
			<header class="header">
				<span class="header_room_id">No.${list.room_id}</span>
				<span class="header_room_address"> ${list.adress}</span>
			</header>
			<hr>
			
			<!-- 이미지 부분 -->
			<div id="img" class="detail_img">
			<img src="${list.img}"/>
			</div>
			
			<!-- 회의실 예약 현황 -->
			<div>
			</div>
			
			<!-- 시설안내 -->
			<div class="item_viewbox_top_tabcon_box">
				<div id="roomlist">
					<p id="tabcon3" class="sub_text_tit_type01">시설안내</p>
					<ul class="item_viewbox_top_tabcon_box03_content_box_list">
						<li>
							<div class="item_viewbox_top_tabcon_box03_content_box_list_f">전화번호</div>
							<div class="item_viewbox_top_tabcon_box03_content_box_list_s">${list.phone}<br>
							</div>
						</li>
						<li>
							<div class="item_viewbox_top_tabcon_box03_content_box_list_f">영업시간</div>
							<div class="item_viewbox_top_tabcon_box03_content_box_list_s">${list.room_start}~${list.room_end}<br>
							</div>
						</li>
						<li>
							<div class="item_viewbox_top_tabcon_box03_content_box_list_f">입,퇴실시간</div>
							<div class="item_viewbox_top_tabcon_box03_content_box_list_s">예약시간 10분전 입실 / 정시 퇴실<br>
							</div>
						</li>
						<li>
							<div class="item_viewbox_top_tabcon_box03_content_box_list_f">결제구분</div>
							<div class="item_viewbox_top_tabcon_box03_content_box_list_s">무료<br>
							</div>
						</li>
					</ul>
					<%-- 
					<p>전화번호 : ${list.phone}</p>
					<p>시작시간 : ${list.room_start}</p>~
					<p>종료시간 : ${list.room_end}</p>
					<p>입,퇴실시간 : 예약시간 10분전 입실 / 정시 퇴실</p>
					<p>결제구분 : 무료<p> --%>
				</div>
			</div>
			
			<!-- 예약 시 주의사항 -->
			<div class="item_viewbox_top_tabcon_box">
				<p id="tabcon3" class="sub_text_tit_type01">예약 시 주의사항</p>
				<ul class="item_viewbox_top_tabcon_box03_content_box_list">
					<li>
						<div class="item_viewbox_top_tabcon_box03_content_box_list_f">주의사항</div>
						<div class="item_viewbox_top_tabcon_box03_content_box_list_s">실내 흡연 금지 <br>
						사전 승인되지 않은 음식물 반입 금지 (간단 다과 반입 시 수거 필수) <br>	
						각종 노트북 젠더 미제공 <br>
						</div>
					</li>
					<li>
						<div class="item_viewbox_top_tabcon_box03_content_box_list_f">취소/환불 정책</div>
						<div class="item_viewbox_top_tabcon_box03_content_box_list_s" style="color:red">
						예약 취소는 예약일로부터 ${list.room_cancel}일전까지 가능합니다.<br></div>
					</li>
				</ul>
			</div>
			
			<!-- 오시는 길 -->
			<div class="item_viewbox_top_tabcon_box">
				<p id="tabcon4" class="sub_text_tit_type01">오시는 길</p>
				<div class="map_address">
					<i class="fas fa-map-marker-alt" style="color:blue" aria-hidden="true"></i>
					<p class="item_viewbox_top_tabcon_box05_text">${list.adress}</p>
				</div>
				<!-- 네이버 map -->
				<div id="map" style="width:780px;height:330px;"></div>
			</div>
		</div>
		<div class="item_viewbox_top_right">
			<div class="item_viewbox_top_right_content_box_wrap">
				<div class="item_viewbox_top_right_content_box">
					<form action="../Room/roomreservation" id="former">
						<input type="hidden" name="roomid" value="${param.roomid}">
						<%-- <input type="hidden" name="customerid" value="${param.roomid}"> --%>
						<input type="hidden" name="customerid" value="${session}"><br>
						
						<!-- 회의실 주소 -->
						<div class="item_viewbox_top_right_content_box_top_item_tit">
							<p class="item_viewbox_top_right_content_box_top_item_tit_name">
								${list.adress}
							</p>
						</div>
						
						<!-- 회의실 예약 시작시간/종료시간 선택 -->
						<!-- 첫 번째 셀렉트박스 -->
						<div>
						 	<select id="ctg" name="book_begin" onchange="selectBoxChange()">
						 		<option>시작시간</option>
								<c:forEach var="time" items="${state_arr}" begin="0" end="${cut_room_end}" varStatus="status">
									<c:choose>
								    	<c:when test="${time eq '0'}">
											<option name=${status.index} value=${time_arr[status.index]}>
								    			<p>${time_arr[status.index]}</p>
											</option>
								    	</c:when>
										<c:when test="${time eq 1}">
											<option value=${status.index} disabled>
												<p>${time_arr[status.index]}</p>   
											</option>
								    	</c:when>
									</c:choose>	
								</c:forEach>
							</select>
						</div>
						<div>
							<!-- 두 번째 셀렉트박스 -->
						 	<select id="ctg_nm" name="book_last">
						 		<option>종료시간</option>
							</select>
						</div>
						<input type="hidden" name="search_date" value="${param.search_date}">
					</form>
					<input type="button" id="submit" onclick="valueChk()" value="예약하기">
				</div>
			</div>
		</div>
	</div>
</div>



<script>
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(${param.mapy}, ${param.mapx}),
    zoom: 17
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(${param.mapy}, ${param.mapx}),
    map: map
});

// 범위선택
function selectBoxChange() {
	console.log(sVal);
	
	var arr = []; 
	var arr2 = []; 

	var sVal = $("#ctg option").index($("#ctg option:selected"))-1; // 첫 번째 셀렉트 박스 선택 시 인덱스 값
	
	console.log("선택 인덱스 : "+$("#ctg option").index($("#ctg option:selected"))); // 삭제
		
	<c:forEach var="time" items="${state_arr}" varStatus="status">
		arr[${status.index}] = ${time};
		/* arr2[${status.index}] = "${time_arr[status.index]}"; */
		arr2[${status.index}] = "${time_arr_num[status.index]+1}:00";
	</c:forEach> 
	
	console.log(arr.length); // 삭제
	console.log(arr2.length); // 삭제
	
	$('#ctg_nm').empty(); // 첫 번째 셀렉트 박스 선택 후 두 번째 셀렉트박스를 초기화한다. 
	
	
	for(let i=sVal; i<arr.length; i++) {
		if(arr[i] == 1) {
			break;
		}
		
		console.log(i); // 삭제
		console.log(arr2[i]); // 삭제
		
        var option = $("<option>"+arr2[i]+"</option>");
        $('#ctg_nm').append(option);
		            
	}
	if($("#ctg option:selected").val() == "시작시간") { // 다시 시작시간을 클릭 했을 때 종료시간으로 초기화
		$('#ctg_nm').empty();
		$('#ctg_nm').append("<option>종료시간</option>"); 		
	}
}

// 선택 블락
function valueChk() {
	if($("#ctg option:selected").val() == "시작시간") {
		alert("시작시간을 선택하세요.");
		return false;
				
	}else if($("#ctg_nm option:selected").val() == "종료시간") {
		alert("종료시간을 선택하세요.");
		return false;
	}
	$('#former').submit();
}

</script>
</body>
</html>