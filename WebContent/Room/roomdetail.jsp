<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 상세 표시</title>
<style >

#getdown{margin-top: 130px;
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
}
</style>
<!-- jQeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 네이버 지도 API -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=99s5cztafe"></script>

</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>

<h1 id="getdown">${list.adress}</h1>
<hr>
<div>
<div id="img">
<img  src="${list.img}"/>
</div>
<div id="roomlist">
<p>주소:${list.adress}</p>
<p>전화번호:${list.phone}</p>
<p>시작시간:${list.room_start}</p>
<p>종료시간:${list.room_end}</p>
<p>취소 가능일:${list.room_cancel}</p>
</div>
</div>

<div id="map" style="width:450px;height:260px;"></div>
<script>
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(${param.mapy}, ${param.mapx}),
    zoom: 17
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(${param.mapy}, ${param.mapx}),
    map: map
});

$('select option[value*='+0+']').prop('disabled',true);

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
	$('#ctg_nm').append("<option>종료시간</option>"); 
	
	for(let i=sVal; i<arr.length; i++) {
		if(arr[i] == 1) {
			break;
		}
		
		console.log(i); // 삭제
		console.log(arr2[i]); // 삭제
		
           var option = $("<option>"+arr2[i]+"</option>");
           $('#ctg_nm').append(option);
		            
	}
	
}
</script>


<form action="../Room/roomreservation" id="former">
	<input type="hidden" name="roomid" value="${param.roomid}">
	<%-- <input type="hidden" name="customerid" value="${param.roomid}"> --%>
	<input type="hidden" name="customerid" value="${session}"><br>
	
	<!-- 회의실 예약 시작시간/종료시간 선택 -->
	<!-- 첫 번째 셀렉트박스 -->
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
	~
	<!-- 두 번째 셀렉트박스 -->
 	<select id="ctg_nm" name="book_last">
 		<option>종료시간</option>
	</select>
	<input type="hidden" name="search_date" value="${param.search_date}">
	<input type="submit" id="submit">
	
<!-- 예약번호 DAO에서 자동으로 넣어준다. --> 
<!-- room_id는 앞에서 받아온다. -->
<!-- customer_id는 로그인에서 받아온다. --> 
<!-- book_begin은 사용자가 입력 -->
<!-- book_last는 사용자가 입력 -->
<!-- search_date는 앞에서 받아온다. -->


</form>

</body>
</html>