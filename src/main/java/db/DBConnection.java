package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public  static Connection getConection () {
		final String url = "jdbc:mysql://localhost:3306/shoes_shop_database";
		final String userName = "root";
		final String passwd = "dong14052004";

		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, userName, passwd);
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

}
