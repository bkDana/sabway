package kr.co.subway.ingreManage.vo;

import java.sql.Date;

public class IngreVo {
	private int rnum;
	private int ingreIdx;			//인덱스
	private String ingreLabel;		//재료 이름
	private String ingreType;		//제품의 종류(메인재료, 추가토핑 등등) 카테고리
	private int ingreCost15;		//15cm 가격
	private int ingreCost30;		//30cm 가격
	private int ingreDiscntRate;	//할인률
	private int ingreKcal;			//기본 칼로리
	private int ingreKcalSalad;		//샐러드 칼로리(메인메뉴용)
	private int ingreActive;		//활성화 비활성화 (0:비활성화 1:활성화)
	private String ingreUnit;		//단위
	private String ingreDescription;//설명
	private String ingreFilepath;	//관련 이미지
	private Date ingreRegDate;		//재료 등록일
	public IngreVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public IngreVo(int rnum, int ingreIdx, String ingreLabel, String ingreType, int ingreCost15, int ingreCost30,
			int ingreDiscntRate, int ingreKcal, int ingreKcalSalad, int ingreActive, String ingreUnit,
			String ingreDescription, String ingreFilepath, Date ingreRegDate) {
		super();
		this.rnum = rnum;
		this.ingreIdx = ingreIdx;
		this.ingreLabel = ingreLabel;
		this.ingreType = ingreType;
		this.ingreCost15 = ingreCost15;
		this.ingreCost30 = ingreCost30;
		this.ingreDiscntRate = ingreDiscntRate;
		this.ingreKcal = ingreKcal;
		this.ingreKcalSalad = ingreKcalSalad;
		this.ingreActive = ingreActive;
		this.ingreUnit = ingreUnit;
		this.ingreDescription = ingreDescription;
		this.ingreFilepath = ingreFilepath;
		this.ingreRegDate = ingreRegDate;
	}
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getIngreIdx() {
		return ingreIdx;
	}
	public void setIngreIdx(int ingreIdx) {
		this.ingreIdx = ingreIdx;
	}
	public String getIngreLabel() {
		return ingreLabel;
	}
	public void setIngreLabel(String ingreLabel) {
		this.ingreLabel = ingreLabel;
	}
	public String getIngreType() {
		return ingreType;
	}
	public void setIngreType(String ingreType) {
		this.ingreType = ingreType;
	}
	public int getIngreCost15() {
		return ingreCost15;
	}
	public void setIngreCost15(int ingreCost15) {
		this.ingreCost15 = ingreCost15;
	}
	public int getIngreCost30() {
		return ingreCost30;
	}
	public void setIngreCost30(int ingreCost30) {
		this.ingreCost30 = ingreCost30;
	}
	public int getIngreDiscntRate() {
		return ingreDiscntRate;
	}
	public void setIngreDiscntRate(int ingreDiscntRate) {
		this.ingreDiscntRate = ingreDiscntRate;
	}
	public int getIngreKcal() {
		return ingreKcal;
	}
	public void setIngreKcal(int ingreKcal) {
		this.ingreKcal = ingreKcal;
	}
	public int getIngreKcalSalad() {
		return ingreKcalSalad;
	}
	public void setIngreKcalSalad(int ingreKcalSalad) {
		this.ingreKcalSalad = ingreKcalSalad;
	}
	public int getIngreActive() {
		return ingreActive;
	}
	public void setIngreActive(int ingreActive) {
		this.ingreActive = ingreActive;
	}
	public String getIngreUnit() {
		return ingreUnit;
	}
	public void setIngreUnit(String ingreUnit) {
		this.ingreUnit = ingreUnit;
	}
	public String getIngreDescription() {
		return ingreDescription;
	}
	public void setIngreDescription(String ingreDescription) {
		this.ingreDescription = ingreDescription;
	}
	public String getIngreFilepath() {
		return ingreFilepath;
	}
	public void setIngreFilepath(String ingreFilepath) {
		this.ingreFilepath = ingreFilepath;
	}
	public Date getIngreRegDate() {
		return ingreRegDate;
	}
	public void setIngreRegDate(Date ingreRegDate) {
		this.ingreRegDate = ingreRegDate;
	}
	
	public String getIngreActiveChange() {
		if(ingreActive ==0) {
			return "비활성화";
		}else {
			return "활성화";
		}
	}
	
}
