package kr.co.subway.manager.vo;

public class SearchKeyword {
	private String keyword;
	private String text;
	private int status;
	public SearchKeyword() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchKeyword(String keyword, String text, int status) {
		super();
		this.keyword = keyword;
		this.text = text;
		this.status = status;
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
