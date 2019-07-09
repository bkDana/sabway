package kr.co.subway.stock.vo;

public class HistoryVO {
	private int rnum;
	private int hIdx;
	private int hStockIdx;
    private String hContent;
    private String hDate;
    
	public HistoryVO() {
		super();
	}
	public HistoryVO(int rnum, int hIdx, int hStockIdx, String hContent, String hDate) {
		super();
		this.rnum = rnum;
		this.hIdx = hIdx;
		this.hStockIdx = hStockIdx;
		this.hContent = hContent;
		this.hDate = hDate;
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int gethIdx() {
		return hIdx;
	}
	public void sethIdx(int hIdx) {
		this.hIdx = hIdx;
	}
	public int gethStockIdx() {
		return hStockIdx;
	}
	public void sethStockIdx(int hStockIdx) {
		this.hStockIdx = hStockIdx;
	}
	public String gethContent() {
		return hContent;
	}
	public void sethContent(String hContent) {
		this.hContent = hContent;
	}
	public String gethDate() {
		return hDate;
	}
	public void sethDate(String hDate) {
		this.hDate = hDate;
	}
    
    
    
    

}
