<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<c:if test="${empty param.userID }">
	아이디를 입력하세요.<br>
	<a href="C:\Users\USER\git\KOSTA_Public_Reservation_Service\WebContent\Login\loginfrom.html">로그인창</a>
</c:if>
<c:if test="${not empty param.userID }">
	<h1>환영합니다. <c:out value="${param.userID }"/> 님</h1>
</c:if>


</body>
</html>