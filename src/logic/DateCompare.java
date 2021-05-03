package logic;

import java.sql.Date;

public class DateCompare {
	
	// 선택한 날짜의 year보다 현재 year가 더 크면 true
	public boolean year(Date book_date, String current_date) {
		int cut_book_date_year = Integer.parseInt(String.valueOf(book_date).substring(0,4));
		int cut_current_date_year = Integer.parseInt(current_date.substring(0,4));
		
		if(cut_book_date_year < cut_current_date_year) {
			return true;
		}
		return false;	
	}
	
	// 선택한 날짜의 month보다 현재 month가 더 크면 true
	public boolean month(Date book_date, String current_date) {
		
		int cut_book_date_month = Integer.parseInt(String.valueOf(book_date).substring(5,7));
		int cut_current_date_month = Integer.parseInt(current_date.substring(5,7));
		
		if(cut_book_date_month < cut_current_date_month) {
			return true;
		}
		return false;	
	}
	
	// 선택한 날짜의 date보다 현재 date가 더 크면 true
	public boolean date(Date book_date, String current_date) {
		
		int cut_book_date_month = Integer.parseInt(String.valueOf(book_date).substring(8,10));
		int cut_current_date_month = Integer.parseInt(current_date.substring(8,10));
		
		if(cut_book_date_month < cut_current_date_month) {
			return true;
		}
		return false;	
	}
	// 선택한 날짜의 date와 현재 date가 같으면 true
	public boolean same(Date book_date, String current_date) {
		
		String cut_book_date = String.valueOf(book_date).substring(0,10);
		String cut_current_date = current_date.substring(0,10);
				
		if(cut_book_date.equals(cut_current_date)) {
			return true;
		}
		return false;	
	}
}
