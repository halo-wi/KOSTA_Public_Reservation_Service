package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDAO;
import model.BookVO;

/**
 * Servlet implementation class ReservationServelet
 */
@WebServlet("/Room/roomreservation")
public class ReservationServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookVO bookVO = new BookVO();
		BookDAO bookDAO = new BookDAO(); 
		
		String roomid = request.getParameter("roomid");
		String customerid = request.getParameter("customerid");
		String book_begin = request.getParameter("book_begin");
		String book_last = request.getParameter("book_last");
		String search_date = request.getParameter("search_date");
		
		System.out.println(roomid);
		System.out.println(customerid);
		System.out.println(book_begin);
		System.out.println(book_last);
		System.out.println(search_date);
		
		
		bookVO.setRoom_id(Integer.parseInt(roomid));
		bookVO.setCustomer_id(customerid);
		bookVO.setBook_begin(book_begin);
		bookVO.setBook_last(book_last);
		bookVO.setBook_date(Date.valueOf(search_date));
		
		int result = bookDAO.insertBook(bookVO);
		String msg = result>0?"예약되었습니다.":"실패";
		System.out.println(msg);
		
	}


}
