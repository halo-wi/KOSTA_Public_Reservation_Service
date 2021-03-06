package controller;

import java.io.IOException;
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
 * Servlet implementation class SearchServelet
 */
@WebServlet("/Room/searchall")
public class SearchAllServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAllServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RoomDAO dao=new RoomDAO();
		List<RoomVO> list=dao.selectAll();
	
		RoomVO vo=new RoomVO();
		request.setAttribute("roomall", list);
		RequestDispatcher rd=request.getRequestDispatcher("Room.jsp");
		rd.forward(request, response);
	}

	

}
