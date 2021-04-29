package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDAO;
import model.BookVO;
import model.RoomDAO;
import model.RoomVO;

/**
 * Servlet implementation class BookNumServlet
 */
@WebServlet("/BookCheck/BookNum")
public class BookNumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String val=request.getParameter("booknum");// 예약 번호를 스트링으로 받음
		long cVal=Long.parseLong(val);//롱값으로 전환
		BookDAO dao=new BookDAO(); //dao 호출
		BookVO vo=dao.bookSelectByBookId(cVal);//vo에 넣음
		RoomDAO dao2=new RoomDAO();//룸 dao 호출
		RoomVO vo2=dao2.selectByRoomId(vo.getRoom_id());//vo2에 넣음
		request.setAttribute("bookinfo", vo);//값 저장
		request.setAttribute("bookinfo2", vo2);//값 저장
		
		RequestDispatcher rd=request.getRequestDispatcher("BookCheckResult.jsp");
		rd.forward(request, response);
	}

}
