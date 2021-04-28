<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload=function() {
	alert("aa");
	document.kakaologin.submit();
} 
</script>
<form action="LoginKakaoServelet" name="kakaologin" method="post">
<input type="hidden" value=${email }>
<input type="hidden" value=${nickname }>
</form>
</body>
</html>