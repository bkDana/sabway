package kr.co.subway.common;

public class SearchVO {
	private int reqPage;
	private int state;
	private int start;
	private int end;
	
	public SearchVO() {
		super();
	}
	
	
	
	public SearchVO(int reqPage, int state, int start, int end) {
		super();
		this.reqPage = reqPage;
		this.state = state;
		this.start = start;
		this.end = end;
	}



	public int getReqPage() {
		return reqPage;
	}
	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
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
