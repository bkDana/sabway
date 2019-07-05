package kr.co.subway.stock.vo;

import java.util.ArrayList;

import kr.co.subway.stock.vo.stockViewVO;

public class StockListVO {
	
	private ArrayList<stockViewVO> stockList;
	private String pageNavi;
	
	public StockListVO() {
		super();
	}
	public StockListVO(ArrayList<stockViewVO> stockList, String pageNavi) {
		super();
		this.stockList = stockList;
		this.pageNavi = pageNavi;
	}
	
	public ArrayList<stockViewVO> getStockList() {
		return stockList;
	}
	public void setStockList(ArrayList<stockViewVO> stockList) {
		this.stockList = stockList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	

}
