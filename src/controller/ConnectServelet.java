package controller;



import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Base64.Encoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomerDAO;

/**
 * Servlet implementation class ConnectServelet
 */
@WebServlet("/Login/ConnectServelet")
public class ConnectServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		System.out.println(1 + ":" + nickname);
		String customerid = request.getParameter("customerid");
		String customerpw = request.getParameter("customerpw");
		String phone = request.getParameter("phone");
		CustomerDAO dao = new CustomerDAO();
		RequestDispatcher rd = null;
		request.setAttribute("nickname", nickname);
		request.setAttribute("email", email);
		
		if(dao.customer_login(customerid, customerpw)!=0) {
			try {
				int result = dao.customer_modify(customerid, nickname, customerpw, phone, email);
				System.out.println("result="+result);
				if(result!=0) {
					request.setAttribute("id", customerid);
					request.setAttribute("pw", customerpw);
					rd = request.getRequestDispatcher("/Login/nomallogin.jsp");
				};
			} catch (SQLException e) {
				e.printStackTrace();
				rd = request.getRequestDispatcher("/join/Kakaojoin.jsp");
			}
		}
		else {
			rd = request.getRequestDispatcher("/join/Kakaojoin.jsp");
		}
		System.out.println(4);
		rd.forward(request, response);
	}
}
