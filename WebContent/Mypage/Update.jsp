<%@page import="model.CustomerDAO"%>
<%@page import="model.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<%
	String customer_id = null;


	if (session.getAttribute("customer_id") != null) {
		customer_id= (String) session.getAttribute("customer_id");
	}
	if(customer_id == null) {
		session.setAttribute("messageType", "오류메시지");
		session.setAttribute("messageType", "현재 로그인이 되어 있지 않습니다.");
		response.sendRedirect("Signin.jsp");
		return;
		
	}
	CustomerVO customer = new CustomerVO();
	CustomerDAO dao = new CustomerDAO();
	dao.customer_searchById(customer_id);
%>



<head>
<meta charset="UTF-8">


<title>회원정보수정</title>



<script type="text/javascript">
	function registerCheckFunction() {
		var userID = $('#customer_id').val();
		$.ajax({
			type : 'POST',
			url : './UserRegisterCheckServlet',
			data : {
				customer_id : customer_id
			},
			success : function(result) {
				if (result == 1) {
					$('#checkMessage').html('사용할수 있는 아이디입니다.');
					$('#checkType')
							.attr('class', 'modal-content panel-success');
				} else {
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType')
							.attr('class', 'modal-content panel-warning');
				}
				$('#checkModal').modal("show");
			}
		})
	}

	
</script>
</head>

<body>
	<nav>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
			<a href="#" class="dropdown-toggle"
				data-toggle="drop down" role="button" aria-haspopup="true"
				aria-expanded="false">회원관리<span class="caret"> </span>
			</a>

				<ul class="dropdown-menu">
					<li class="active"><a href="Update.jsp">회원정보수정</a></li>
					<li><a href="logoutAction.jsp">로그아웃</a></li>


				</ul>
	</nav>

	<form method="post" action="./userUpdate">


	
				<h1>회원정보수정창</h1>
				<table align="center">
					<tr>
						<td width="200">
							<h5>아이디</h5>
						</td>
						
						<td><h5><%= customer.getcustomer_id() %></h5>
						<input type="hidden" name="customer_id" value="<%= customer.getcustomer_id() %>"></td>
					</tr>
					
					<tr>
						<td width="200">
							<h5>이름</h5>
						</td>
						
						<td><h5><%= customer.getcustomer_name() %></h5>
						<input type="hidden" name="customer_name" value="<%= customer.getcustomer_name() %>"></td>
					</tr>
					
					<tr>
						<td width="200">
							<h5>비밀번호</h5>
						</td>
						
						<td><h5><%= customer.getcustomer_pw() %></h5>
						<input type="hidden" name="customer_pw" value="<%= customer.getcustomer_pw() %>"></td>
					</tr>
					
					<tr>
						<td width="200">
							<h5>전화번호</h5>
						</td>
						
						<td><h5><%= customer.getcustomer_phone() %></h5>
						<input type="hidden" name="customer_phone" value="<%= customer.getcustomer_phone() %>"></td>
					</tr>
					
					<tr>
						<td width="200">
							<h5>이메일</h5>
						</td>
						
						<td><h5><%= customer.getemail() %></h5>
						<input type="hidden" name="email" value="<%= customer.getemail() %>"></td>
					</tr>
					
					<tr>
						<td width="200">
							<p>&nbsp;</p>
						</td>

						<td width="400"><input type="submit" value="가입하기"> <input
							type="reset" value="다시입력"></td>
					</tr>

				</table>
	</form>

</body>
</html>