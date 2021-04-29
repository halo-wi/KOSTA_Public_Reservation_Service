<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 	 	 	
<title>예약 확인 페이지</title>
<style >
form{margin-top: 100px;}
</style>
</head>
<body>
<header><jsp:include page="/common/header.jsp"></jsp:include></header>
<form action="BookNum">
<input type="number" name="booknum" required>
<input type="submit" value="예약 번호로 조회">
</form>


<button type="button"  name="bookid" onclick="idchk()">아이디로 조회</button>

<script >
function idchk() {
	var uid="<%=(String)session.getAttribute("email") %>";

	if (uid==null) {
		location.href="../Login/login.jsp";
	}else{
		location.href="../Mypage/bookchk?email="+uid;
	}
}
</script>
<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>
