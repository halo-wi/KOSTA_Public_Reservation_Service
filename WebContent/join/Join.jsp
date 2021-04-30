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
				<td><input type="text" name="customerid" id="id" class="form-control" required></td>
				</tr>
				<tr>
				<td><input type="button" value="중복체크" id="btn_dup" class="btn btn-primary" onclick="fn()"></td>
				</tr>
				<tr>
				<td><span id="message" class="form-control"></span></td>
				</tr>
				<tr>
				 <th>비밀번호</th>
				<td><input type="password" name="customerpw" class="form-control" required></td>
				</tr>
				<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="customerpwchk" class="form-control" required></td>
				</tr>
				<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="form-control" required></td>
				</tr>
				<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" class="form-control" required></td>
				</tr>
				<tr>
				<th>이메일</th>
				<td><input type="email" name="email" class="form-control" required></td>
				</tr>
				
			</table>
			<div id = "sighupsubmitbuttons">
				<input type="submit" name="Newjoin" value="회원가입" class="btn btn-primary">
			</div>
		</form>

	</section>
</body>
</html>