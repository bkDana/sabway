package kr.co.subway.sales.statics.vo;

public class SalesStaticsGrpVo {
	private int rnum;
	private String cusoBranch;		//지점명
	private String orderMonth;		//판매일자(월)
	private long totalCost;			//판매금액
	private String ingredients;		//메뉴(재료)
	public SalesStaticsGrpVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SalesStaticsGrpVo(String cusoBranch, String orderMonth, long totalCost, String ingredients) {
		super();
		this.cusoBranch = cusoBranch;
		this.orderMonth = orderMonth;
		this.totalCost = totalCost;
		this.ingredients = ingredients;
	}
	
	public SalesStaticsGrpVo(int rnum, String cusoBranch, String orderMonth, long totalCost, String ingredients) {
		super();
		this.rnum = rnum;
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
	public long getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(long totalCost) {
		this.totalCost = totalCost;
	}
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
}
