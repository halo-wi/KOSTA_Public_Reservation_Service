package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CustomerDAO;

@WebServlet("/up")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");		
		String customer_id = request.getParameter("customer_id");
		HttpSession session = request.getSession();
		String customer_pw = request.getParameter("customer_pw");
		String email = request.getParameter("email");
		String customer_name = request.getParameter("customer_name");
		String customer_phone = request.getParameter("customer_phone");		

		
		
		if(customer_id == null || customer_id.equals("") || customer_pw == null || customer_pw.equals("") 
				|| customer_phone == null || customer_phone.equals("") || email == null || email.equals("")){			
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
			response.sendRedirect("Sigin.jsp");
			return;
		}
		if(!customer_id.equals((String) session.getAttribute("customer_id"))) {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "접근할 수 없습니다.");
			response.sendRedirect("Sigin.jsp");
			return;
		}
		int result = new CustomerDAO().update(customer_id, customer_name, customer_pw, customer_phone, email);
			
		if(result == 1) {
			request.getSession().setAttribute("customer_id", customer_id);
			request.getSession().setAttribute("messageType", "성공메시지");
			request.getSession().setAttribute("messageContent", "회원정보 수정에 성공했습니다.");
			response.sendRedirect("Sigin.jsp");
			
		}
		else {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "데이터베이스 오류가 발생했습니다.");
			response.sendRedirect("Update.jsp");
			return;
		
	}
		
		
		
		
	}

}
