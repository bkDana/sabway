package kr.co.subway.manager.vo;

public class PageNo {
	private int firstPage;
	private int lastPage;
	public PageNo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PageNo(int firstPage, int lastPage) {
		super();
		this.firstPage = firstPage;
		this.lastPage = lastPage;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	
}
