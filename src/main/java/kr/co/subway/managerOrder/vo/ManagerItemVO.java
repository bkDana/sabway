package kr.co.subway.managerOrder.vo;

public class ManagerItemVO {
	
	private int mItemIdx;
	private String mOrderNo;
	private int itemIdx;
	private String mItemName;
	private int mItemAmount;
	
	public ManagerItemVO() {
		super();
	}

	public ManagerItemVO(int mItemIdx, String mOrderNo, int itemIdx, String mItemName, int mItemAmount) {
		super();
		this.mItemIdx = mItemIdx;
		this.mOrderNo = mOrderNo;
		this.itemIdx = itemIdx;
		this.mItemName = mItemName;
		this.mItemAmount = mItemAmount;
	}

	public int getmItemIdx() {
		return mItemIdx;
	}

	public void setmItemIdx(int mItemIdx) {
		this.mItemIdx = mItemIdx;
	}

	public String getmOrderNo() {
		return mOrderNo;
	}

	public void setmOrderNo(String mOrderNo) {
		this.mOrderNo = mOrderNo;
	}

	public int getItemIdx() {
		return itemIdx;
	}

	public void setItemIdx(int itemIdx) {
		this.itemIdx = itemIdx;
	}

	public String getmItemName() {
		return mItemName;
	}

	public void setmItemName(String mItemName) {
		this.mItemName = mItemName;
	}

	public int getmItemAmount() {
		return mItemAmount;
	}

	public void setmItemAmount(int mItemAmount) {
		this.mItemAmount = mItemAmount;
	}
	
	
}
