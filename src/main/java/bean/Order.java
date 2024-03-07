package bean;

import java.sql.Date;

public class Order {
	private int id;
	private int user_id;
	private String userName;
	private Date orderDate;
	private double totalPrice;

	public Order(int id, int user_id, String userName, Date orderDate, double totalPrice) {
		this.id = id;
		this.user_id = user_id;
		this.userName = userName;
		this.orderDate = orderDate;
		this.totalPrice = totalPrice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
