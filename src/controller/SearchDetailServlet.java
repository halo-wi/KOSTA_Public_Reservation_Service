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
 * Servlet implementation class SearchDetailServlet
 */
@WebServlet("/Room/searchDetail")
public class SearchDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String val= request.getParameter("roomid");
		int room_id=Integer.parseInt(val);
		RoomDAO dao=new RoomDAO();
		RoomVO list=dao.selectByRoomId(room_id);
		request.setAttribute("mapx", request.getParameter("mapx"));
		request.setAttribute("mapy", request.getParameter("mapy"));
		request.setAttribute("adress", request.getParameter("adress"));
		RequestDispatcher rd=request.getRequestDispatcher("roomdetail.jsp");
		rd.forward(request, response);
	}


}
