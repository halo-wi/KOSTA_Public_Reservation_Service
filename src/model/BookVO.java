package model;

import java.sql.Date;

public class BookVO {
	private long book_id;
	private int room_id;
	private String customer_id;
	private String book_begin;
	private String book_last;
	private Date book_date;
	private String adress;
	private int room_cancel;
	private String img;
	private String phone;
	public int getRoom_cancel() {
		return room_cancel;
	}
	public void setRoom_cancel(int room_cancel) {
		this.room_cancel = room_cancel;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public long getBook_id() {
		return book_id;
	}
	public void setBook_id(long book_id) {
		this.book_id = book_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getBook_begin() {
		return book_begin;
	}
	public void setBook_begin(String book_begin) {
		this.book_begin = book_begin;
	}
	public String getBook_last() {
		return book_last;
	}
	public void setBook_last(String book_last) {
		this.book_last = book_last;
	}
	public Date getBook_date() {
		return book_date;
	}
	public void setBook_date(Date book_date) {
		this.book_date = book_date;
	}
	public BookVO(long book_id, int room_id, String customer_id, String book_begin, String book_last, Date book_date) {
		super();
		this.book_id = book_id;
		this.room_id = room_id;
		this.customer_id = customer_id;
		this.book_begin = book_begin;
		this.book_last = book_last;
		this.book_date = book_date;
	}
	public BookVO() {
		super();
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("book_id=").append(book_id).append(", room_id=").append(room_id).append(", customer_id=")
				.append(customer_id).append(", book_begin=").append(book_begin).append(", book_last=").append(book_last)
				.append(", book_date=").append(book_date).append("\n");
		return builder.toString();
	}

	
}

