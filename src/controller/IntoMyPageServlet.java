package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDAO;
import model.BookVO;
import model.CustomerDAO;
import model.CustomerVO;
import model.RoomDAO;
import model.RoomVO;

/**
 * Servlet implementation class IntoMyPageServlet
 */
@WebServlet("/Mypage/IntoMyPage")
public class IntoMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String val=request.getParameter("email");//값 받아오기
		CustomerDAO dao2=new CustomerDAO();//비교용 dao 획득
		try {
			CustomerVO bo2=dao2.customer_searchByEmail(val);//customer_id 구하기
			
			request.setAttribute("list", bo2); //값 저장
			request.setAttribute("id", bo2.getCustomer_id());
			RequestDispatcher rd=request.getRequestDispatcher("../Mypage/mypage.jsp");
			rd.forward(request, response);//값 전달
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
