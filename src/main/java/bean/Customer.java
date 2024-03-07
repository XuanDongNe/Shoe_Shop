package bean;

public class Customer {
	private int cId;
	private String cName;
	private String cPassword;
	private String cEmail;
	
	

	public Customer(int cId, String cName, String cPassword, String cEmail) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cPassword = cPassword;
		this.cEmail = cEmail;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcPassword() {
		return cPassword;
	}

	public void setcPassword(String cPassword) {
		this.cPassword = cPassword;
	}

	public String getcEmail() {
		return cEmail;
	}

	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}

	@Override
	public String toString() {
		return "Customer [cId=" + cId + ", cName=" + cName + ", cPassword=" + cPassword + ", cEmail=" + cEmail + "]";
	}
}
