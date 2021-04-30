package model;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import logic.*;
import utility.*;

public class BookDAO {
	
	// 예약리스트 전체 조회 
	public List<BookVO> bookSelectAll() {
		List<BookVO> booklist = new ArrayList<BookVO>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from book";
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				booklist.add(makeBook(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return booklist;
	}
	
	// room_id, book_date 입력받아서 예약 조회
		public List<BookVO> bookSelectCustId(int room_id, Date book_date) {
			List<BookVO> booklist = new ArrayList<BookVO>();
			Connection conn = DBUtil.getConnection();
			PreparedStatement st = null;
			ResultSet rs = null;
			String sql = "select * from book where room_id = ? and book_date = ?";
			try {
				st = conn.prepareStatement(sql);
				st.setInt(1, room_id);
				st.setDate(2, book_date);
				rs = st.executeQuery();
				
				while(rs.next()) {
					booklist.add(makeBook(rs));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, st, conn);
			}
			return booklist;
		}
	
	// customer_id 입력받아서 예약리스트 조회
	public List<BookVO> bookSelectCustId(String customer_id) {
		List<BookVO> booklist = new ArrayList<BookVO>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from book where customer_id = ?";
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, customer_id);
			rs = st.executeQuery();
			
			while(rs.next()) {
				booklist.add(makeBook(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return booklist;
	}

	private BookVO makeBook(ResultSet rs) throws SQLException {
		BookVO book = new BookVO();
		
		book.setBook_id(rs.getLong("book_id"));
		book.setRoom_id(rs.getInt("room_id"));
		book.setCustomer_id(rs.getString("customer_id"));
		book.setBook_begin(rs.getString("book_begin"));
		book.setBook_last(rs.getString("book_last"));
		book.setBook_date(rs.getDate("book_date"));
		
		return book;
	}
	
	// book_id 입력받아서 예약 조회
	public BookVO bookSelectByBookId(long book_id) {
			
		BookVO book = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from book where book_id = ?";
		try {
			st = conn.prepareStatement(sql);
			st.setLong(1, book_id);
			rs = st.executeQuery();
			
			while(rs.next()) {
				book = makeBook(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return book;
	}
	
	// book 입력받아서 예약 테이블에 추가
	public int insertBook(BookVO book) {
		BookId bookId = new BookId();
		int result = 0; // insert된 건 수
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		String sql = "insert into book values(?,?,?,?,?,?)";
		try {
			st = conn.prepareStatement(sql);
			st.setLong(1, Long.parseLong(bookId.getBookId()));
			st.setInt(2, book.getRoom_id());
			st.setString(3, book.getCustomer_id());
			st.setString(4, book.getBook_begin());
			st.setString(5, book.getBook_last());
			st.setDate(6, book.getBook_date());
			
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}
	
	// customer_id와 book_id 입력받아서 예약 테이블에서
	public int deleteEmp(String customer_id ,long book_id) {
		int result = 0;
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = null;
		String sql = "delete from book where customer_id=? and book_id=?"; 
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, customer_id);
			pst.setLong(2, book_id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, pst, conn);
		}
		return result;
	}
	
	//예약정보수정

	public int Book_modify(String customer_id,  String room_id, long book_begin, String book_last, String search_date)
	   {
		int result = 0;
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement pst = null;
		
		String sql = "update book " + " set customer_id=?, room_id=?, book_begin=? "
		+ "where book_last=? and search_date=?";
		
	
		
		
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setLong(3, book_begin);
			
			pst.setString(4, book_last);
			pst.setString(2, room_id);
			pst.setString(1, customer_id);
			pst.setString(5, search_date);
			

			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		DBUtil.dbClose(null, pst, conn);

		return result;
	}
	
}
