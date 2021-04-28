package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomerDAO;


/**
 * Servlet implementation class Join
 */
@WebServlet("/join/Join")
public class JoinServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customerid = request.getParameter("customerid");
		String customerpw = request.getParameter("customerpw");
		String nickname = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		CustomerDAO dao = new CustomerDAO();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			if(0!=dao.customer_join(customerid, nickname, customerpw, phone, email)) {
				//response.setHeader(nickname, email);
				//response.sendRedirect("../Login/MainLogin.html");
				out.println("<script>");
				out.println("alert('가입을 축하합니다');");
				out.println("</script>");
			
				response.setHeader("refresh", "1;url=../Login/MainLogin.html");
			}
			else {
				
				response.sendRedirect("Join.html");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
