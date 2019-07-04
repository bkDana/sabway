package kr.co.subway.customerOrder.vo;

import java.sql.Date;

public class CusOrder {
	private int cusoIdx;
	private int cusoOrderState;
	private int cusoIsIndoor;
	private int cusoTotalCost;
	private int cusoPhone;
	private int cusoCustomerNo;
	private int cusoTempOrderNo; //무조건발급으로?
	private Date cusoOrderDate;
	public CusOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CusOrder(int cusoIdx, int cusoOrderState, int cusoIsIndoor, int cusoTotalCost, int cusoPhone,
			int cusoCustomerNo, int cusoTempOrderNo, Date cusoOrderDate) {
		super();
		this.cusoIdx = cusoIdx;
		this.cusoOrderState = cusoOrderState;
		this.cusoIsIndoor = cusoIsIndoor;
		this.cusoTotalCost = cusoTotalCost;
		this.cusoPhone = cusoPhone;
		this.cusoCustomerNo = cusoCustomerNo;
		this.cusoTempOrderNo = cusoTempOrderNo;
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
	public int getCusoPhone() {
		return cusoPhone;
	}
	public void setCusoPhone(int cusoPhone) {
		this.cusoPhone = cusoPhone;
	}
	public int getCusoCustomerNo() {
		return cusoCustomerNo;
	}
	public void setCusoCustomerNo(int cusoCustomerNo) {
		this.cusoCustomerNo = cusoCustomerNo;
	}
	public int getCusoTempOrderNo() {
		return cusoTempOrderNo;
	}
	public void setCusoTempOrderNo(int cusoTempOrderNo) {
		this.cusoTempOrderNo = cusoTempOrderNo;
	}
	public Date getCusoOrderDate() {
		return cusoOrderDate;
	}
	public void setCusoOrderDate(Date cusoOrderDate) {
		this.cusoOrderDate = cusoOrderDate;
	}
	
	
}
