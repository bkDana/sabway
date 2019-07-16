package kr.co.subway.stock.vo;

import java.util.ArrayList;

import kr.co.subway.ingreManage.vo.IngreVo;

public class HistoryListVO {
	private ArrayList<HistoryVO> list;
	private IngreVo ingre;
	private String pageNavi;
	
	public HistoryListVO() {
		super();
	}
	public HistoryListVO(ArrayList<HistoryVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
	
	public HistoryListVO(ArrayList<HistoryVO> list, IngreVo ingre, String pageNavi) {
		super();
		this.list = list;
		this.ingre = ingre;
		this.pageNavi = pageNavi;
	}
	public ArrayList<HistoryVO> getList() {
		return list;
	}
	public void setList(ArrayList<HistoryVO> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public IngreVo getIngre() {
		return ingre;
	}
	public void setIngre(IngreVo ingre) {
		this.ingre = ingre;
	}
	
	
	
}
