package kr.co.subway.customerOrder.vo;

import java.sql.Date;
import java.util.ArrayList;

public class CusOrder {
	private int rnum;
	private int cusoIdx;		//자동
	private int cusoOrderState; //주문상태 default 0
	private int cusoTotalCost;
	private String cusoPhone;
	private String cusoMemberNo;	//회원 번호(외래키)
	private String cusoOrderNo;
	private String cusoCallBy;	//회원 비회원 가리기 -- 새로 추가함
	private String cusoBranch;	//지점 번호(Manager - mgrName으로 받아야함)
	private Date cusoOrderDate;
	private ArrayList<Bucket> bucketList; //?
	public CusOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CusOrder(int rnum, int cusoIdx, int cusoOrderState, int cusoTotalCost, String cusoPhone, String cusoMemberNo,
			String cusoOrderNo, String cusoCallBy, String cusoBranch, Date cusoOrderDate,
			ArrayList<Bucket> bucketList) {
		super();
		this.rnum = rnum;
		this.cusoIdx = cusoIdx;
		this.cusoOrderState = cusoOrderState;
		this.cusoTotalCost = cusoTotalCost;
		this.cusoPhone = cusoPhone;
		this.cusoMemberNo = cusoMemberNo;
		this.cusoOrderNo = cusoOrderNo;
		this.cusoCallBy = cusoCallBy;
		this.cusoBranch = cusoBranch;
		this.cusoOrderDate = cusoOrderDate;
		this.bucketList = bucketList;
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
	public String getCusoCallBy() {
		return cusoCallBy;
	}
	public void setCusoCallBy(String cusoCallBy) {
		this.cusoCallBy = cusoCallBy;
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
	public ArrayList<Bucket> getBucketList() {
		return bucketList;
	}
	public void setBucketList(ArrayList<Bucket> bucketList) {
		this.bucketList = bucketList;
	}
	

}
