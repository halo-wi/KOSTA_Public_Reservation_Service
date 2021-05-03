<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function fn() {
		var id = $('#idchk').val();
		if (id == '') {
			alert("id를 입력하세요");
			return;
		}
		$.ajax({
			type : "post",
			async : "true",
			url : "JoinChkServelet",
			data : {
				"id" : id
			},
			success : function(data, textStatus) {
				$('#message').text(data);
			}
		})
	}
</script>

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


#message {
	font-size: 3pt;
	color: red;
}
</style>
</head>
<body>
	<header class="masthead" style="background: white !important; color: black;">
		<div id="join">
			<div id="signuptitle"><h2>ZOOM OUT</h2></div>
		<hr>

		<form action="Join" method="post" name="join" id = "joinTable">
			<table>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="customerid" id="idchk"
							class="form-control" required
							style="border-color: white; border-bottom-color: black; width: 150%;"></td>

						<td><input type="button" value="중복체크" id="btn_dup"
							onclick="fn()"></td>
						<td><span id="message" style="width: 10%;"></span></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="customerpw"
							class="form-control" required
							style="border-color: white; border-bottom-color: black; width: 150%;"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="customerpwchk"
							class="form-control" required
							style="border-color: white; border-bottom-color: black; width: 150%;"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" class="form-control"
							required
							style="border-color: white; border-bottom-color: black; width: 150%;"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="phone" class="form-control"
							required
							style="border-color: white; border-bottom-color: black; width: 150%;"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="email" class="form-control"
							required
							style="border-color: white; border-bottom-color: black; width: 150%;"></td>
					</tr>

				</tbody>
			</table>
			<div id="sighupsubmitbuttons">
				<input type="submit" name="Newjoin" value="회원가입" class="btn btn-primary">
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