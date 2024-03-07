package bean;

public class OrderDetailDto {
	private String product_name;
	private String image;
	private int total_quantity;
	private double price;
	private double total_price;

	public OrderDetailDto(String product_name, int total_quantity, double price, double total_price) {
		super();
		this.product_name = product_name;
		this.total_quantity = total_quantity;
		this.price = price;
		this.total_price = total_price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public OrderDetailDto(String product_name, String image, int total_quantity, double price, double total_price) {
		super();
		this.product_name = product_name;
		this.image = image;
		this.total_quantity = total_quantity;
		this.price = price;
		this.total_price = total_price;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getTotal_quantity() {
		return total_quantity;
	}

	public void setTotal_quantity(int total_quantity) {
		this.total_quantity = total_quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}

	@Override
	public String toString() {
		return "OrderDetailDto [product_name=" + product_name + ", total_quantity=" + total_quantity + ", price="
				+ price + ", total_price=" + total_price + "]";
	}

}
