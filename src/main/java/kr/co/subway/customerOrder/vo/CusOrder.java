package kr.co.subway.customerOrder.vo;

import java.sql.Date;

public class CusOrder {
	private int cusoIdx;		//자동
	private int cusoOrderState; //주문상태 default 0
	private int cusoInOrOut;
	private int cusoTotalCost;
	private int cusoPhone;
	private int cusoMemberNo;	//회원 번호(외래키)
	private int cusoTempOrderNo;//고객용 주문번호
	private int cusoBranchNo;	//지점 번호
	private Date cusoOrderDate;
	public CusOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CusOrder(int cusoIdx, int cusoOrderState, int cusoInOrOut, int cusoTotalCost, int cusoPhone,
			int cusoMemberNo, int cusoTempOrderNo, int cusoBranchNo, Date cusoOrderDate) {
		super();
		this.cusoIdx = cusoIdx;
		this.cusoOrderState = cusoOrderState;
		this.cusoInOrOut = cusoInOrOut;
		this.cusoTotalCost = cusoTotalCost;
		this.cusoPhone = cusoPhone;
		this.cusoMemberNo = cusoMemberNo;
		this.cusoTempOrderNo = cusoTempOrderNo;
		this.cusoBranchNo = cusoBranchNo;
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
	public int getCusoInOrOut() {
		return cusoInOrOut;
	}
	public void setCusoInOrOut(int cusoInOrOut) {
		this.cusoInOrOut = cusoInOrOut;
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
	public int getCusoMemberNo() {
		return cusoMemberNo;
	}
	public void setCusoMemberNo(int cusoMemberNo) {
		this.cusoMemberNo = cusoMemberNo;
	}
	public int getCusoTempOrderNo() {
		return cusoTempOrderNo;
	}
	public void setCusoTempOrderNo(int cusoTempOrderNo) {
		this.cusoTempOrderNo = cusoTempOrderNo;
	}
	public int getCusoBranchNo() {
		return cusoBranchNo;
	}
	public void setCusoBranchNo(int cusoBranchNo) {
		this.cusoBranchNo = cusoBranchNo;
	}
	public Date getCusoOrderDate() {
		return cusoOrderDate;
	}
	public void setCusoOrderDate(Date cusoOrderDate) {
		this.cusoOrderDate = cusoOrderDate;
	}
	
	
	
}
