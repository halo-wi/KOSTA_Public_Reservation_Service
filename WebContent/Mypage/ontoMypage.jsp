<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	<h2 id="ontomypage_Title"
		style="font-family: font-family : 'PT Sans Caption, sans-serif;'">MY
		PAGE</h2>
	<hr style="border: 0; height: 1px; background: black;">
	<div id="mypage_button">
		<div id="mypage_inside">
			<h5 style="font-family: 'PT Sans Caption, sans-serif;'">내 정보 수정</h5>
			<button type="button" class="btn" id="mypageBtn" onclick="idchk()">바로가기</button>
		</div>
	</div>
	<div id="book_list_button">
		<div id="booklist_inside">
			<h5 style="font-family: 'PT Sans Caption, sans-serif;'">나의 예약내역</h5>
			<button type="button" class="btn" id="booklistBtn" onclick="bookchk()">바로가기</button>
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
   var uid="<%=(String) session.getAttribute("email")%>";
         if (uid == null) {
            location.href = "../Login/login.jsp";
         } else {
            location.href = "../Mypage/IntoMyPage?email=" + uid;
         }
      }
function bookchk() {
   var uid="<%=(String) session.getAttribute("email")%>";

		if (uid == null) {
			location.href = "../Login/login.jsp";
		} else {
			location.href = "../BookCheck/BookListByIdServelet?email=" + uid;
		}
	}
</script>
</html>
