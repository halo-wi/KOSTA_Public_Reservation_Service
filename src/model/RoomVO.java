package model;



public class RoomVO {
 private int room_id;
 private String room_state;
 private String adress;
 private double mapx;
 private double mapy;
 private String room_location;
 private String img;
 private String phone;
 private String room_start;
 private String room_end;
 private int room_cancel;
public int getRoom_id() {
	return room_id;
}
public void setRoom_id(int room_id) {
	this.room_id = room_id;
}
public String getRoom_state() {
	return room_state;
}
public void setRoom_state(String room_state) {
	this.room_state = room_state;
}
public String getAdress() {
	return adress;
}
public void setAdress(String adress) {
	this.adress = adress;
}
public double getMapx() {
	return mapx;
}
public void setMapx(double mapx) {
	this.mapx = mapx;
}
public double getMapy() {
	return mapy;
}
public void setMapy(double mapy) {
	this.mapy = mapy;
}
public String getRoom_location() {
	return room_location;
}
public void setRoom_location(String room_location) {
	this.room_location = room_location;
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
public String getRoom_start() {
	return room_start;
}
public void setRoom_start(String room_start) {
	this.room_start = room_start;
}
public String getRoom_end() {
	return room_end;
}
public void setRoom_end(String room_end) {
	this.room_end = room_end;
}
public int getRoom_cancel() {
	return room_cancel;
}
public void setRoom_cancel(int room_cancel) {
	this.room_cancel = room_cancel;
}
public RoomVO(int room_id, String room_state, String adress, double mapx, double mapy, String room_location, String img,
		String phone, String room_start, String room_end, int room_cancel) {
	super();
	this.room_id = room_id;
	this.room_state = room_state;
	this.adress = adress;
	this.mapx = mapx;
	this.mapy = mapy;
	this.room_location = room_location;
	this.img = img;
	this.phone = phone;
	this.room_start = room_start;
	this.room_end = room_end;
	this.room_cancel = room_cancel;
}
public RoomVO() {
	super();
}
 
 
}
