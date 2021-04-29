<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 실패</title>
<style >
h1{margin-top: 100px;}
</style>
</head>
<body>
<header><jsp:include page="/common/header.jsp"></jsp:include></header>
<h1>해당 예약 번호는 검색 결과가 존재하지 않습니다.</h1>
<h1>다시 확인 후 검색해주세요</h1>
<form action="BookNum">
<input type="number" name="booknum" required>
<input type="submit" value="예약 번호로 조회">
</form>


<button type="button"  name="bookid" onclick="idchk()">아이디로 조회</button>

<script >
function idchk() {
	var uid="<%=(String)session.getAttribute("email") %>";

	if (uid==null) {
		location.href="../Login/loginfrom.html";
	}else{
		location.href="../Mypage/bookchk?email="+uid;
	}
	</script >
</body>
</html>