package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.CustomerDAO;
import model.CustomerVO;

@WebServlet("/Mypage/Inquery")
public class CustomerInqueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CustomerVO customerVO = new CustomerVO();
		CustomerDAO customerDAO = new CustomerDAO();

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String customer_id = request.getParameter("customer_id");
		String customer_pw = request.getParameter("customer_pw");
		String email = request.getParameter("email");
		String customer_name = request.getParameter("customer_name");
		String customer_phone = request.getParameter("customer_phone");

		

		System.out.println(customer_id);
		System.out.println(customer_pw);
		System.out.println(email);
		System.out.println(customer_name);
		System.out.println(customer_phone);

		
	}
}
