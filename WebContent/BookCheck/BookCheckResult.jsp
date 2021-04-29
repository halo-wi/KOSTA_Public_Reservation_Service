<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<h1>${bookinfo==null?"예약 정보가 없습니다":"예약 정보 출력"}</h1>
<c:if test="${bookinfo!=null}">
<ul>
<li>예약 번호: ${bookinfo.book_id }</li>
<li>주소: ${bookinfo2.adress}</li>
<li>회원 아이디: ${bookinfo.customer_id }</li>
<li>예약 시작 시간: ${bookinfo.book_begin }</li>
<li>예약 종료 시간: ${bookinfo.book_last }</li>
<li>예약일: ${bookinfo.book_date }</li>
<li>지역구: ${bookinfo2.room_location}</li>
<li>전화번호: ${bookinfo2.phone}</li>
<li>취소는 ${bookinfo2.room_cancel}일 이내에 할 수 있습니다.</li>
</ul>
</c:if>

</body>
</html>