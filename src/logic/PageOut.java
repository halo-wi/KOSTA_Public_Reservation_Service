package logic;

import java.sql.SQLException;

import model.RoomDAO;

public class PageOut {
	public PageOut() {
	}
	
	//html에서 페이지 넘버를 받아오면 그 숫자로 페이지에 띄울 row_num을 리턴
	int firstrow(int pageNumber) {
		return pageNumber*10-9;
	}
	int lastrow(int pageNumber) {
		return pageNumber*10;
	}
	// 페이지수 
	int pagecount() throws SQLException {
		RoomDAO dao = new RoomDAO();
		return dao.MaxRow();
	}
}
