<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />

<title>logout</title>
<jsp:include page="../common/header.jsp"></jsp:include>
</head>
<body>

	<section id="login">
		<form name="loginform" action="Logout" method="post" id="loginForm">
			<h2>ZOOM OUT</h2>
			<input type="hidden" value=${nickname } name="nickname">
			<input type="hidden" value=${email } name="email">
			<button type="button" class="btn" onclick="button()">LOG OUT</button>
			<script>
				function button() {
						document.loginform.submit();
				}
			</script>
		</form>
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
	<%-- <jsp:include page="/common/footer.jsp"></jsp:include> --%>

</body>
</html>
