<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인 페이지</title>
<jsp:include page="/common/header.jsp"></jsp:include>

</head>

<h3 id="bookingCheckTitle">예약 조회하기</h3>
<hr>
<div id="bookingCheck">
	<div id="checkbtn">
		<button id="CheckOption_byNo">예약번호로 조회</button>
		<button id="CheckOption_byID">아이디로 조회</button>
	</div>

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
<script type="text/javascript">
	$("#showBtn").click(function() {
		$("#checkById").css("display", "block");

	});
</script>


</body>
</html>
