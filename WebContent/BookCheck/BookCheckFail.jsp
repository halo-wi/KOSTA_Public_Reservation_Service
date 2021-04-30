<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 실패</title>
<style >
.cen{text-align: center;}
#c2{
margin-top: 150px;
}
#diva{background-color: Thistle;
border: 1px solid black;
text-align: center;
padding:10px;
}

</style>
</head>
<body>
<header><jsp:include page="/common/header.jsp"></jsp:include></header>
<h1 id="c2" class="cen">해당 예약 번호는 검색 결과가 존재하지 않습니다.</h1>
<h1 class="cen">다시 확인 후 검색해주세요</h1>
<div id="diva">
<form action="BookNum">
<input type="number" name="booknum" required>
<input type="submit" value="예약 번호로 조회">
</form>
<button type="button"  name="bookid" onclick="idchk()">아이디로 조회</button>
</div>
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