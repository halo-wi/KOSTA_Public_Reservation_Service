package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookDAO;

/**
 * Servlet implementation class DeleteServelet
 */
@WebServlet("/BookCheck/DeleteServelet")
public class DeleteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookid = request.getParameter("bookid");
		BookDAO bookdao = new BookDAO();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int delet = 0;
		try {
			delet = bookdao.deleteBook(Long.parseLong(bookid));
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			throw new ServletException(e.getMessage());
		}
		if(delet!=0) {
		out.println("<script>");
		out.println("alert('예약을 삭제했습니다.');");
		out.println("</script>");
		response.setHeader("refresh", "1;url=../Home/home.jsp");
		}
	}
}
