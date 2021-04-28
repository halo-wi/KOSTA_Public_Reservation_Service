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
 * Servlet implementation class SelectSearchServlet
 */
@WebServlet("/Search/searchall")
public class SelectSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String room_location = request.getParameter("room_location"); // searchall.jsp에서 보내준 지역구 값을 받아옴 
		String day = request.getParameter("day"); // searchall.jsp에서 보내준 day 값을 받아옴 
		String month = request.getParameter("month"); // searchall.jsp에서 보내준 month 값을 받아옴 
		String year = request.getParameter("year"); // searchall.jsp에서 보내준 month 값을 받아옴 
		int[] Arr;
		boolean today_state = false;
		String search_date = null;
		
		// 10보다 작은 숫자일 경우 YYYY-MM-DD포맷을 맞추기 위해 "0"+month를 해줌
		if(Integer.parseInt(month) < 10) {
			month = "0"+month;			
		}
		// 10보다 작은 숫자일 경우 YYYY-MM-DD포맷을 맞추기 위해 "0"+day를 해줌
		if(Integer.parseInt(day) < 10) {
			day = "0"+day;			
		}
		search_date = year+"-"+month+"-"+day;  // YYYY-MM-DD포맷
		
		// searchRoom.jsp에 날짜 값을 보내줌
		request.setAttribute("day", day);  
		request.setAttribute("month", month);
		request.setAttribute("year", year);
		request.setAttribute("search_date", search_date);
		
		RoomDAO roomDAO = new RoomDAO();
		ReservationChk chk = new ReservationChk();
		
		
		List<RoomVO> roomlist = roomDAO.selectByLocation(room_location); // 지역구 값에 해당하는 회의실 리스트를 가져옴
		for(RoomVO room:roomlist) {
			 // 선택한 지역구에 해당하는 회의실과 날짜에 예약이 다 찬 회의실이 있는지 없는지 확인
			Arr = chk.reservationChk(room.getRoom_id(), Date.valueOf(search_date)); // [0,0,0,1,1,0]와 같이 int 배열로 값이 온다.
			System.out.println(Arrays.toString(Arr));
			
			// 배열 안에 0(빈 시간)이 있으면 true를 return, 0이 없다면 default값인 false를 return
			for(int num:Arr) {
				if(num == 0) {
					today_state = true;
					break;
				}
			}
			// RoomVO의 today_state를 set해준다.
			room.setToday_state(today_state);
		}
		
		// 날짜를 선택한 회의실의 예약 가능 여부를 담은 roomlist를 searchRoom.jsp에 전달  
		request.setAttribute("room_list", roomlist);
		RequestDispatcher rd = request.getRequestDispatcher("searchRoom.jsp"); // 회의실 리스트를 searchRoom.jsp로 보내줌 
		rd.forward(request, response);
		
	}
}
