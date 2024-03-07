package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Customer;
import db.DBConnection;

public class CustomerDao {
	private Connection con = null;
	PreparedStatement pst = null;

	public Customer login(String username, String password) {
		con = DBConnection.getConection();
		String sql = "select * from shoes_shop_database.users where name = ? and password = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public Customer getCustomerByName(String username) {
		con = DBConnection.getConection();
		String sql = "select * from shoes_shop_database.users where name = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public int getRoles(String username) {
		int number = 0;
		con = DBConnection.getConection();
		String sql = "select * from shoes_shop_database.users where name = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return number = rs.getInt(5);
			} else {
				return 0;
			}
		} catch (Exception e) {
			System.out.println(e);
			return 0;
		}
	}

	public void resgister(String username, String password, String email) {
		con = DBConnection.getConection();
		String sql = "insert into shoes_shop_database.users ( name, password , email, role_id ) values (?,?,?,2)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			pst.setString(3, email);
			pst.executeUpdate();

			Customer cus = new CustomerDao().getCustomerByName(username);
			
			sql = "insert into  shoes_shop_database.shopping_cart (user_id) values (?)";
			pst = con.prepareStatement(sql);
			pst.setInt(1, cus.getcId());
			pst.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public static void main(String[] args) {
	new CustomerDao().login("linh", "123");
	}
}
