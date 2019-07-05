package kr.co.subway.stock.vo;

public class stockViewVO {
	private int rnum;
	private int mStockIdx;
	private int mStock;
	private String ingreLabel;
	private String ingreUnit;
	private String ingreFilepath;
	
	public stockViewVO() {
		super();
	}
	
	public stockViewVO(int rnum, int mStockIdx, int mStock, String ingreLabel, String ingreUnit, String ingreFilepath) {
		super();
		this.rnum = rnum;
		this.mStockIdx = mStockIdx;
		this.mStock = mStock;
		this.ingreLabel = ingreLabel;
		this.ingreUnit = ingreUnit;
		this.ingreFilepath = ingreFilepath;
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getmStockIdx() {
		return mStockIdx;
	}
	public void setmStockIdx(int mStockIdx) {
		this.mStockIdx = mStockIdx;
	}
	public int getmStock() {
		return mStock;
	}
	public void setmStock(int mStock) {
		this.mStock = mStock;
	}
	public String getIngreLabel() {
		return ingreLabel;
	}
	public void setIngreLabel(String ingreLabel) {
		this.ingreLabel = ingreLabel;
	}
	public String getIngreUnit() {
		return ingreUnit;
	}
	public void setIngreUnit(String ingreUnit) {
		this.ingreUnit = ingreUnit;
	}
	public String getIngreFilepath() {
		return ingreFilepath;
	}
	public void setIngreFilepath(String ingreFilepath) {
		this.ingreFilepath = ingreFilepath;
	}
	
	
	
	
}
