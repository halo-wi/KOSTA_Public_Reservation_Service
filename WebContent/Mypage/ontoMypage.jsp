<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 들어가는 버튼</title>
<style>
form{margin-top:150px }
</style>
</head>
<body>
	<header><jsp:include page="/common/header.jsp"></jsp:include></header>
	<form>
		<button type="button" name="bookid" onclick="idchk()">마이페이지</button>
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
	</script>
</body>
</html>
