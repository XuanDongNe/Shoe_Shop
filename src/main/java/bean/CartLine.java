package bean;

public class CartLine {
	private int id;
	private int product_id;
	private String nameProduct;
	private String image;
	private double price;
	private int quantity;
	private double total_price;

	

	public CartLine(int id, int product_id, String nameProduct, String image, double price, int quantity,
			double total_price) {
		super();
		this.id = id;
		this.product_id = product_id;
		this.nameProduct = nameProduct;
		this.image = image;
		this.price = price;
		this.quantity = quantity;
		this.total_price = total_price;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}

	@Override
	public String toString() {
		return "CartLine [id=" + id + ", nameProduct=" + nameProduct + ", image=" + image + ", price=" + price
				+ ", quantity=" + quantity + ", total_price=" + total_price + "]";
	}

}
