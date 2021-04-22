package logic;

import java.util.*;
import model.*;

public class ReservationChk {
	static String start;
	static String end;
	static String begin;
	static String last;
	
	public List<Integer> reservationChk(int room_id, String book_date) {
		List<Integer> chkList = new ArrayList<>();
		BookDAO bookdao = new BookDAO();
		RoomDAO roomdao = new RoomDAO();
		start = roomdao.selectByRoomId(room_id).getRoom_start();
		end = roomdao.selectByRoomId(room_id).getRoom_end();
		int stime = Integer.parseInt(begin.substring(0, start.indexOf(":")));
		int etime = Integer.parseInt(last.substring(0, end.indexOf(":")));
		for(int i=stime; i<etime; i++) {
			begin = bookdao.bookSelectByBookId(room_id).getBook_begin();
			last = bookdao.bookSelectByBookId(room_id).getBook_last();
			int btime = Integer.parseInt(begin.substring(0, begin.indexOf(":")));
			int ltime = Integer.parseInt(last.substring(0, last.indexOf(":")));
			if(btime <= i && i < ltime) chkList.add(1);
			else chkList.add(0);
		}
		return chkList;
	}
}
