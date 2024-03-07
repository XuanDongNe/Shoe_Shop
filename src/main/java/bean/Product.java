package bean;

public class Product {
	private int pId;
	private String pName;
	private int price;
	private String pImage;
	private String description;
	
	public Product(int pId, String pName, int price, String pImage, String description) {
		this.pId = pId;
		this.pName = pName;
		this.price = price;
		this.pImage = pImage;
		this.description = description;
	}

	

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pImage=" + pImage + ", price=" + price + ", description="
				+ description + "]";
	}

}
