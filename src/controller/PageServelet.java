package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RoomDAO;
import model.RoomVO;

/**
 * Servlet implementation class PageServelet
 */
@WebServlet("/PageServelet")
public class PageServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public PageServelet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RoomDAO dao=new RoomDAO();
		List<RoomVO> list = null;
		try {
			list = dao.selectPage(21,30);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		request.setAttribute("roomall", list);
		RequestDispatcher rd=request.getRequestDispatcher("Room/Room.jsp");
		rd.forward(request, response);
	
	}



}
