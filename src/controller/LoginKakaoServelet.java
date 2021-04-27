package controller;

import java.io.IOException;
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

@WebServlet("/Login/LoginKakaoServelet")
public class LoginKakaoServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		System.out.println("LoginKakaoServelet.....");
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		
		byte[] utf8StringBuffer = nickname.getBytes("utf-8");
		nickname = new String(utf8StringBuffer, "utf-8");
	
		CustomerDAO dao = new CustomerDAO();
		CustomerVO customer = new CustomerVO();
		RequestDispatcher rd = null;
		try {
			customer = dao.customer_searchByEmail(email);
			if (customer.getEmail() == email) {
				request.setAttribute("name", customer.getCustomer_name());
				HttpSession session = request.getSession();// 있으면얻고 없으면 만든다.
				System.out.println(session.isNew() == true ? "로그인중..." : "세션만료");
				session.setAttribute("email", email);
				session.setAttribute("nickname", nickname);
				rd = request.getRequestDispatcher("/Home/home.jsp");
			} else {
				request.setAttribute("email", email);
				request.setAttribute("nickname", nickname);
				rd = request.getRequestDispatcher("/join/Kakaojoin.jsp");
			}
			rd.forward(request, response);
		} catch (SQLException e) {
			System.out.println("sql 오류");
		}
	}
}