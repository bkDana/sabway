package kr.co.subway.sales.statics.vo;

public class SalesStaticsGrpVo {
	private String cusoBranch;		//지점명
	private String orderMonth;		//판매일자(월)
	private int totalCost;			//판매금액
	private String ingredients;		//메뉴(재료)
	public SalesStaticsGrpVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SalesStaticsGrpVo(String cusoBranch, String orderMonth, int totalCost, String ingredients) {
		super();
		this.cusoBranch = cusoBranch;
		this.orderMonth = orderMonth;
		this.totalCost = totalCost;
		this.ingredients = ingredients;
	}
	public String getCusoBranch() {
		return cusoBranch;
	}
	public void setCusoBranch(String cusoBranch) {
		this.cusoBranch = cusoBranch;
	}
	public String getOrderMonth() {
		return orderMonth;
	}
	public void setOrderMonth(String orderMonth) {
		this.orderMonth = orderMonth;
	}
	public int getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	
}
