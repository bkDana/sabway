package kr.co.subway.customerOrder.vo;

import java.sql.Date;

public class CusOrder {
	private int rnum;
	private int cusoIdx;		//자동
	private int cusoOrderState; //주문상태 default 0
	private int cusoTotalCost;
	private String cusoPhone;
	private String cusoMemberNo;	//회원 번호(외래키)
	private String cusoOrderNo;//고객용 주문번호
	private String cusoBranch;	//지점 번호(Manager - mgrName으로 받아야함)
	private Date cusoOrderDate;
	public CusOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CusOrder(int rnum, int cusoIdx, int cusoOrderState, int cusoTotalCost, String cusoPhone, String cusoMemberNo,
			String cusoOrderNo, String cusoBranch, Date cusoOrderDate) {
		super();
		this.rnum = rnum;
		this.cusoIdx = cusoIdx;
		this.cusoOrderState = cusoOrderState;
		this.cusoTotalCost = cusoTotalCost;
		this.cusoPhone = cusoPhone;
		this.cusoMemberNo = cusoMemberNo;
		this.cusoOrderNo = cusoOrderNo;
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
	public String getCusoMemberNo() {
		return cusoMemberNo;
	}
	public void setCusoMemberNo(String cusoMemberNo) {
		this.cusoMemberNo = cusoMemberNo;
	}
	public String getCusoOrderNo() {
		return cusoOrderNo;
	}
	public void setCusoOrderNo(String cusoOrderNo) {
		this.cusoOrderNo = cusoOrderNo;
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
