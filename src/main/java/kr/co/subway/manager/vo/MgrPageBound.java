package kr.co.subway.manager.vo;

public class MgrPageBound {
	private int start;
	private int end;
	private String keyword;
	private String text;
	private int status;
	public MgrPageBound() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MgrPageBound(int start, int end, String keyword, String text, int status) {
		super();
		this.start = start;
		this.end = end;
		this.keyword = keyword;
		this.text = text;
		this.status = status;
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
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}
