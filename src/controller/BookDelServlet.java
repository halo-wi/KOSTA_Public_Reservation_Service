package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDAO;


/**
 * Servlet implementation class BookDelServlet
 */
@WebServlet("/Search/BookCan")
public class BookDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String val=request.getParameter("book_id");//book_id로 들어옴
		int CVal=Integer.parseInt(val);//값 변환
		BookDAO dao=new BookDAO();//dao 획득
		int vo=dao.deleteBook(CVal);//삭제
		request.setAttribute("message", vo);//메세지 전달
		RequestDispatcher rd=request.getRequestDispatcher("DelResult.jsp");//전송
		rd.forward(request, response);
	}

}
