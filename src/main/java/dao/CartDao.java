package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.CartLine;
import bean.OrderDetailDto;
import bean.Product;
import bean.ShoppingCart;
import db.DBConnection;

public class CartDao {
	Connection con = null;
	PreparedStatement pst = null;

	public int totalQuantityInCart(int id) {
		int total = 0;
		con = DBConnection.getConection();
		String sql = "select sum(quantity) from shoes_shop_database.cart_line where cart_id =?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return total = rs.getInt(1);
			} else {
				return 0;
			}
		} catch (Exception e) {
			System.out.println(e);
			return 0;
		}

	}

	public List<CartLine> getAllProductInCart(int id) {
		List<CartLine> list = new ArrayList<>();
		con = DBConnection.getConection();
		String sql = "select c.id , p.*, SUM(c.quantity) as total_quantity, Sum(p.price) as price, (c.quantity * p.price) \r\n"
				+ "				from shoes_shop_database.cart_line as c inner join shoes_shop_database.products as p \r\n"
				+ "				on p.id = c.product_id where cart_id = ?  group by p.id ;";

		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				CartLine c = new CartLine(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(6), rs.getDouble(5),
						rs.getInt(8), rs.getDouble(10));
				list.add(c);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public void updateCart(int quantity, int productId, int cart_id) {
		List<CartLine> list = getAllProductInCart(cart_id);
		con = DBConnection.getConection();
		String sql = "update shoes_shop_database.cart_line set quantity = ?  where product_id = ? and cart_id = ?";
		for (CartLine cartLine : list) {
			if (cartLine.getProduct_id() == productId) {
				PreparedStatement pst;
				try {
					pst = con.prepareStatement(sql);
					pst.setInt(1, quantity);
					pst.setInt(2, productId);
					pst.setInt(3, cart_id);
					pst.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}
		}

	}

	public ShoppingCart getCartById(int id) {
		con = DBConnection.getConection();
		String sql = "SELECT * FROM shoes_shop_database.shopping_cart where user_id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return new ShoppingCart(rs.getInt(1), rs.getInt(2));
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public void addItemToCart(int cart_id, int pid, int quantity, int price) {
		con = DBConnection.getConection();
		String sql = "select * from shoes_shop_database.cart_line where cart_id = ? and product_id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cart_id);
			pst.setInt(2, pid);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				updateCart(quantity + rs.getInt(4), pid, cart_id);
			} else {
				sql = "insert into shoes_shop_database.cart_line (cart_id , product_id, quantity, price) values (?,?,?,?)";
				pst = con.prepareStatement(sql);
				pst.setInt(1, cart_id);
				pst.setInt(2, pid);
				pst.setInt(3, quantity);
				pst.setInt(4, price);
				pst.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void removeAll(int id) {
		con = DBConnection.getConection();
		String sql = "delete from shoes_shop_database.cart_line where cart_id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void main(String[] args) {
		new CartDao().removeAll(1);
	}
}
