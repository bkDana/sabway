package kr.co.subway.sales.statics.vo;

import java.sql.Date;

public class SalesStaticsVo {
	private int rnum;
	private int cusoIdx;			//테이블 고유 시퀀스
	private int cusoOrderState;		//주문 상태 (접수전: 0, 접수완료: 1, 수령완료:2, 취소: -1(취소는 접수 전에만 가능))
	private int cusoIsIndoor;		//매장 또는 테이크아웃(0,1)
	private int cusoTotalCost;		//총 금액
	private String cusoPhone;		//핸드폰번호
	private String cusoCustomerNo;	//회원닉네임(비회원 주문시 0, 회원 주문시 외래키 회원닉네임)
	private int cusoTmepOrderNo;	//비회원 호출용 주문번호(회원이 주문시 0)
	private String cusoBranch;		//지점명 (외래키)
	private Date cusoOrderDate;		//주문 일시
	public SalesStaticsVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SalesStaticsVo(int rnum, int cusoIdx, int cusoOrderState, int cusoIsIndoor, int cusoTotalCost,
			String cusoPhone, String cusoCustomerNo, int cusoTmepOrderNo, String cusoBranch, Date cusoOrderDate) {
		super();
		this.rnum = rnum;
		this.cusoIdx = cusoIdx;
		this.cusoOrderState = cusoOrderState;
		this.cusoIsIndoor = cusoIsIndoor;
		this.cusoTotalCost = cusoTotalCost;
		this.cusoPhone = cusoPhone;
		this.cusoCustomerNo = cusoCustomerNo;
		this.cusoTmepOrderNo = cusoTmepOrderNo;
		this.cusoBranch = cusoBranch;
		this.cusoOrderDate = cusoOrderDate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getCusoIdx() {
		return cusoIdx;
	}
	public void setCusoIdx(int cusoIdx) {
		this.cusoIdx = cusoIdx;
	}
	public int getCusoOrderState() {
		return cusoOrderState;
	}
	public void setCusoOrderState(int cusoOrderState) {
		this.cusoOrderState = cusoOrderState;
	}
	public int getCusoIsIndoor() {
		return cusoIsIndoor;
	}
	public void setCusoIsIndoor(int cusoIsIndoor) {
		this.cusoIsIndoor = cusoIsIndoor;
	}
	public int getCusoTotalCost() {
		return cusoTotalCost;
	}
	public void setCusoTotalCost(int cusoTotalCost) {
		this.cusoTotalCost = cusoTotalCost;
	}
	public String getCusoPhone() {
		return cusoPhone;
	}
	public void setCusoPhone(String cusoPhone) {
		this.cusoPhone = cusoPhone;
	}
	public String getCusoCustomerNo() {
		return cusoCustomerNo;
	}
	public void setCusoCustomerNo(String cusoCustomerNo) {
		this.cusoCustomerNo = cusoCustomerNo;
	}
	public int getCusoTmepOrderNo() {
		return cusoTmepOrderNo;
	}
	public void setCusoTmepOrderNo(int cusoTmepOrderNo) {
		this.cusoTmepOrderNo = cusoTmepOrderNo;
	}
	public String getCusoBranch() {
		return cusoBranch;
	}
	public void setCusoBranch(String cusoBranch) {
		this.cusoBranch = cusoBranch;
	}
	public Date getCusoOrderDate() {
		return cusoOrderDate;
	}
	public void setCusoOrderDate(Date cusoOrderDate) {
		this.cusoOrderDate = cusoOrderDate;
	}
	
}
