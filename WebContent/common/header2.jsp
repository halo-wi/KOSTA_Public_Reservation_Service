<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
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
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
			id="mainNav">
			<div class="container">
					<a class="navbar-brand js-scroll-trigger" href="../Home/home.jsp">
					<p style = "color : white; font-family: 'PT Sans Caption, sans-serif;'">zoomout</p></a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					Menu <i class="fas fa-bars ml-1"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav text-uppercase ml-auto">
						<c:if test="${email!=null}">
						<li class="nav-item" ><a class="nav-link js-scroll-trigger"
						 style="font-size: 3pt;">&nbsp;&nbsp;${nickname}님<br>환영합니다.</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="../Search/roomlocation">예약하기</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="../BookCheck/BookCheckMainPage.jsp">예약조회</a></li>
						<c:if test="${email==null}">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="../Login/login.jsp">로그인</a></li>
						</c:if>
						<c:if test="${email!=null}">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="../Login/logout.jsp"> 로그아웃</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="../join/Join.jsp">회원가입</a></li>
						
						<li class="nav-item">
						<c:if test="${email==null}">
						<a class="nav-link js-scroll-trigger" href="../Login/login.jsp">마이페이지</a></c:if>
						<c:if test="${email!=null}">
						<a class="nav-link js-scroll-trigger" href="../Mypage/ontoMypage.jsp">마이페이지</a></c:if>
						</li>
							
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<!-- Bootstrap core JS-->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
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

