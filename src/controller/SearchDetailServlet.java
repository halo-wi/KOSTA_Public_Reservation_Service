package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.ReservationChk;
import model.RoomDAO;
import model.RoomVO;

/**
 * Servlet implementation class SearchDetailServlet
 */
@WebServlet("/Search/searchDetail")
public class SearchDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String val= request.getParameter("roomid");
		String search_date = request.getParameter("search_date");
		String full_room_start = request.getParameter("room_start");
		String full_room_end = request.getParameter("room_end");
		int cut_room_start= Integer.parseInt(full_room_start.substring(0,full_room_start.indexOf(":")));
		int cut_room_end= Integer.parseInt(full_room_end.substring(0,full_room_end.indexOf(":")));
		int room_id=Integer.parseInt(val);
		int[] state_arr;
		
		RoomDAO dao=new RoomDAO();
		RoomVO list=dao.selectByRoomId(room_id);

		ReservationChk chk = new ReservationChk();
		// 선택한 지역구에 해당하는 회의실과 날짜에 예약이 다 찬 회의실이 있는지 없는지 확인
		state_arr = chk.reservationChk(room_id, Date.valueOf(search_date)); // [0,0,0,1,1,0]와 같이 int 배열로 값이 온다.
		System.out.println(Arrays.toString(state_arr));
		
		String[] time_arr = new String[state_arr.length];
		int[] time_arr_num = new int[state_arr.length];
		for(int i=0; i<cut_room_end-cut_room_start; i++) {
			time_arr[i] = cut_room_start+i + ":00";
			time_arr_num[i] = cut_room_start+i;
		}

		request.setAttribute("state_arr", state_arr);
		request.setAttribute("time_arr", time_arr);
		request.setAttribute("time_arr_num", time_arr_num);
		request.setAttribute("mapx", request.getParameter("mapx"));
		request.setAttribute("mapy", request.getParameter("mapy"));
		request.setAttribute("adress", request.getParameter("adress"));
		request.setAttribute("search_date", search_date);
		request.setAttribute("cut_room_end", cut_room_end);
		request.setAttribute("list", list);
		

		RequestDispatcher rd=request.getRequestDispatcher("../Room/roomdetail.jsp");
		rd.forward(request, response);
	}


}
