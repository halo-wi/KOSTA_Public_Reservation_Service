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
		response.setContentType("text/html;charset=utf-8");
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		CustomerDAO dao = new CustomerDAO();
		CustomerVO customer = new CustomerVO();
		PrintWriter out = response.getWriter();
		int login = dao.customer_login(userid, userpw);
		if (login == 0) {
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
			response.sendRedirect("../Home/home.html");
		}
		else if (login == 1) {
			out.println("<script>");
			out.println("alert('비밀번호를 확인하세요.');");
			out.println("</script>");
			response.setHeader("refresh", "1;url=../Login/login.jsp");
		}
		else if (login == 2) {
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("</script>");
			response.setHeader("refresh", "1;url=../Login/login.jsp");
		}
		else if (login == 3) {
			out.println("<script>");
			out.println("alert('회원가입창으로 이동합니다.');");
			out.println("</script>");
			response.setHeader("refresh", "1;url=../join/Join.html");
		}
	}
}
