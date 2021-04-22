package controller;


import java.sql.Date;
import java.util.Scanner;

import model.BookDAO;
import model.BookVO;

public class LogicTest {
	static BookDAO bookDAO = new BookDAO();
	static BookVO bookVO = new BookVO();
	
	public static void main(String[] args) {
		// LogicTest용 컨트롤러
		Scanner sc = new Scanner(System.in);
		boolean run = true;
		
		while(run) {
			System.out.println("=====================================================================");
			System.out.println("1.예약전체조회 | 2.예약아이디조회 | 3.예약번호조회 | 4.예약하기 | 5.예약삭제 | 9.END");
			System.out.println("=====================================================================");
			int num = sc.nextInt();
			switch(num) {
				case 1:
					bookSelectAll();
					break;
				case 2:
					bookSelectCustId("user1");
					break;
				case 3:
					bookSelectByBookId(123);
					break;
				case 4:
					insertBook();
					break;
				case 5:
					deleteEmp("user1", 0);
					break;
				case 9:
					run = false;
			}
		}
		
	}
	
	public static void bookSelectAll() {
		System.out.println(bookDAO.bookSelectAll());
	}
	
	public static void bookSelectCustId(String customer_id) {
		System.out.println(bookDAO.bookSelectCustId(customer_id));
	}
	
	public static void bookSelectByBookId(int book_id) {
		System.out.println(bookDAO.bookSelectByBookId(book_id));
	}
	
	public static void insertBook() {
		bookVO.setBook_id(0);
		bookVO.setRoom_id(1001);
		bookVO.setCustomer_id("user1");
		bookVO.setBook_begin("12:00");
		bookVO.setBook_last("13:00");
		bookVO.setBook_date(Date.valueOf("2021-04-22"));
		
		int res = bookDAO.insertBook(bookVO);
		if(res > 0) {
			System.out.println("예약되었습니다.");
		} else {
			System.out.println("예약실패");		
		}
	}
	
	public static void deleteEmp(String customer_id, int book_id) {
		int res = bookDAO.deleteEmp(customer_id, book_id);
		if(res > 0) {
			System.out.println("삭제되었습니다.");
		}
	}

	

}
