package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDAO;
import model.BookVO;
import model.CustomerDAO;

@WebServlet("/Room/roomreservationModify")
public class ReservationModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BookVO bookVO = new BookVO();
		BookDAO bookDAO = new BookDAO();

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String bookid = request.getParameter("book_id");
		String roomid = request.getParameter("roomid");
		String customerid = request.getParameter("customerid");
		String book_begin = request.getParameter("book_begin");
		String book_last = request.getParameter("book_last");
		String book_date = request.getParameter("book_date");
		
		CustomerDAO dao = new CustomerDAO();
		
		System.out.println(bookid);
		System.out.println(roomid);
		System.out.println(customerid);
		System.out.println(book_begin);
		System.out.println(book_last);
		System.out.println(book_date);
		
		

		if (roomid != null && customerid !=null && book_begin !=null && book_last != null && search_date != null) {
			try {
				
				int vo = dao.book_modify(roomid, customerid, book_begin, book_last, search_date);
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			RequestDispatcher rd = request.getRequestDispatcher("../Mypage/mypage.jsp");
			rd.forward(request, response);
			}
		 else {
			RequestDispatcher rd = request.getRequestDispatcher("../join/Join.html");
			rd.forward(request, response);
		 }
}
}
