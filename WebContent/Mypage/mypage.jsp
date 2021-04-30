<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>마이 페이지</title>
<jsp:include page="/common/header.jsp"></jsp:include>
</head>


<div id = "mypagecontent">
	<form action="Update">
		아이디:<label id="customer_id">${list.customer_id}</label> 
		<p>비밀번호:<input type="text" placeholder="수정할 비밀번호" value="${list.customer_pw}" id="customer_pw"> </p>
		<p>이름:<input type="text" placeholder="수정할 이름" value="${customer_name}" id="customer_name"> </p>
		<p>전화번호:<input type="text" placeholder="수정할 전화번호" value="${customer_phone}" id="customer_phone"></p> 
		<p>이메일:${list.email } </p>
		<input type="submit" value="수정하기">
	</form>
</div>
</body>
</html>