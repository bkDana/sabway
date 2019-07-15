package kr.co.subway.customer.vo;

import java.sql.Date;

public class Customer {
	private int rnum;
	private int customerNo;
	private String customerId;
	private String customerPw;
	private String customerName;
	private String customerNick;
	private String phone;
	private String phone1;
	private String phone2;
	private String birthday;
	private String email;
	private String gender;
	private int customerState;
	private Date regDate;
	private Date lastLogDate;
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customer(int rnum, int customerNo, String customerId, String customerPw, String customerName,
			String customerNick, String phone, String phone1, String phone2, String birthday, String email,
			String gender, int customerState, Date regDate, Date lastLogDate) {
		super();
		this.rnum = rnum;
		this.customerNo = customerNo;
		this.customerId = customerId;
		this.customerPw = customerPw;
		this.customerName = customerName;
		this.customerNick = customerNick;
		this.phone = phone;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.birthday = birthday;
		this.email = email;
		this.gender = gender;
		this.customerState = customerState;
		this.regDate = regDate;
		this.lastLogDate = lastLogDate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCustomerPw() {
		return customerPw;
	}
	public void setCustomerPw(String customerPw) {
		this.customerPw = customerPw;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerNick() {
		return customerNick;
	}
	public void setCustomerNick(String customerNick) {
		this.customerNick = customerNick;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getCustomerState() {
		return customerState;
	}
	public void setCustomerState(int customerState) {
		this.customerState = customerState;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getLastLogDate() {
		return lastLogDate;
	}
	public void setLastLogDate(Date lastLogDate) {
		this.lastLogDate = lastLogDate;
	}
	
}
