package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Category;
import bean.Product;
import db.DBConnection;

public class CategoryDao {
	private Connection con = null;
	private PreparedStatement pst = null;

	public List<Category> getAllCategory() {
		List<Category> list = new ArrayList();
		con = DBConnection.getConection();
		String sql = "select * from shoes_shop_database.categories";
		try {
			pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Category c = new Category(rs.getInt(1), rs.getString(2));
				list.add(c);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public Category getNameCategory(String name) {
		con = DBConnection.getConection();
		String sql = "select c.* from shoes_shop_database.products as p \r\n"
				+ " inner join shoes_shop_database.categories as c \r\n" + " on p.category_id = c.id \r\n"
				+ "where p.name = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, name );
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				Category c = new Category(rs.getInt(1), rs.getString(2));
				return c;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public void addCategory(String name) {
		con = DBConnection.getConection();
		String sql = "insert into shoes_shop_database.categories (name) values (?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, name);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public static void main(String[] args) {
		System.out.println(new CategoryDao().getNameCategory("Air Jordan 1 Low SE"));
	}

}
