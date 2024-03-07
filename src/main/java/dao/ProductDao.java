package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Product;
import db.DBConnection;

public class ProductDao {
	private Connection con = null;
	private PreparedStatement pst = null;

	// phương thức sử dụng cho allProduct
	public int getTotalProduct(String priceFromRaw, String priceToRaw) {
		con = DBConnection.getConection();
		String sql = "";
		try {
			if (priceFromRaw == null && priceToRaw == null) {
				sql = "select count(*) FROM shoes_shop_database.products";
				pst = con.prepareStatement(sql);
			} else {
				double priceFrom = Double.parseDouble(priceFromRaw);
				double priceTo = Double.parseDouble(priceToRaw);
				sql = "select count(*) FROM shoes_shop_database.products  where  (price >=? and price <= ?) ";
				pst = con.prepareStatement(sql);
				pst.setDouble(1, priceFrom);
				pst.setDouble(2, priceTo);
			}
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

	// phương thức sử dụng cho product khi lọc bằng category
	public int getTotalProductByCategory(int categoryId, String priceFromRaw, String priceToRaw) {
		con = DBConnection.getConection();
		String sql = "";
		try {
			if (priceFromRaw == null && priceToRaw == null) {
				sql = "	select count(*) FROM shoes_shop_database.products where category_id = ?";
				pst = con.prepareStatement(sql);
				pst.setInt(1, categoryId);
			} else {
				double priceFrom = Double.parseDouble(priceFromRaw);
				double priceTo = Double.parseDouble(priceToRaw);
				sql = "select count(*) FROM shoes_shop_database.products where  (price >=? and price <= ?) and category_id =?;";
				pst = con.prepareStatement(sql);
				pst.setDouble(1, priceFrom);
				pst.setDouble(2, priceTo);
				pst.setInt(3, categoryId);
			}

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

	public int getTotalProductBySearch(String search) {
		con = DBConnection.getConection();
		String sql = " select count(*) from shoes_shop_database.products where name like ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, "%" + search + "%");
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

	public List<Product> pagingProduct(int index, int amountProduct, String priceFromRaw, String priceToRaw) {
		List<Product> list = new ArrayList<>();
		con = DBConnection.getConection();
		String sql = "";
		try {
			if (priceFromRaw == null && priceToRaw == null) {
				sql = "SELECT * FROM shoes_shop_database.products\r\n" + "ORDER BY id \r\n" + "LIMIT ? OFFSET ?";
				pst = con.prepareStatement(sql);
				pst.setInt(1, amountProduct);
				pst.setInt(2, (index - 1) * amountProduct);
			} else {
				sql = "SELECT * FROM shoes_shop_database.products  where  (price >=? and price <= ?) \r\n"
						+ "ORDER BY id \r\n" + "LIMIT ? OFFSET ?";
				double priceFrom = Double.parseDouble(priceFromRaw);
				double priceTo = Double.parseDouble(priceToRaw);
				pst = con.prepareStatement(sql);
				pst.setDouble(1, priceFrom);
				pst.setDouble(2, priceTo);
				pst.setInt(3, amountProduct);
				pst.setInt(4, (index - 1) * amountProduct);
			}

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getString(5), rs.getString(6));
				list.add(p);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public List<Product> getAllProduct() {
		List<Product> list = new ArrayList();
		con = DBConnection.getConection();
		String sql = "SELECT * FROM shoes_shop_database.products";
		try {
			pst = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getString(5), rs.getString(6));
				list.add(p);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public List<Product> getAllProductByCid(int cid, int index, int amountProduct, String priceFromRaw,
			String priceToRaw) {
		List<Product> list = new ArrayList();
		con = DBConnection.getConection();
		String sql = "";
		try {
			if (priceFromRaw == null && priceToRaw == null) {
				sql = "select * from shoes_shop_database.products where category_id = ? ORDER BY id LIMIT ? OFFSET ? ";
				pst = con.prepareStatement(sql);
				pst.setInt(1, cid);
				pst.setInt(2, amountProduct);
				pst.setInt(3, (index - 1) * amountProduct);
			} else {
				sql = "select * from shoes_shop_database.products where (price >=? and price <= ?) and category_id = ?  ORDER BY id LIMIT ? OFFSET ? ";
				double priceFrom = Double.parseDouble(priceFromRaw);
				double priceTo = Double.parseDouble(priceToRaw);
				pst = con.prepareStatement(sql);
				pst.setDouble(1, priceFrom);
				pst.setDouble(2, priceTo);
				pst.setInt(3, cid);
				pst.setInt(4, amountProduct);
				pst.setInt(5, (index - 1) * amountProduct);
			}

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getString(5), rs.getString(6));
				list.add(p);
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return list;
	}

	public Product getProductByCid(int pid) {
		con = DBConnection.getConection();
		String sql = "select * from shoes_shop_database.products where id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getString(5), rs.getString(6));
				return p;
			} else {
				System.out.println("false");
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public void deleteProductInCart(int id) {
		con = DBConnection.getConection();
		String sql = "DELETE FROM `shoes_shop_database`.`cart_line` WHERE product_id =?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public List<Product> getLimitProduct(int number) {
		List<Product> list = new ArrayList<>();
		con = DBConnection.getConection();
		String sql = "SELECT * FROM shoes_shop_database.products limit ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, number);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getString(5), rs.getString(6));
				list.add(p);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public List<Product> searchProduct(String search, int index, int amountProduct) {
		List<Product> list = new ArrayList<>();
		con = DBConnection.getConection();
		String sql = " select * from shoes_shop_database.products where name like ?  LIMIT ? OFFSET ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, "%" + search + "%");
			pst.setInt(2, amountProduct);
			pst.setInt(3, (index - 1) * amountProduct);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getString(5), rs.getString(6));
				list.add(p);
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return list;
	}

	public List<Product> searchProductByPrice(double priceFrom, double priceTo) {
		List<Product> list = new ArrayList<>();
		con = DBConnection.getConection();
		String sql = "SELECT * FROM shoes_shop_database.products where price >= ? and price <=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setDouble(1, priceFrom);
			pst.setDouble(2, priceTo);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(4), rs.getString(5), rs.getString(6));
				list.add(p);
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return list;
	}

	public void addProduct(String name, int category_id, double price, String image, String description) {
		con = DBConnection.getConection();
		String sql = "insert into shoes_shop_database.products (name ,category_id,price, image, description) values (?,?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, name);
			pst.setInt(2, category_id);
			pst.setDouble(3, price);
			pst.setString(4, image);
			pst.setString(5, description);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void deleteProduct(int pid) {
		con = DBConnection.getConection();
		String sql = "DELETE FROM `shoes_shop_database`.`products` WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void editProduct(String name, int idCategory, double price, String image, String description,
			int idProduct) {
		con = DBConnection.getConection();
		String sql = "UPDATE `shoes_shop_database`.`products` SET `name` = ?, `category_id` = ?, `price` = ?, `image` = ?, `description` = ?"
				+ "  WHERE (`id` = ?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, name);
			pst.setInt(2, idCategory);
			pst.setDouble(3, price);
			pst.setString(4, image);
			pst.setString(5, description);
			pst.setInt(6, idProduct);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public static void main(String[] args) {
		System.out.println(new ProductDao().getTotalProductBySearch("air"));
	}

}
