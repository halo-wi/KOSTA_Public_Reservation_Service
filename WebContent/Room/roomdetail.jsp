<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 상세 표시</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=99s5cztafe"></script>
</head>
<body>
<div id="map" style="width:250px;height:250px;"></div>
<script>
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(${param.mapy}, ${param.mapx}),
    zoom: 17
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(${param.mapy}, ${param.mapx}),
    map: map
});
</script>
<p>${param.day}</p> 
<p>${param.month}</p>
<p>${param.year}</p>
<p>${param.roomid}</p>
<p>${param.search_date}</p>
</body>
</html>