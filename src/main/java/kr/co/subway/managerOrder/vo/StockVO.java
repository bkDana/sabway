package kr.co.subway.managerOrder.vo;

public class StockVO {
	private int mStockIdx;
	private String mOrderManagerId;
	private int mItemIdx;
	private int mItemAmount;
	
	public StockVO() {
		super();
	}
	
	public StockVO(int mStockIdx, String mOrderManagerId, int mItemIdx, int mItemAmount) {
		super();
		this.mStockIdx = mStockIdx;
		this.mOrderManagerId = mOrderManagerId;
		this.mItemIdx = mItemIdx;
		this.mItemAmount = mItemAmount;
	}
	
	public int getmStockIdx() {
		return mStockIdx;
	}
	public void setmStockIdx(int mStockIdx) {
		this.mStockIdx = mStockIdx;
	}
	public String getmOrderManagerId() {
		return mOrderManagerId;
	}
	public void setmOrderManagerId(String mOrderManagerId) {
		this.mOrderManagerId = mOrderManagerId;
	}
	public int getmItemIdx() {
		return mItemIdx;
	}
	public void setmItemIdx(int mItemIdx) {
		this.mItemIdx = mItemIdx;
	}
	public int getmItemAmount() {
		return mItemAmount;
	}
	public void setmItemAmount(int mItemAmount) {
		this.mItemAmount = mItemAmount;
	}
	
	

}
