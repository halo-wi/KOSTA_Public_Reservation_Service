package controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class ReservLookServlet
 */
@WebServlet("/ReservLookServlet")
public class ReservLookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String val= request.getParameter("book_id");//값 받음
		long val2=Long.parseLong(val);//long으로 전환
		BookDAO dao=new BookDAO();//book dao 받음
		BookVO vo=dao.bookSelectByBookId(val2);//book id 검색
		RoomDAO dao2=new RoomDAO();//리스트용 room dao 출력
		RoomVO vo2=dao2.selectByRoomId(vo.getRoom_id());
	request.setAttribute("chk", vo);//book 값 저장
	request.setAttribute("chk2", vo2);//Room 값 저장
	RequestDispatcher rd=request.getRequestDispatcher("../View/ReservLook.jsp");//jsp로 보냄
		rd.forward(request, response);
	}

}
