package kr.co.subway.customerOrder.vo;

public class UpdateQuantity {
	private int val;
	private int bucIdx;
	public UpdateQuantity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UpdateQuantity(int val, int bucIdx) {
		super();
		this.val = val;
		this.bucIdx = bucIdx;
	}
	public int getVal() {
		return val;
	}
	public void setVal(int val) {
		this.val = val;
	}
	public int getBucIdx() {
		return bucIdx;
	}
	public void setBucIdx(int bucIdx) {
		this.bucIdx = bucIdx;
	}
	
}
