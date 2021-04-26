package logic;

import java.sql.Date;
import java.util.*;
import model.*;

public class ReservationChk {
	static String start; // 회의실 시작시간
	static String end;// 회의실 종료시간
	static String begin;// 사용 시작시간
	static String last;// 사용종료시간

	public int[] reservationChk(int room_id, Date book_date) {
		// 해당 회의실번호/날짜를 가진 예약들만 따로 리스트에 일단 select 저장

		List<Integer> chkList = new ArrayList<>();

		BookDAO bookdao = new BookDAO();
		RoomDAO roomdao = new RoomDAO();

		List<BookVO> booklist = bookdao.bookSelectCustId(room_id, book_date);

		start = roomdao.selectByRoomId(room_id).getRoom_start();
		end = roomdao.selectByRoomId(room_id).getRoom_end();

		int si1 = start.indexOf(":");
		int si2 = end.indexOf(":");

		int stime = Integer.parseInt(start.substring(0, si1));
		int etime = Integer.parseInt(end.substring(0, si2));

		int length = etime - stime;
		int idx = 0;
		int btime = 0;
		int ltime = 0;
		int[] tmp = new int[length];

		for (int i = stime; i < etime; i++) {// 9~18
			for (int j = 0; j < booklist.size(); j++) {
				begin = booklist.get(j).getBook_begin();
				last = booklist.get(j).getBook_last();
				int tmp1 = begin.indexOf(":");
				int tmp2 = last.indexOf(":");
				btime = Integer.parseInt(begin.substring(0, tmp1));
				System.out.println("시작시간 : " + btime);
				ltime = Integer.parseInt(last.substring(0, tmp2));
				System.out.println("이용종료시간 : " + ltime);
				if (btime <= i && i <= ltime) {
					tmp[idx] = 1;

					System.out.println(idx + ": " + tmp[idx]);
				}
			}
			idx++;
		}
		return tmp;
	}

}