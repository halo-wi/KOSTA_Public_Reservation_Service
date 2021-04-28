<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>회원가입창</title>



<script type="text/javascript">
	function registerCheckFunction() {
		var userID = $('#customer_id').val();
		$.ajax({
			type : 'POST',
			url : './UserRegisterCheckServlet',
			data : {
				customer_id : customer_id
			},
			success : function(result) {
				if (result == 1) {
					$('#checkMessage').html('사용할수 있는 아이디입니다.');
					$('#checkType')
							.attr('class', 'modal-content panel-success');
				} else {
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType')
							.attr('class', 'modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		})
	}
</script>
</head>

<body>
	<form method="post" action="member1.jsp">
		<h1>회원가입창</h1>
		<table align="center">
			<tr>
				<td width="200">
					<p align="right">아이디
				</td>
				<p>
				<td width="400"><input type="text" name="id"
					placeholder="아이디를 입력하세요"></td>
			</tr>
			<tr>
				<td width="200">
					<p align="right">이름
				</td>
				<td width="400">
					<p>
						<input type="text" name="name" placeholder="이름을 입력하세요">
				</td>
			</tr>
			<tr>
				<td width="200">
					<p align="right">비밀번호
				</td>
				<td width="400">
					<p>
						<input type="text" name="id" placeholder="비밀번호를 입력하세요">
				</td>
			</tr>
			<tr>
				<td width="200">
					<p align="right">핸드폰
				</td>
				<td width="400">
					<p>
						<input type="text" name="id" placeholder="핸드폰번호를 입력하세요">
				</td>
			</tr>
			<tr>
				<td width="200">
					<p align="right">이메일
				</td>
				<td width="400">
					<p>
						<input type="text" name="email" placeholder="이메일을 입력하세요">
				</td>
			</tr>
			<tr>
				<td width="200">
					<p>&nbsp;</p>
				</td>

				<td width="400"><input type="submit" value="가입하기"> <input
					type="reset" value="다시입력"></td>
			</tr>

		</table>

	</form>

</body>
</html>