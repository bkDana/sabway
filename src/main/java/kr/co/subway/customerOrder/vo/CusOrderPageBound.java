package kr.co.subway.customerOrder.vo;

public class CusOrderPageBound {
	private int start;
	private int end;
	private String cusoMemberNo;
	private String keyword;
	public CusOrderPageBound() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CusOrderPageBound(int start, int end, String cusoMemberNo, String keyword) {
		super();
		this.start = start;
		this.end = end;
		this.cusoMemberNo = cusoMemberNo;
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
	public String getCusoMemberNo() {
		return cusoMemberNo;
	}
	public void setCusoMemberNo(String cusoMemberNo) {
		this.cusoMemberNo = cusoMemberNo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
