<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 	 	 	
<title>예약 확인 페이지</title>
<jsp:include page="/common/header.jsp"></jsp:include>

<link href="../CSS/footer.css" rel="stylesheet" />


<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&family=Noto+Sans+KR:wght@100&family=Nunito+Sans:wght@200&display=swap"
	rel="stylesheet">
</head>

<div id="contents">
	<h2 id="bookingCheckTitle"
		style="font-family: 'Noto Sans KR', sans-serif;">예약조회</h2>
	<hr>

	<div id="checkbyNo">
		<div id="checkbyNo-inside">
			<h5 style="font-family: 'Noto Sans KR', sans-serif;">예약번호로 조회</h5>
			<form action="BookNum">
				<input type="number" name="booknum" id="bookchkSid"
					placeholder="예약번호"> <input type="submit"
					id="checkBybooknumber_btn" value="조회">
			</form>
		</div>
	</div>

	<div id="checkbyId">
		<div id="checkbyId-inside">
			<h5 style="font-family: 'Noto Sans KR', sans-serif;">아이디로 조회</h5>
			<c:if test="${email==null}">
			<button type="button" id="checkById_btn" name="bookid"
				onclick="idchk()" value="">로그인</button>
				</c:if>
				<c:if test="${email!=null}">
			<button type="button" id="checkById_btn" name="bookid"
				onclick="idchk()" value="">예약조회</button>
				</c:if>
		</div>
	</div>
</div>
<div id="footer">
	<p>&copyZOOMOUT 팀원 강성빈 고석우 김성휘 남후승 임세혁</p>
	<p>
		<a href="https://github.com/halo-wi/KOSTA_Public_Reservation_Service"
			target="_blank" style="color: grey;">
			https://github.com/halo-wi/KOSTA_Public_Reservation_Service</a>
	</p>

</div>


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

<style>
div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
        border: solid 1px black;
        text-align: center;
        height: 100%;
      }
      div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
        border: solid 1px black;
        text-align: center;
         height: 100%;
      }

</style>
</html>
