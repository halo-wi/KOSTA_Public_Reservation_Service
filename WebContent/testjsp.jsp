<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var = "room"  items="${selectpage }">
<c:url value="page"  var="page">
<c:param name="id" value="${emp.employee_id}"></c:param>
</c:url>
 <tr>
   <td><a href="${page }">${room.Room_id}</a></td>
   <td>
   </td>
   <td>${room.Room_id}</td>
 </tr>
</c:forEach>


</body>
</html>