package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class LoginServelet
 */
@WebServlet("/Login/LoginServelet")
public class LoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		CustomerDAO dao = new CustomerDAO();
		CustomerVO customer = new CustomerVO();
		RequestDispatcher rd = null;
		if (dao.customer_login(userid, userpw) != 0) {
			System.out.println("login?");
			try {
				customer = dao.customer_searchById(userid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			String email = customer.getEmail();
			String nickname = customer.getCustomer_name();
			System.out.println("nickname:" + nickname);
			HttpSession session = request.getSession();// 있으면얻고 없으면 만든다.
			System.out.println(session.isNew());
			session.setAttribute("email", email);
			session.setAttribute("nickname", nickname);
			response.sendRedirect("../Home/home.jsp");
		}
		else {
			PrintWriter pw = response.getWriter();
			pw.println("<script language='javascript'>");
			pw.println("alert('로그인실패')");
			pw.println("</script>");
			response.sendRedirect("../join/Join.html");
		}
	}
}
