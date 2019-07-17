package kr.co.subway.customerOrder.vo;

import java.sql.Date;

public class CusOrder {
	private int cusoIdx;		//자동
	private int cusoOrderState; //주문상태 default 0
	private int cusoTotalCost;
	private int cusoPhone;
	private String cusoMemberNo;	//회원 번호(외래키)
	private String cusoOrderNo;//고객용 주문번호
	private String cusoBranchName;	//지점 번호(Manager - mgrName으로 받아야함)
	private Date cusoOrderDate;
	public CusOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CusOrder(int cusoIdx, int cusoOrderState, int cusoTotalCost, int cusoPhone, String cusoMemberNo,
			String cusoOrderNo, String cusoBranchName, Date cusoOrderDate) {
		super();
		this.cusoIdx = cusoIdx;
		this.cusoOrderState = cusoOrderState;
		this.cusoTotalCost = cusoTotalCost;
		this.cusoPhone = cusoPhone;
		this.cusoMemberNo = cusoMemberNo;
		this.cusoOrderNo = cusoOrderNo;
		this.cusoBranchName = cusoBranchName;
		this.cusoOrderDate = cusoOrderDate;
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
	public int getCusoPhone() {
		return cusoPhone;
	}
	public void setCusoPhone(int cusoPhone) {
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
	public String getCusoBranchName() {
		return cusoBranchName;
	}
	public void setCusoBranchName(String cusoBranchName) {
		this.cusoBranchName = cusoBranchName;
	}
	public Date getCusoOrderDate() {
		return cusoOrderDate;
	}
	public void setCusoOrderDate(Date cusoOrderDate) {
		this.cusoOrderDate = cusoOrderDate;
	}
	
}
