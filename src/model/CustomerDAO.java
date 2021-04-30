package model;

import java.sql.*;
import utility.*;

public class CustomerDAO {
	ResultSet rs = null;
	PreparedStatement ps = null;
	Connection conn = null;
	Statement st = null;

	public int customer_login(String customer_id, String customer_pw) {

		int result = 0;
		String sql = "select customer_pw from customer where customer_id = ?";
		conn = DBUtil.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, customer_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(customer_pw)) {
					result = 0;
				} else {
					System.out.println("비밀번호 오류");
					result = 1;
				}
			} else {
				System.out.println("ID가 존재하지 않습니다");
				result = 2;
			}
			DBUtil.dbClose(rs, ps, conn);
		} catch (SQLException e) {
			System.out.println("알 수 없는 오류 발생");
			result = 3;
		}
		return result;
	}
	public int customer_join(String customer_id, String customer_name, String customer_pw, String customer_phone, String email)
			throws SQLException {

		int result = 0;
		String sql = "insert into customer values(?, ?, ?, ?, ?)";
		conn = DBUtil.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.setString(2, customer_name);
		ps.setString(3, customer_pw);
		ps.setString(4, customer_phone);
		ps.setString(5, email);

		result = ps.executeUpdate();
		DBUtil.dbClose(null, ps, conn);
		return result;
	}
	public int customer_withdraw(String customer_id, String customer_pw) throws SQLException {
		int result = 0;
		String sql = "delete from customer where customer_id = ? and customer_pw = ?";
		conn = DBUtil.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(1, customer_id);
		ps.setString(2, customer_pw);
		result = ps.executeUpdate();
		DBUtil.dbClose(rs, ps, conn);
		return result;
	}
	public int customer_modify(String customer_id, String customer_name, String customer_pw, String customer_phone, String email)
			throws SQLException {
		int result = 0;

		String sql = "update customer " + " set customer_name = ?, customer_phone = ?, email = ?"
				+ " where customer_id = ? and customer_pw = ?";
		conn = DBUtil.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(4, customer_id);
		ps.setString(1, customer_name);
		ps.setString(5, customer_pw);
		ps.setString(2, customer_phone);
		ps.setString(3, email);

		result = ps.executeUpdate();
		System.out.println("dao="+result);
		DBUtil.dbClose(rs, ps, conn);
		return result;
	}
	public CustomerVO customer_searchById(String customer_id) throws SQLException {
		
		CustomerVO customer = null;
		String sql = "select * from customer where customer_id = ?";
		conn = DBUtil.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(1, customer_id);
		rs = ps.executeQuery();
		System.out.println("실행");
		while (rs.next()) {
			customer = new CustomerVO();
			customer.setCustomer_id(rs.getString(1));
			customer.setCustomer_name(rs.getString(2));
			customer.setCustomer_pw(rs.getString(3));
			customer.setCustomer_phone(rs.getString(4));
			customer.setEmail(rs.getString(5));
			System.out.println(customer);
		}
		DBUtil.dbClose(rs, ps, conn);
		return customer;
	}
	public CustomerVO customer_searchByEmail(String customer_id) throws SQLException {
		
		CustomerVO customer = new CustomerVO();
		String sql = "select * from customer where email = ?";
		conn = DBUtil.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(1, customer_id);
		rs = ps.executeQuery();
		while (rs.next()) {
			customer.setCustomer_id(rs.getString(1));
			customer.setCustomer_name(rs.getString(2));
			customer.setCustomer_pw(rs.getString(3));
			customer.setCustomer_phone(rs.getString(4));
			customer.setEmail(rs.getString(5));
		}
		DBUtil.dbClose(rs, ps, conn);
		return customer;
	}
	public CustomerVO customer_search_email(String email) throws SQLException {
		
		CustomerVO customer = new CustomerVO();
		String sql = "select * from customer where email = ?";
		conn = DBUtil.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(1, email);
		rs = ps.executeQuery();
		while (rs.next()) {
			customer.setCustomer_id(rs.getString(1));
			customer.setCustomer_name(rs.getString(2));
			customer.setCustomer_pw(rs.getString(3));
			customer.setCustomer_phone(rs.getString(4));
		}
		DBUtil.dbClose(rs, ps, conn);
		return customer;
	}
}
}
 public CustomerVO getCustomer(String customer_id, String customer_pw, String customer_name, String customer_phone, email){
	 return;

 CustomerVO customer = new CustomerVO(); 
	 connection conn = null;
	 PreparedStatement = null;
	 String SQL = "UPDATE CUSTOMER SET Customer_pw = ?, customer_name=?, customer_phone=?, email=? WHERE customer_id=?";
	 try {
	 	conn = dataSource.getConnection();
	 	ps.setString(4, customer_id);
		ps.setString(1, customer_name);
		ps.setString(5, customer_pw);
		ps.setString(2, customer_phone);
		ps.setString(3, email); 
		rs = ps.executeQuery();
		if(rs.next()) {
			customer.setcustomer_id(rs.getString("customer_id"));
			customer.setcustomer_name(rs.getString("customer_name"));
			customer.setcustomer_pw(rs.getString("customer_pw"));
			customer.setcustomer_phone(rs.getString("customer_phone"));
			customer.setcustomer_email(rs.getString("customer_email"));
			
		}
	 } catch(Exception e) {
	 	e.printStackTrace();
	 	} finally {
	 		try {
	 			if(rs != null) rs.close();
	 			if(ps!= null) ps.close();
	 			}catch (Exception e) {
	 				e.prinStackTrace();
	 				}
	 			}
	 			return customer;
	 		}
