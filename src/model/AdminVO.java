package model;

public class AdminVO {
	String admin_id; 
	String admin_pw;
	public AdminVO(String admin_id, String admin_pw) {
		super();
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
	}
	public AdminVO() {
		super();
	}
	
	public AdminVO(String admin_id) {
		super();
		this.admin_id = admin_id;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AdimnVO [admin_id=").append(admin_id).append(", admin_pw=").append(admin_pw).append("]");
		return builder.toString();
	} 
}
