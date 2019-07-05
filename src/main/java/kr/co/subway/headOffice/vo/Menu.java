package kr.co.subway.headOffice.vo;

public class Menu {
	private int menuNo;
	private String menuName;
	private int menuBasePrice;
	private int menuDiscntPrice;
	private int menuDiscntRate;
	public Menu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Menu(int menuNo, String menuName, int menuBasePrice, int menuDiscntPrice, int menuDiscntRate) {
		super();
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.menuBasePrice = menuBasePrice;
		this.menuDiscntPrice = menuDiscntPrice;
		this.menuDiscntRate = menuDiscntRate;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuBasePrice() {
		return menuBasePrice;
	}
	public void setMenuBasePrice(int menuBasePrice) {
		this.menuBasePrice = menuBasePrice;
	}
	public int getMenuDiscntPrice() {
		return menuDiscntPrice;
	}
	public void setMenuDiscntPrice(int menuDiscntPrice) {
		this.menuDiscntPrice = menuDiscntPrice;
	}
	public int getMenuDiscntRate() {
		return menuDiscntRate;
	}
	public void setMenuDiscntRate(int menuDiscntRate) {
		this.menuDiscntRate = menuDiscntRate;
	}
	
}
