<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="2; url=../Home/home.jsp">
<title>에약 취소 결과</title>
<style>
#getdown{
margin-top: 130px;
color: red;
text-align: center;
}
</style>
</head>
<body>
<header><jsp:include page="/common/header.jsp"></jsp:include></header>
<div id="getdown">
<h1>해당 예약은 ${message}개 취소되었습니다.</h1>
</div>

</body>
</html>