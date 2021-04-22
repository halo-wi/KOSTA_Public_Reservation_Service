package controller;

import java.sql.SQLException;
import model.CustomerDAO;

public class LogicTest {

	public static void main(String[] args) throws SQLException {
		CustomerDAO dao = new CustomerDAO();
		System.out.println(dao.customer_join("sd", "df", "tgh", "sd"));
	}
}