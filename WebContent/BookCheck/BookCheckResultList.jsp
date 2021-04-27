<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에약 정보 확인</title>
</head>
<body>
<table>
<c:forEach items="${list}" var="lol">
<tr><td>${lol.book_id}</td></tr>


</c:forEach>
</table>
</body>
</html>