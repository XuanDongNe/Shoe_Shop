package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBConnection;

public class AdminDao {
	public boolean login(String username, String password) {
		Connection con = DBConnection.getConection();
		String sql = "select * from shoes_shop.admin where ad_name = ? and ad_password = ?";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				pst.close();
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}
}
