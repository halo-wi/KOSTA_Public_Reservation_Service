package controller;

import java.io.IOException;
import java.util.Arrays;
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
 * Servlet implementation class SelectSearch
 */
@WebServlet("/Search/roomlocation")
public class SelectLocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RoomDAO roomDAO = new RoomDAO();
		
		List<String> room_location_list = roomDAO.selectForSearch(); // 지역구 리스트를 가져옴
	
		request.setAttribute("room_location_list", room_location_list);
		RequestDispatcher rd = request.getRequestDispatcher("searchall.jsp"); // 가져온 지역구 리스트를 searchall.jsp에 전달
		rd.forward(request, response);

	}
}
