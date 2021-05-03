<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 실패</title>
<style>
.cen {
	text-align: center;
}

#c2 {
	margin-top: 150px;
}

#diva {


	text-align: center;
	padding: 10px;
	height: 300px;
	margin-bottom: 300px;
}
</style>
<jsp:include page="/common/header2.jsp"></jsp:include>
</head>
<body>
<br><br><br>
	<h1 id="c2" class="cen" style="margin-bottom: 30px;">해당 예약 번호는 검색
		결과가 존재하지 않습니다.</h1>
	<h1 class="cen" style="margin-bottom: 50px;">다시 확인 후 검색해주세요</h1>
	<br>
	<br>
	<br>
	<div id="diva">
		<div id="failbtn">
			<form action="BookNum">

				<div class="input-group">
					<input type="number" class="form-control" name="booknum"
						id="bookchkSid" placeholder="예약번호" style = "border:1px solid lightgrey;">
					<div class="input-group-append">
						<button onclick="submit()" class="btn btn-secondary" type="button"
							id="checkBybooknumber_btn">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>
			<br>

			<button type="button" name="bookid" class="btn" onclick="idchk()">아이디로
				조회</button>
		</div>
	</div>

	<script>
function idchk() {
	var uid="<%=(String) session.getAttribute("email")%>";

	if (uid==null) {
		location.href="../Login/loginfrom.html";
	}else{
		location.href="../Mypage/bookchk?email="+uid;
	}

	</script>


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
</body>
</html>