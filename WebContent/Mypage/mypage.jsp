<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>마이 페이지</title>
<style>
form{margin-top: 100px;
border: 1px solid black;
background-color: Khaki;
}

#div{

align-content: center;
text-align: center;

}


</style>

</head>

<body >
<header><jsp:include page="/common/header.jsp"></jsp:include></header>
<div id="div">
<form action="">
아이디:${list.customer_id}<br>
비밀번호:<input type="text" placeholder="수정할 비밀번호" value="${list.customer_pw}"><br>
이름:<input type="text" placeholder="수정할 이름" value="${customer_name}"><br>
전화번호:<input type="text" placeholder="수정할 전화번호" value="${customer_phone}"><br>
<input type="submit"  value="수정하기">
</form>

</div>

</body>
</html>