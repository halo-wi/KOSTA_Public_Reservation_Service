 package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet("/Search/searchall2")
public class SelectSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String room_location = request.getParameter("room_location"); // searchall.jsp에서 보내준 지역구 값을 받아옴 
		String day = request.getParameter("day"); // searchall.jsp에서 보내준 day 값을 받아옴 
		String month = request.getParameter("month"); // searchall.jsp에서 보내준 month 값을 받아옴 
		String year = request.getParameter("year"); // searchall.jsp에서 보내준 month 값을 받아옴 
		int page_num = Integer.parseInt(request.getParameter("page_num"));
		int row = 0;
		int searchRow = 0;
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
		
		List<RoomVO> roomlist = new ArrayList<RoomVO>();
		
		if(room_location.equals("전체지역")) {
			try {
				roomlist = roomDAO.selectPage(page_num*10-9,page_num*10);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 지역구 값에 해당하는 회의실 리스트를 가져옴
			for(RoomVO room:roomlist) {
				// 선택한 지역구에 해당하는 회의실과 날짜에 예약이 다 찬 회의실이 있는지 없는지 확인
				Arr = chk.reservationChk(room.getRoom_id(), Date.valueOf(search_date)); // [0,0,0,1,1,0]와 같이 int 배열로 값이 온다.
				System.out.println(Arrays.toString(Arr));
				
				// 배열 안에 0(빈 시간)이 있으면 true를 return, 0이 없다면 default값인 false를 return
				for(int num:Arr) {
					if(num == 0) {
						today_state = true;
						break;
					} else {
						today_state = false;
					}
				}
				// RoomVO의 today_state를 set해준다.
				System.out.println(today_state);
				room.setToday_state(today_state);
			}
			try {
				row = roomDAO.MaxRow();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {			
			roomlist = roomDAO.selectPageByLocation(room_location, page_num*10-9,page_num*10); // 지역구 값에 해당하는 회의실 리스트를 가져옴
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
				System.out.println(today_state);
				room.setToday_state(today_state);
			}
			try {
				row = roomDAO.locationRow(room_location);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		searchRow = row/10; // 10개씩 page분할
		int[] Arr2;
		
		System.out.println("page1 : " + searchRow);
		if((row%10) < 10 && (row%10) > 0) {
			searchRow += 1;
		}
		
		if(searchRow == 0) {
			Arr2 = new int[1];

		} else {
			Arr2 = new int[searchRow];						
		}
		
		System.out.println("page2 : " + searchRow);
	
		for(int i=0; i<searchRow; i++) {
			Arr2[i] = i+1;
			System.out.println(Arr2[i]);
		}			
		
		// 지역구 searchRoom.jsp에 전달
		request.setAttribute("room_location", room_location);
		// page 수를 저장한 배열을 전달
		request.setAttribute("pages", Arr2);
		request.setAttribute("searchRow", searchRow);		
		// 날짜를 선택한 회의실의 예약 가능 여부를 담은 roomlist를 searchRoom.jsp에 전달  
		request.setAttribute("room_list", roomlist);
		RequestDispatcher rd = request.getRequestDispatcher("searchRoom.jsp"); // 회의실 리스트를 searchRoom.jsp로 보내줌 
		rd.forward(request, response);
		
	}
}
