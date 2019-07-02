package kr.co.subway.notice.vo;

public class PageBound {
	private int start;
	private int end;
	public PageBound() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PageBound(int start, int end) {
		super();
		this.start = start;
		this.end = end;
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
	
}
