package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import bean.Order;
import bean.OrderDetailDto;
import bean.Product;
import db.DBConnection;

public class OrderDao {
	private Connection con = null;
	PreparedStatement pst = null;

	public int getTotalOrder() {
		con = DBConnection.getConection();
		String sql = "select count(*) FROM shoes_shop_database.orders";
		try {
			pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch (Exception e) {
			System.out.println(e);
			return 0;
		}
	}

	public List<Order> pagingOrder(int index, int amountOrder) {
		List<Order> list = new ArrayList<>();
		con = DBConnection.getConection();
		String sql = "SELECT o.*,us.name FROM shoes_shop_database.orders as o \r\n"
				+ "inner join shoes_shop_database.users as us \r\n" + "on us.id = o.user_id\r\n" + "ORDER BY o.id \r\n"
				+ "LIMIT ? OFFSET ?;";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, amountOrder);
			pst.setInt(2, (index - 1) * amountOrder);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(5), rs.getDate(3), rs.getDouble(4)));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public void createOrder(int userId, int cartId) {
		con = DBConnection.getConection();
		String sql = "insert into shoes_shop_database.orders (user_id, order_date , total_price) values (?,?,?)";
		try {
			// turn off auto commit
			con.setAutoCommit(false);
			pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pst.setInt(1, userId);
			java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
			pst.setDate(2, sqlDate);
			pst.setDouble(3, 0);

			int affectedRows = pst.executeUpdate(); // Execute the insert statement

			if (affectedRows > 0) {
				ResultSet generatedKeys = pst.getGeneratedKeys(); // Get the generated keys result set
				if (generatedKeys.next()) {
					int generatedOrderId = generatedKeys.getInt(1); // Get the first generated key (order ID)
					System.out.println("Generated order ID: " + generatedOrderId);
					// Do create order_détild
					addOrderDetail(con, generatedOrderId, cartId);
					// write data to database table
					con.commit();
				}
			} else {
				System.out.println("Failed to retrieve generated order ID.");
				// rollback when error
				con.rollback();
				throw new SQLException();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void addOrderDetail(Connection con, int orderId, int cartId) {

		// create sql order detail
		String sql = "insert into shoes_shop_database.order_details (order_id, product_id, quantity, price)\r\n"
				+ "select " + orderId + " , product_id, quantity, price\r\n"
				+ "from shoes_shop_database.cart_line where cart_id = ?;";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, cartId);
			// execute insert data
			pst.executeUpdate();

			// get total price detail sql order detail
			sql = "select o.id as id,sum(od.price) as total_Price from shoes_shop_database.orders as o \r\n"
					+ "inner join shoes_shop_database.order_details as od  on od.order_id = o. id\r\n"
					+ "  where o.id = ? ";

			pst = con.prepareStatement(sql);
			pst.setInt(1, orderId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				sql = "update shoes_shop_database.orders set total_price = ? where id = ?";
				pst = con.prepareStatement(sql);
				pst.setDouble(1, rs.getDouble(2));
				pst.setDouble(2, orderId);
				pst.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// chỉ sử dụng cho đơn hàng buy now
	public void addOrderNow(int userId, int pId, int quantity, double price) {
		con = DBConnection.getConection();

		String sql = "insert into shoes_shop_database.orders (user_id, order_date , total_price) values (?,?,?)";

		try {
			// turn off auto commit
			con.setAutoCommit(false);
			pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pst.setInt(1, userId);
			java.sql.Date sqlDate = new java.sql.Date(new Date().getTime());
			pst.setDate(2, sqlDate);
			pst.setDouble(3, 0);

			int affectedRows = pst.executeUpdate(); // Execute the insert statement

			if (affectedRows > 0) {
				ResultSet generatedKeys = pst.getGeneratedKeys(); // Get the generated keys result set
				if (generatedKeys.next()) {
					int generatedOrderId = generatedKeys.getInt(1); // Get the first generated key (order ID)
					System.out.println("Generated order ID: " + generatedOrderId);
					System.out.println(pId);
					System.out.println(quantity);
					System.out.println(price);
					// Do create order_détild
					sql = "insert into shoes_shop_database.order_details (order_id, product_id, quantity, price)"
							+ "values('" + generatedOrderId + "', ?, ? ,? )";

					pst = con.prepareStatement(sql);
					pst.setInt(1, pId);
					pst.setInt(2, quantity);
					pst.setDouble(3, price);
					pst.executeUpdate();

					sql = "update shoes_shop_database.orders set total_price = ? where id = ?";
					pst = con.prepareStatement(sql);
					pst.setDouble(1, price);
					pst.setInt(2, generatedOrderId);
					pst.executeUpdate();
				}
				// write data to database table
				con.commit();
			}

		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

	public List<Order> getAllOrder() {
		con = DBConnection.getConection();
		List<Order> list = new ArrayList<>();
		String sql = "SELECT o.*,us.name FROM shoes_shop_database.orders as o inner join shoes_shop_database.users as us  on us.id = o.user_id";
		try {
			pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(5), rs.getDate(3), rs.getDouble(4)));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public List<OrderDetailDto> getListOrderDetailById(int orderId) {
		con = DBConnection.getConection();
		List<OrderDetailDto> list = new ArrayList<>();
		String sql = "SELECT p.*, od.quantity, (od.quantity * p.price) as totalPrice \r\n"
				+ " FROM shoes_shop_database.order_details as od\r\n"
				+ "inner join shoes_shop_database.products as p\r\n" + "on p.id = od.product_id \r\n"
				+ " where order_id = ?  group by p.id";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, orderId);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new OrderDetailDto(rs.getString(2), rs.getString(5), rs.getInt(7), rs.getDouble(4),
						rs.getDouble(8)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}


}
