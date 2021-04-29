<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>마이 페이지</title>
<style>
form{margin-top: 100px;}
</style>

</head>

<body >
<header><jsp:include page="/common/header.jsp"></jsp:include></header>
<form action="Update">
아이디:<label id ="customer_id">${list.customer_id}</label>
비밀번호:<input type="text" placeholder="수정할 비밀번호" value="${list.customer_pw}" id ="customer_pw">
이름:<input type="text" placeholder="수정할 이름" value="${customer_name}" id = "customer_name">
전화번호:<input type="text" placeholder="수정할 전화번호" value="${customer_phone}" id = "customer_phone">
이메일:${list.email }
<input type="submit" value="수정하기">
</form>

<jsp:include page="/common/footer.jsp"></jsp:include>

</body>
</html>