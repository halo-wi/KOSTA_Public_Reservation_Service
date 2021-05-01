<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
form{margin-top:150px }
</style>
</head>
<body>
	<header><jsp:include page="/common/header.jsp"></jsp:include></header>
	<form>
		<button type="button" name="bookid" onclick="idchk()">회원정보 수정</button>
		<button type="button" name="bookid" onclick="bookchk()">예약내역 조회</button>
	</form>
	<script>
function idchk() {
	var uid=<%=(String) session.getAttribute("email")%>;

			if (uid == null) {
				location.href = "../Login/login.jsp";
			} else {
				location.href = "../Mypage/IntoMyPage?email=" + uid;
			}
		}
function bookchk() {
	var uid=<%=(String) session.getAttribute("email")%>;

			if (uid == null) {
				location.href = "../Login/login.jsp";
			} else {
				location.href = "../BookCheck/BookListByIdServelet?email=" + uid;
			}
		}
		
	</script>
</body>
</html>
