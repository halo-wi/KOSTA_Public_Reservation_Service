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

/**
 * Servlet implementation class BookListByIdServelet
 */
@WebServlet("/BookCheck/BookListByIdServelet")
public class BookListByIdServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		BookDAO bookDAO = new BookDAO();
		List<BookVO> booklist =  new ArrayList<BookVO>();
		CustomerDAO cDAO = new CustomerDAO();
		CustomerVO cVO = new CustomerVO();
		try {
			cVO = cDAO.customer_searchByEmail(email);
			booklist = bookDAO.bookSelectbyId(cVO.getCustomer_id());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", booklist);
		RequestDispatcher rd=request.getRequestDispatcher("../BookCheck/BookCheckResultList.jsp");
		rd.forward(request, response);
	}

	

}
