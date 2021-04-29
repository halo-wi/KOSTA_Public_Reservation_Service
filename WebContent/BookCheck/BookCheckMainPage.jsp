<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 페이지</title>
<link href="../CSS/login.css" rel="stylesheet" />
<style>
form, button {
	margin-top: 300px;
}
</style>
</head>
<body id="page-top">
	<jsp:include page="/common/header.jsp"></jsp:include>
	<section>

			<form action="BookNum" class="loginForm">
				<input type="number" name="booknum" id="bookchkSid"> 
				<p></p>
				<input type="submit" class="btn" value="예약 번호로 조회">
			</form>
			<div class="loginForm2">
			<button type="button" class="btn" name="bookid" onclick="idchk()" value="">
			아이디로 조회</button>
			</div>

	</section>

	<script>
		function idchk() {
			var uid =
	<%=(String) session.getAttribute("email")%>
		;

			if (uid == null) {
				location.href = "../Login/login.jsp";
			} else {
				location.href = "../Mypage/bookchk?email=" + uid;
			}
		}
	</script>
	<%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>
</body>
</html>