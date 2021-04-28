<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연동하기</title>
</head>
<body>
<form action="/Home/home.jsp" method="post">
아이디:<input type="text" name="userid" value=${id }><br>
비밀번호:<input type="password" name="userpw" value=${pw }><br>
<input type="submit" value="로그인">
</form>
</body>
</html>