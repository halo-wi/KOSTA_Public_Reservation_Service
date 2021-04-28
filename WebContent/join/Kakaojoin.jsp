<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원가입 페이지 입니다.

<form action="ConnectServelet" method="post" name="conn">
아이디:<input type="text" name="customerid"><br>
비밀번호:<input type="password" name="customerpw"><br>
전화번호:<input type="text" name="phone"><br>
<input type="hidden" name="email" value=${email }>
<input type="hidden" name="nickname" value=${nickname }>
<input type="submit" name="connect" value="아이디연동하기">
</form>
</body>
</html>