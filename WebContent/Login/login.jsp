<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Agency - Start Bootstrap Theme</title>
<link rel="icon" type="image/x-icon" href="../img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../CSS/home.css" rel="stylesheet" />
<link href="../CSS/login.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top"><img
				src="../img/navbar-logo.svg" alt="..." /></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars ml-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#services">예약</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#portfolio">조회</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#about">로그인</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#team">회원가입</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div>
		<form name="loginForm" action="LoginServelet" method="post"
			class="loginForm">
			<h2>Login</h2>
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
						document.loginForm.submit();

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
			<form action="LoginKakaoServelet" method="post" id="login">
				<input type="hidden" name="email" id="email"><br> <input
					type="hidden" name="nickname" id="nickname"><br>
			</form>
		</div>
	</div>

	<div class="bottomText">
		Don't you have ID? <a href="signup.jsp">sign up</a>
	</div>


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
