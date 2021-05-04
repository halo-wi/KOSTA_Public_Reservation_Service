<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>마이 페이지</title>
<link href="../CSS/footer.css" rel="stylesheet" />
<jsp:include page="../common/header2.jsp"></jsp:include>
<style>
th {
	width: 30%;
	box-sizing: border-box;
	text-align: center;
	height: 100%;
	padding-left: 30px;
}

td, tr {
	width: 200px;
	height: 40px;
	text-align: center;
}

</style>
</head>
<body>
<header class="masthead"
	style="background: white !important; color: black;">
	<div id="mypage">
		<div id="mypagetitle">
			<h3>내 정보 수정하기</h3>
		</div>
		<hr>
		<form action="Update" method="post" name="join" id="mypagetable">
			<table id  = "mypage-table">
				<tbody>
					<tr>
						<th>아이디</th>
						<td><div id = "list_customer_id" value="${id}">${id}</div></td>
						<input id = "customer_id" type="hidden" value="${id}">
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" placeholder="수정할 비밀번호" value="${customer_pw}" id="customer_pw"
							class="form-control" required
							style="border-color: white; border-bottom-color: black; width: 40%;"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" placeholder="수정할 이름" value="${customer_name}" id="customer_name"
							class="form-control" required
							style="border-color: white; border-bottom-color: black; width: 40%;"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" placeholder="수정할 전화번호" value="${customer_phone}" id="customer_phone" class="form-control"
							required
							style="border-color: white; border-bottom-color: black; width: 40%;"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" value="${list.email}" id="customer_phone" class="form-control"
							required
							style="border-color: white; border-bottom-color: black; width: 40%;"> </td>
					</tr>
				</tbody>
			</table>
			
			<div id="mypage_submitBtn">
				<input type="submit" name="Newjoin" value="수정하기" class="btn btn-primary">
			</div>
		</form>
	</div>

</header>

<div id="footer">
	<p>&copyZOOMOUT 팀원 강성빈 고석우 김성휘 남후승 임세혁</p>
	<p>
		<a href="https://github.com/halo-wi/KOSTA_Public_Reservation_Service"
			target="_blank" style="color: grey;">
			https://github.com/halo-wi/KOSTA_Public_Reservation_Service</a>
	</p>

</div>

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