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
import model.CustomerVO;



@WebServlet("/join/JoinChkServelet")
public class JoinChkServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		String id = request.getParameter("id");
		System.out.println(id);
		CustomerDAO dao = new CustomerDAO();
		CustomerVO vo;
		try {
			vo = dao.customer_searchById(id);
			if(vo == null){
				writer.println("사용할 수 있는 아이디 입니다.");
			}else{
				writer.println("이미 있는 아이디 입니다. 다른 것을 사용해주십시오.");
			}
		} catch (SQLException e) {
			 throw new ServletException("aaaa");
		}
		
		
	}

}
