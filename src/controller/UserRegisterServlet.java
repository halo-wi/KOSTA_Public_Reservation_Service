package src.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOExcetion
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String customer_id = request.getParameter("customer_id");
		String customer_name = request.getParameter("customer_name");
		String customer_pw = request.getParameter("customer_pw");
		String customer_phone = request.getParameter("customer_phone");
		String email = request.getParameter("email");
		
		
		if(customer_id == null || customer_id.equals("") || customer_pw == null || customer_pw.equals("") 
				|| customer_phone == null || customer_phone.equals("") || email == null || email.equals("")){			
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
			response.sendRedirect("Sigin.jsp");
			return;
		}
		int result = new CustomerDAO().register(customer_id, customer_name, customer_pw, customer_phone, email);
			
		if(result == 1) {
			request.getSession().setAttribute("messageType", "성공메시지");
			request.getSession().setAttribute("messageContent", "회원 가입 성공했습니다.");
			response.sendRedirect("Sigin.jsp");
			return;
			
		}
		else {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
			response.sendRedirect("Sigin.jsp");
			return;
			

	}
}
