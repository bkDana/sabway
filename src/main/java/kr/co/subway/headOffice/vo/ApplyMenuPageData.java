package kr.co.subway.headOffice.vo;

import java.util.ArrayList;

import kr.co.subway.ingreManage.vo.IngreVo;

public class ApplyMenuPageData {
	private ArrayList<IngreVo> list;
	private String pageNavi;
	private int totalCount;
	public ApplyMenuPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApplyMenuPageData(ArrayList<IngreVo> list, String pageNavi, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
	}
	public ArrayList<IngreVo> getList() {
		return list;
	}
	public void setList(ArrayList<IngreVo> list) {
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
	
}
