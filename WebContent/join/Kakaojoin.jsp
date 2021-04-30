<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디가 이미 있나요?</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function fn() {
		var id = $('#id').val();
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

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>

	<section id="signup">
		<span id="signuptitle"><h3>회원가입</h3></span>
		<hr>

		<form action="Join" method="post" name="join">
			<table class="table table-boardered">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="customerid" id="id"
						class="form-control" required></td>
				</tr>
				<tr>
					<td><input type="button" value="중복체크" id="btn_dup"
						class="btn btn-primary" onclick="fn()"></td>
				</tr>
				<tr>
					<td><span id="message" class="form-control"></span></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="customerpw"
						class="form-control" required></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="customerpwchk"
						class="form-control" required></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" class="form-control"
						required></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" class="form-control"
						required></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" class="form-control"
						required></td>
				</tr>

			</table>
			<div id="sighupsubmitbuttons">
				<input type="submit" name="Newjoin" value="회원가입"
					class="btn btn-primary">
			</div>
		</form>
<h3>이미 회원이라면?</h3><hr>
		<form action="ConnectServelet" method="post" name="conn">
			<table class="table table-boardered">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="customerid" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="customerpw" required></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" required></td>
			</table>
			<input type="hidden" name="email" value=${email } required> <input
				type="hidden" name="nickname" value=${nickname } required> <input
				type="submit" name="connect" value="아이디연동하기" class="btn btn-primary">
		</form>
	</section>

</body>
</html>