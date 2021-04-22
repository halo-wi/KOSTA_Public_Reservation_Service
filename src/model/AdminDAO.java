package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import utility.DBUtil;

public class AdminDAO {
	ResultSet rs = null;
	PreparedStatement ps = null;
	Connection conn = null;
	Statement st = null;
	
	public int ad_delete(String admin_id, String admin_pw) throws SQLException {
		int result = 0;
		String sql = "delete from sysop where admin_id = ? and admin_pw = ?";
		conn = DBUtil.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(1, admin_id);
		ps.setString(2, admin_pw);
		result=ps.executeUpdate();
		DBUtil.dbClose(rs, ps, conn);
		return result;	
	}	
	public int ad_login(String admin_id, String admin_pw) {

		int result = 0;

		String sql = "select admin_pw from sysop where admin_id = ?";

		conn = DBUtil.getConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, admin_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(admin_pw)) {
					result = 1;
				} else {
					System.out.println("비밀번호 오류");
					result = 0;
				}
			} else {
				System.out.println("ID가 존재하지 않습니다");
				result = 0;
			}

			DBUtil.dbClose(rs, ps, conn);
		} catch (SQLException e) {
			System.out.println("알 수 없는 오류 발생");
			result = 0;
		}
		return result;
	}
	public int ad_insert(String admin_id, String admin_pw) throws SQLException {
		  
		  int result = 0; 
		  String sql = "insert into sysop values(?,?)"; 
		  conn = DBUtil.getConnection(); 
		  ps = conn.prepareStatement(sql); 
		  ps.setString(1, admin_id); 
		  ps.setString(2, admin_pw);
		 
		  result = ps.executeUpdate();
		  DBUtil.dbClose(null, ps, conn);
		  return result;
		  }
}
