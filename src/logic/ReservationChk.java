package logic;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import model.BookDAO;
import model.BookVO;
import model.RoomDAO;


public class ReservationChk {
	static String start; // 회의실 시작시간
	static String end;// 회의실 종료시간
	static String begin;// 사용 시작시간
	static String last;// 사용종료시간

	public int[] reservationChk(int room_id, Date book_date) {
		// 지난 일자 예약 불가로 하기위해 현재 일자를 가져온다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH");
		Calendar cal = Calendar.getInstance ( );		
		String current_date = sdf.format(cal.getTime());
		int cut_current_date_hour = Integer.parseInt(current_date.substring(11,13)); // 현재 시각
		
		// 해당 회의실번호/날짜를 가진 예약들만 따로 리스트에 일단 select 저장
		BookDAO bookdao = new BookDAO();
		RoomDAO roomdao = new RoomDAO();
		DateCompare dateCompareTo = new DateCompare();

		List<BookVO> booklist = bookdao.bookSelectCustId(room_id, book_date);

		// 회의실의 예약가능 시작시간과 종료시간을 저장
		start = roomdao.selectByRoomId(room_id).getRoom_start(); 
		end = roomdao.selectByRoomId(room_id).getRoom_end();
		
		// 회의실의 예약가능 시작시간과 종료시간의 앞 숫자만 추출 후 int형으로 변환 ex) 9:00 -> 9
		int si1 = start.indexOf(":");
		int si2 = end.indexOf(":");
		int stime = Integer.parseInt(start.substring(0, si1));
		int etime = Integer.parseInt(end.substring(0, si2));

		// 종료시간에서 시작시간을 빼서 총 타임의 수를 계산
		int length = etime - stime;
		int idx = 0;
		int btime = 0;
		int ltime = 0;
		
		// 앞서 계산한 총 타임 수로 결과 값 넣을 배열 생성
		int[] tmp = new int[length];
		
		for (int i = stime; i < etime; i++) { // 9~18
			// 지난 일자는 모두 1로 변경
			if(dateCompareTo.year(book_date, current_date) || dateCompareTo.month(book_date, current_date) || dateCompareTo.date(book_date, current_date)) {
				tmp[idx] = 1; 
			} else {
				 //지난 시각은 모두 1로 변경
				if(dateCompareTo.same(book_date, current_date)) {
					if(i <= cut_current_date_hour) {
						tmp[idx] = 1;
					}					
				}
				for (int j = 0; j < booklist.size(); j++) {
					begin = booklist.get(j).getBook_begin();
					last = booklist.get(j).getBook_last();
					int tmp1 = begin.indexOf(":");
					int tmp2 = last.indexOf(":");
					btime = Integer.parseInt(begin.substring(0, tmp1));
					System.out.println("시작시간 : " + btime);
					ltime = Integer.parseInt(last.substring(0, tmp2));
					System.out.println("이용종료시간 : " + ltime);
					if (btime <= i && i < ltime) {
						tmp[idx] = 1; 
						System.out.println(idx + ": " + tmp[idx]);
					}
				}	
			}
			idx++;
		}
		return tmp;
	}

}