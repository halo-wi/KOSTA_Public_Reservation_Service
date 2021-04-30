<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />

<title>login</title>
 
 



</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<section id="signup">
		<span id = "signuptitle"><h3>회원가입</h3></span>
		<hr>
		<form action="#" method="post">
			<table class="table table-boardered">
				<tr>
					<th>이름</th>
					<td><input type="text" class="form-control" name="address"></td>
				</tr>
				
				<tr>
					<th>아이디</th>
					<td><input type="text" class="form-control" name="id"
						placeholder="id"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" class="form-control" name="pass1"
						placeholder="password"></td>
				</tr>

				<tr>
					<th>패스워드확인</th>
					<td><input type="password" class="form-control" name="pass2"></td>
				</tr>

				<tr>
					<th>이메일</th>
					<td><input type="email" class="form-control" name="email"></td>
				</tr>

				<tr>
					<th>전화번호</th>
					<td><input type="tel" class="form-control" name="tel"></td>
				</tr>

				
			</table>
			<div id = "sighupsubmitbuttons">
				<input type="submit" class="btn btn-primary" value="전송">
				 <input type="reset" class="btn btn-danger" id="resetbt" value="취소">
			</div>
		</form>
	</section>

</body>
</html>