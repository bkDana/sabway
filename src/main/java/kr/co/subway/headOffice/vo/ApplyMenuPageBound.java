package kr.co.subway.headOffice.vo;

public class ApplyMenuPageBound {
	private int start;
	private int end;
	private String keyword;
	public ApplyMenuPageBound() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApplyMenuPageBound(int start, int end, String keyword) {
		super();
		this.start = start;
		this.end = end;
		this.keyword = keyword;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
}
