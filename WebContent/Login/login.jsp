<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />

<title>login</title>
<jsp:include page="../common/header.jsp"></jsp:include>
</head>
<body>

	<section id="login">
		<form name="loginform" action="LoginServelet" method="post"
			id="loginForm">
			<h2>ZOOM OUT</h2>
			<div class="idForm">
				<input type="text" name="userid" id="id" placeholder="ID">
			</div>
			<div class="passForm">
				<input type="password" name="userpw" id="pw" placeholder="PW">
			</div>
			<button type="button" class="btn" onclick="button()">LOG IN</button>
			<script>
				function button() {
					if (document.getElementById("id").value == ""
							|| document.getElementById("pw").value == "") {
						alert("올바르게 입력해주세요");
						return false;
					} else
						document.loginform.submit();
				}
			</script>
		</form>
		<div id="Kakao_login">
			<a href="javascript:kakaologin();"><img alt=""
				src="../img/kakao_login_medium_narrow.png"></a>
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
				var email;
				var nickname;
				window.Kakao.init("6eb4a80e6c215b46736c99b7c1857a09");
				function kakaologin() {
					window.Kakao.Auth
							.login({
								scope : 'profile, account_email',
								success : function(authObj) {
									console.log(authObj);
									window.Kakao.API
											.request({
												url : '/v2/user/me',
												success : function(response) {
													console.log(response);
													email = response.kakao_account.email;
													nickname = response.kakao_account.profile.nickname;
													document
															.getElementById("email").value = email;
													document
															.getElementById("nickname").value = nickname;
													document.getElementById(
															"login").submit();
													//location.href = "LoginKakaoServelet?email="+response.kakao_account.email+
													//"&nickname="+response.kakao_account.profile.nickname;
												}
											});
								}
							});
				}
			</script>
			<form action="LoginKakaoServelet" method="post" id="loginkakao">
				<input type="hidden" name="email" id="email"><br> <input
					type="hidden" name="nickname" id="nickname"><br>
			</form>
		</div>


		<div id="Naver_login">
			<script type="text/javascript"
				src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
				charset="utf-8"></script>
			<script type="text/javascript"
				src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<div id="naver_id_login"></div>
			<!-- //네이버아이디로로그인 버튼 노출 영역 -->
			<script type="text/javascript">
				var naver_id_login = new naver_id_login(
						"8S_iNrmYWtRUNjvQAXoN",
						"http://localhost:8090/KOSTA_Public_Reservation_Service/Login/navercallback.html");
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("green", 3, 40);
				naver_id_login.setDomain("http://localhost:8090");
				naver_id_login.setState(state);
				naver_id_login.init_naver_id_login();
			</script>
		</div>

		<div id="bottomText">
			아직 회원이 아니신가요? <a href="signup.jsp" style="color: #2c98bf">회원가입</a>
		</div>


	</section>
	<script>
		var x = document.getElementById("login");
		var y = document.getElementById("register");
		var z = document.getElementById("btn");

		function login() {
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0";
		}

		function register() {
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
		}
	</script>

</body>
</html>
