package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil2 {

	//1.DB Driver, 연결 
	
	public static Connection getConnection() {
		Connection conn = null;
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userid="developer", password="1234";
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, userid, password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
//	public static Connection getConnection() {
//		Connection conn = null;
//		Context initContext;
//		try {
//			initContext = new InitialContext();
//			Context envContext  = (Context)initContext.lookup("java:/comp/env");
//			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
//			conn = ds.getConnection();
//		} catch (NamingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return conn;
//	}

	

	
	//2. 
	public static void dbClose(ResultSet rs, Statement st, Connection conn) {
		try {
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(conn!=null) conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}






