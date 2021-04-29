<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function fn() {
		var id = $('#id').val();
		if (id==''){
			alert("id를 입력하세요");
			return;
		}
		$.ajax({
			type: "post",
			async: "true",
			url: "JoinChkServelet",
			data: {"id": id},
			success: function(data, textStatus) {
				$('#message').text(data);
			}
		})
	}
	
</script>

</head>
<body>
회원가입 페이지 입니다.
<jsp:include page="/common/header.jsp"></jsp:include>

<form action="Join" method="post" name="join">
아이디:<input type="text" name="customerid" id="id" required>
<input type="button" value="중복체크" id="btn_dup" onclick="fn()"> 
<span id = "message"></span><br>
비밀번호:<input type="password" name="customerpw" required><br>
비밀번호 확인:<input type="password" name="customerpwchk" required><br>
이름:<input type="text" name="name" required><br>
전화번호:<input type="text" name="phone" required><br>
이메일:<input type="email" name="email" required><br>
<input type="submit" name="Newjoin" value="회원가입">
</form>

<form action="ConnectServelet" method="post" name="conn">
아이디 :<input type="text" name="customerid" required><br>
비밀번호:<input type="password" name="customerpw" required><br>
전화번호:<input type="text" name="phone" required><br>
<input type="hidden" name="email" value=${email } required>
<input type="hidden" name="nickname" value=${nickname } required>
<input type="submit" name="connect" value="아이디연동하기">

</form>
</body>
</html>