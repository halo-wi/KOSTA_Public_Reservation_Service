package model;


public class CustomerVO {
	String customer_id;
	String customer_name;
	String customer_pw;
	String customer_phone;
	String email;
	public CustomerVO(String customer_id, String customer_name, String customer_pw, String customer_phone, String email) {
		super();
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.customer_pw = customer_pw;
		this.customer_phone = customer_phone;
	}
	public CustomerVO() {
		super();
	}
	
	public CustomerVO(String customer_id, String customer_pw) {
		super();
		this.customer_id = customer_id;
		this.customer_pw = customer_pw;
	}
	
	public CustomerVO(String customer_id) {
		super();
		this.customer_id = customer_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_pw() {
		return customer_pw;
	}
	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CustomerVO [customer_id=").append(customer_id).append(", customer_name=").append(customer_name)
				.append(", customer_pw=").append(customer_pw).append(", customer_phone=").append(customer_phone)
				.append(", email=").append(email).append("]");
		return builder.toString();
	}
}
