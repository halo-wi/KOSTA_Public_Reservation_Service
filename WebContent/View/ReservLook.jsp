<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<h1>${chk==null?"예약이 실패했습니다":"예약이 성공했습니다"}</h1>
<c:if test="${chk!=null}">
<ul>
<li>예약 번호: ${chk.book_id }</li>
<li>주소: ${chk2.adress}</li>
<li>회원 아이디: ${chk.customer_id }</li>
<li>예약 시작 시간: ${chk.book_begin }</li>
<li>예약 종료 시간: ${chk.book_last }</li>
<li>예약일: ${chk.book_date }</li>
<li>지역구: ${chk2.room_location}</li>
<li>전화번호: ${chk2.phone}</li>
<li>취소는 ${chk2.room_cancel}일 이내에 할 수 있습니다.</li>
</ul>
</c:if>


</body>
</html>