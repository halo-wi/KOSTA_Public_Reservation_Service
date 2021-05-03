<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>마이 페이지</title>
<jsp:include page="/common/header2.jsp"></jsp:include>
<link href="../CSS/footer.css" rel="stylesheet" />
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
<header class="masthead"
	style="background: white !important; color: black;">
	<div id="mypage">
		<div id="mypagetitle">
			<h3>내 정보 수정하기</h3>
		</div>
		<hr>
		<form action="Join" method="post" name="join" id="mypagetable">
			<table>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>${list.customer_id}</td>

					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" placeholder="수정할 비밀번호" value="${list.customer_pw}" id="customer_pw"
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
						<td>${list.email }</td>
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





</body>
</html>