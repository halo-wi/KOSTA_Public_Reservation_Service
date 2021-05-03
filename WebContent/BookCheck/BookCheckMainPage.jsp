<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 페이지</title>
<jsp:include page="/common/header2.jsp"></jsp:include>

<link href="../CSS/footer.css" rel="stylesheet" />


<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&family=Noto+Sans+KR:wght@100&family=Nunito+Sans:wght@200&display=swap"
	rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>


<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=PT+Sans+Caption&display=swap"
	rel="stylesheet">
</head>

<div id="contents">
	<h2 id="bookingCheckTitle"
		style="font-family: font-family : 'PT Sans Caption, sans-serif;'">예약조회</h2>
	<hr style="border: 0; height: 1px; background: black;">

	<div id="checkbyNo">
		<div id="checkbyNo-inside">
			<h5 style="font-family: 'PT Sans Caption, sans-serif;'">예약번호로 조회</h5>
			<form action="BookNum">
				<div class="input-group">
					<input type="number" class="form-control" name="booknum"
						id="bookchkSid" placeholder="예약번호">
					<div class="input-group-append">
						<button onclick="submit()" class="btn btn-secondary" type="button"
							id="checkBybooknumber_btn">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div id="checkbyId">
		<div id="checkbyId-inside">
			<h5 style="font-family: 'PT Sans Caption, sans-serif;'">아이디로 조회</h5>
			<c:if test="${email==null}">
				<button type="button" class="btn btn-secondary" id="checkById_btn"
					name="bookid" onclick="idchk()" value="">로그인</button>
			</c:if>
			<c:if test="${email!=null}">
				<button type="button" id="checkById_btn" name="bookid"
					onclick="bookchk()" value="">예약조회</button>
			</c:if>
		</div>
	</div>
</div>


<footer class="footer py-4" style="background-color: black !important;">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-4 text-lg-left">
				<span style="color: white !important;">Copyright &copy;
					ZOOMOUT <!-- This script automatically adds the current year to your website footer-->
					<!-- (credit: https://updateyourfooter.com/)--> <script>
						document.write(new Date().getFullYear());
					</script>
				</span>
			</div>
			<div class="col-lg-4 my-3 my-lg-0"
				style="margin-left: -40px; font-size: 1px; color: white;">
				<a
					href="https://github.com/halo-wi/KOSTA_Public_Reservation_Service"><img
					src="../img/git-logo-black.png"
					style="width: 35px; height: 35px; display: inline-block;"> <span
					style="margin-left: 10px; color: white;">https://github.com/halo-wi/KOSTA_Public_Reservation_Service</span></a>
			</div>
			<div class="col-lg-4 text-lg-right">
				<p
					style="color: white; font-size: 0.8em; margin-top: 10px; margin-right: -35px;">Members
					: 김성휘 남후승 임세혁 고석우 강성빈</p>
			</div>
		</div>
	</div>
</footer>

<script>
	function idchk() {
			location.href = "../Login/login.jsp";
	}
	
	function bookchk() {	
		var uid="<%=(String) session.getAttribute("email")%>
	";
		location.href = "../BookCheck/BookListByIdServelet?email=" + uid;
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
