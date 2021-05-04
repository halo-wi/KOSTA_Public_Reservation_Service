<%@page import="model.RoomVO"%>
<%@page import="model.RoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에약 정보 확인</title>
<jsp:include page="/common/header2.jsp"></jsp:include>
<style>
	table{ 
	width: 1100px; 
	
	border-bottom: solid 2px lightgray;
	font: bold;
	}
	td{
	border-bottom: solid 1px lightgray;
	height: 100px;
	
	}
	h3{ 
	margin-top: 200px;
	color: red;
	text-align: center;
	}
</style>
</head>
<body>
<div style = "width:100%; height:100%">
<h3 >${nickname }님의 예약내역</h3>
<hr>
<table id="bookchklist">
<tr style= "font-size: 14pt;">
<td style= "width: 5%;">예약 번호</td>
<td style= "width: 10%;">예약일</td>
<td style= "width: 8%;">시작 시간</td>
<td style= "width: 8%;">종료 시간</td>
<td  style= "width: 30%;">예약 장소</td>
<td style= "width: 10%;">전화번호</td>
<td style= "width: 15%;">취소 가능일</td>
</tr>
<c:forEach items="${list}" var="list">
<c:url value="BookNum" var="bn">
<c:param name="booknum" value="${list.book_id}"></c:param>
</c:url>
<tr><td ><a href="${bn}" style= "color: blue;">${list.book_id}</a></td>
<td>${list.book_date}</td>
<td>${list.book_begin}</td>
<td>${list.book_last}</td>
<td>${list.adress}</td>
<td>${list.phone}</td>
<td>예약일기준 ${list.room_cancel}일 전 까지</td></tr>
</c:forEach>
</table>
</div>
<!-- footer -->
   <footer class="footer py-4" style="background-color: black !important; margin-top: 394px;">
      <div class="container">
         <div class="row align-items-center">
            <div class="col-lg-4 text-lg-left">
               <span style="color: white !important;">Copyright &copy;
                  ZOOMOUT <!-- This script automatically adds the current year to your website footer-->
                  <!-- (credit: https://updateyourfooter.com/)--> <script>
                     document.write(new Date().getFullYear());
                  </script>
               </span>
            </div>
            <div class="col-lg-4 my-3 my-lg-0"
               style="margin-left: -40px; font-size: 3px; color: white;">
               <a
                  href="https://github.com/halo-wi/KOSTA_Public_Reservation_Service"><img
                  src="../img/git-logo-black.png"
                  style="width: 35px; height: 35px; display: inline-block;"> <span
                  style="margin-left: 10px; color: white;">https://github.com/halo-wi/KOSTA_Public_Reservation_Service</span></a>
            </div>
            <div class="col-lg-4 text-lg-right">
               <p
                  style="color: white; font-size: 0.8em; margin-top: 10px; margin-right: -35px;">Members
                  : 김성휘 남후승 임세혁 고석우 강성빈</p>
            </div>
         </div>
      </div>
   </footer>
</body>
</html>