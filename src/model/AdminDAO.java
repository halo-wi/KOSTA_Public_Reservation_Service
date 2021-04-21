package model;

import java.sql.*;

public class AdminDAO {
	public int ad_delete(admin_id, ) throws SQLException {
		int result = 0;
		System.out.print("삭제할 ID 입력 : ");
		String id = sc.next();
		System.out.print("비밀번호 입력 : ");
		String pw = sc.next();
		int i = ad_login(id, pw);
		
		if (i != 1) return 0;

		String sql = "delete from admins where ad_id = ?";
		conn = Util.getConnection();
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		
		result=ps.executeUpdate();
		Util.dbClose(rs, ps, conn);
		return result;	

	}
}
