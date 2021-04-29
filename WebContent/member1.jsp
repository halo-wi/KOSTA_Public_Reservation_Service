<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%
request.setCharacterEncoding("UTF-8");
String customer_id = request.getParameter("customer_id");
String customer_name = request.getParameter("customer_name");
String customer_pw = request.getParameter("customer_pw");
String customer_phone = request.getParameter("customer_phone");
String email = request.getParameter("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보출력창</title>
</head>
<body>
	<table border="1" align="center">
		<tr align="center" bgcolor="#99ccff">
			<td width="20%"><b>아이디</b></td>
			<td width="20%"><b>이름</b></td>
			<td width="20%"><b>비밀번호</b></td>
			<td width="20%"><b>핸드폰</b></td>
			<td width="20%"><b>이메일</b></td>
		</tr>
		<tr align=center>
			<td><%=customer_id%></td>
			<td><%=customer_name%></td>
			<td><%=customer_pw%></td>
			<td><%=customer_phone%></td>
			<td><%=email%></td>
		</tr>
		<tr align=center>
			<td>${param.customer_id }</td>
			<td>${param.customer_name }</td>
			<td>${param.customer_pw }</td>
			<td>${param.customer_phone }</td>
			<td>${param.email }</td>
		</tr>
	</table>
</body>
</html>