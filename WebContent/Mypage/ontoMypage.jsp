<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
form {
	margin-top: 150px
}
</style>
</head>
<body>
	<header><jsp:include page="/common/header2.jsp"></jsp:include></header>
	<form>
		<button type="button" name="bookid" onclick="idchk()">회원정보 수정</button>
		<button type="button" name="bookid" onclick="bookchk()">예약내역 조회</button>
	</form>
	<script>
function idchk() {
	var uid="<%=(String) session.getAttribute("email")%>";
			if (uid == null) {
				location.href = "../Login/login.jsp";
			} else {
				location.href = "../Mypage/IntoMyPage?email=" + uid;
			}
		}
function bookchk() {
	var uid="<%=(String) session.getAttribute("email")%>";

			if (uid == null) {
				location.href = "../Login/login.jsp";
			} else {
				location.href = "../BookCheck/BookListByIdServelet?email=" + uid;
			}
		}
		
	</script>
	
<!-- Bootstrap core JS-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
<!-- Contact form JS-->
<script src="assets/mail/jqBootstrapValidation.js"></script>
<script src="assets/mail/contact_me.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
