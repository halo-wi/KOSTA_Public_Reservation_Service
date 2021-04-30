<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 페이지</title>
<jsp:include page="/common/header.jsp"></jsp:include>

<link href="../CSS/BookChkMain.css" rel="stylesheet" />
</head>


<h3 id="bookingCheckTitle">예약 조회하기</h3>
<hr>
<div id="checkbyNo">
	<p>예약번호로 조회</p>
	<form action="BookNum">
		예약번호 : <input type="number" name="booknum" id="bookchkSid"> <br>
		<br> <input type="submit" id="checkBybooknumber_btn" value="조회하기">
	</form>
</div>

<div id="checkbyId">
	<P>회원 아이디로 조회</P>
	로그인하기
	<button type="button" id="checkById_btn" name="bookid"
		onclick="idchk()" value="">아이디로 조회</button>

</div>


<script>
	function idchk() {
		var uid =
<%=(String) session.getAttribute("email")%>
	;

		if (uid == null) {
			location.href = "../Login/login.jsp";
		} else {
			location.href = "../Mypage/bookchk?email=" + uid;
		}
	}
</script>

<style>
div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
        border: solid 1px black;
        text-align: center;
        height: 100%;
      }
      div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
        border: solid 1px black;
        text-align: center;
         height: 100%;
      }


</style>

</head>

<h3 id="bookingCheckTitle">예약 조회하기</h3>
<hr>

<div id="bookingCheck">
	<div class="left">
		<button id="CheckOption_byNo">예약번호로 조회</button>
		</div>
		<div class="right">
		<button id="CheckOption_byID">아이디로 조회</button>
	</div>
</div>

</body>
</html>
