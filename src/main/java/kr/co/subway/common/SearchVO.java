package kr.co.subway.common;

public class SearchVO {
	private int reqPage;
	private int state;
	private int start;
	private int end;
	private String mgrId;
	private String startDay;
	private String endDay;
	private String delDay;
	private String searchType;
	private String searchVal;
	private String orderBy;
	
	public SearchVO() {
		super();
	}
	public SearchVO(int reqPage, int state, int start, int end, String mgrId) {
		super();
		this.reqPage = reqPage;
		this.state = state;
		this.start = start;
		this.end = end;
		this.mgrId = mgrId;
	}
	
	public SearchVO(int reqPage, int state, int start, int end, String mgrId, String startDay, String endDay,
			String delDay, String searchType, String searchVal) {
		super();
		this.reqPage = reqPage;
		this.state = state;
		this.start = start;
		this.end = end;
		this.mgrId = mgrId;
		this.startDay = startDay;
		this.endDay = endDay;
		this.delDay = delDay;
		this.searchType = searchType;
		this.searchVal = searchVal;
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
	public String getMgrId() {
		return mgrId;
	}
	public void setMgrId(String mgrId) {
		this.mgrId = mgrId;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	public String getDelDay() {
		return delDay;
	}
	public void setDelDay(String delDay) {
		this.delDay = delDay;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	
	

	
	
	
}
