package controller;

import java.beans.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CustomerDAO;
import model.CustomerVO;

@WebServlet("/Mypage/Update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("customer_id");
		String pw = request.getParameter("customer_pw");
		String email = request.getParameter("email");
		String customer_name = request.getParameter("customer_name");
		String customer_phone = request.getParameter("customer_phone");

		CustomerDAO dao = new CustomerDAO();

		if (id != null) {
			try {
				int vo = dao.customer_modify(id, customer_name, pw, customer_phone, email);
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("mypage.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("../join/Join.html");
			rd.forward(request, response);
		}

	}

}
