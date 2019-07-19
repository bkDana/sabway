package kr.co.subway.manager.vo;

import java.util.ArrayList;


public class MgrPageData {
	private ArrayList<Mgr> list;
	private String pageNavi;
	private int totalCount;
	public MgrPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MgrPageData(ArrayList<Mgr> list, String pageNavi, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
	}
	public ArrayList<Mgr> getList() {
		return list;
	}
	public void setList(ArrayList<Mgr> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
//   private String text;
//   private String keyword;
//   private int firstPage;
//   private int lastPage;
//   private int status;
//   public MgrPageData() {
//      super();
//      // TODO Auto-generated constructor stub
//   }
//   public MgrPageData(String text, String keyword, int firstPage, int lastPage, int status) {
//      super();
//      this.text = text;
//      this.keyword = keyword;
//      this.firstPage = firstPage;
//      this.lastPage = lastPage;
//      this.status = status;
//   }
//   public String getText() {
//      return text;
//   }
//   public void setText(String text) {
//      this.text = text;
//   }
//   public String getKeyword() {
//      return keyword;
//   }
//   public void setKeyword(String keyword) {
//      this.keyword = keyword;
//   }
//   public int getFirstPage() {
//      return firstPage;
//   }
//   public void setFirstPage(int firstPage) {
//      this.firstPage = firstPage;
//   }
//   public int getLastPage() {
//      return lastPage;
//   }
//   public void setLastPage(int lastPage) {
//      this.lastPage = lastPage;
//   }
//   public int getStatus() {
//      return status;
//   }
//   public void setStatus(int status) {
//      this.status = status;
//   }
   
}