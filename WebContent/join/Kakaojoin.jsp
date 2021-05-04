<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link href="../CSS/footer.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


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

#message {
	font-size: 3pt;
	color: red;
}
</style>
<jsp:include page="../common/header2.jsp"></jsp:include>
</head>
<header class="masthead"
	style="background: white !important; color: black;">
	<div id="kakaojsp_contents">
		<div id="join">
			<div id="signuptitle">
				<h2>ZOOM OUT</h2>
			</div>
			<hr>

			<form action="../join/Join" method="post" name="join" id = "joinTable">
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
						<td><input type="hidden" name="email" class="form-control" value=${email}></td>
					</tr>

				</tbody>
			</table>
			<div id="sighupsubmitbuttons">
				<input type="submit" name="Newjoin" value="회원가입" class="btn btn-primary">
			</div>
		</form>
			
			
			
			<div id="kakaoJoin" style = "margin-bottom: 250px;">
				<h3>이미 회원이라면?</h3>
				<hr>
				<form action="ConnectServelet" method="post" name="conn">
					<table class="table table-boardered">
						<tr>
							<th>아이디</th>
							<td> <input type="text" class="form-control"  name="customerid" required style="border-color: white; border-bottom-color: black; width: 38%;"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" class="form-control" name="customerpw" required style="border-color: white; border-bottom-color: black; width: 38%;"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" class="form-control" name="phone" required style="border-color: white; border-bottom-color: black; width: 38%;"></td>
					</table>
					<input type="hidden" name="email" value=${email } required>
					<input type="hidden" name="nickname" value=${nickname } required>
					<div id="kakaosubmitbuttons"><input type="submit" name="connect" value="아이디연동하기"
						class="btn btn-primary"></div>
				</form>
			</div>

		</div>

	</div>

</header>

	<footer class="footer py-4" style = "background-color: black !important; margin-top: 250px;">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 text-lg-left">
					<span style = "color : white !important;">Copyright &copy; ZOOMOUT
					<!-- This script automatically adds the current year to your website footer-->
					<!-- (credit: https://updateyourfooter.com/)-->
					<script>
						document.write(new Date().getFullYear());
					</script></span>
				</div>
				<div class="col-lg-4 my-3 my-lg-0" style = "margin-left: -40px; font-size: 1px; color : white;">
					<a href="https://github.com/halo-wi/KOSTA_Public_Reservation_Service"><img src="../img/git-logo-black.png" style ="width:35px; height:35px; display: inline-block; ">
					<span style = "margin-left: 10px; color : white;">https://github.com/halo-wi/KOSTA_Public_Reservation_Service</span></a>
				</div>
				<div class="col-lg-4 text-lg-right">
					<p style = "color : white; font-size: 0.8em; margin-top: 10px; margin-right: -35px;">Members : 김성휘 남후승 임세혁 고석우 강성빈</p>
				</div>
			</div>
		</div>
	</footer>
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
			url : "../join/JoinChkServelet",
			data : {
				"id" : id
			},
			success : function(data, textStatus) {
				$('#message').text(data);
			}
		})
	}
</script>


</body>
</html>