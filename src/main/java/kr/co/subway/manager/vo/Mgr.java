package kr.co.subway.manager.vo;

import java.sql.Date;

public class Mgr {
	
	private int rnum;
	private int mgrNo;
	private String mgrId;
	private String mgrPw;
	private String mgrName;
	private String mgrTel;
	private int mgrPost;
	private String mgrAddr;
	private int mgrLevel;
	private int mgrStatus;
	private Date mgrEnrollDate;
	private String mgrAddrCode;
	private String mgrBossName;
	private Date mgrOpenDate;
	private String latitude;
	private String longitude;
	private int totalCount;
	
	public Mgr() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Mgr(int rnum, int mgrNo, String mgrId, String mgrPw, String mgrName, String mgrTel, int mgrPost, String mgrAddr,
			int mgrLevel, int mgrStatus, Date mgrEnrollDate, String mgrAddrCode, String mgrBossName, Date mgrOpenDate,
			String latitude, String longitude, int totalCount) {
		super();
		this.rnum = rnum;
		this.mgrNo = mgrNo;
		this.mgrId = mgrId;
		this.mgrPw = mgrPw;
		this.mgrName = mgrName;
		this.mgrTel = mgrTel;
		this.mgrPost = mgrPost;
		this.mgrAddr = mgrAddr;
		this.mgrLevel = mgrLevel;
		this.mgrStatus = mgrStatus;
		this.mgrEnrollDate = mgrEnrollDate;
		this.mgrAddrCode = mgrAddrCode;
		this.mgrBossName = mgrBossName;
		this.mgrOpenDate = mgrOpenDate;
		this.latitude = latitude;
		this.longitude = longitude;
		this.totalCount = totalCount;
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getMgrNo() {
		return mgrNo;
	}
	public void setMgrNo(int mgrNo) {
		this.mgrNo = mgrNo;
	}
	public String getMgrId() {
		return mgrId;
	}
	public void setMgrId(String mgrId) {
		this.mgrId = mgrId;
	}
	public String getMgrPw() {
		return mgrPw;
	}
	public void setMgrPw(String mgrPw) {
		this.mgrPw = mgrPw;
	}
	public String getMgrName() {
		return mgrName;
	}
	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}
	public String getMgrTel() {
		return mgrTel;
	}
	public void setMgrTel(String mgrTel) {
		this.mgrTel = mgrTel;
	}
	public int getMgrPost() {
		return mgrPost;
	}
	public void setMgrPost(int mgrPost) {
		this.mgrPost = mgrPost;
	}
	public String getMgrAddr() {
		return mgrAddr;
	}
	public void setMgrAddr(String mgrAddr) {
		this.mgrAddr = mgrAddr;
	}
	public int getMgrLevel() {
		return mgrLevel;
	}
	public void setMgrLevel(int mgrLevel) {
		this.mgrLevel = mgrLevel;
	}
	public int getMgrStatus() {
		return mgrStatus;
	}
	public void setMgrStatus(int mgrStatus) {
		this.mgrStatus = mgrStatus;
	}
	public Date getMgrEnrollDate() {
		return mgrEnrollDate;
	}
	public void setMgrEnrollDate(Date mgrEnrollDate) {
		this.mgrEnrollDate = mgrEnrollDate;
	}
	public String getMgrAddrCode() {
		return mgrAddrCode;
	}
	public void setMgrAddrCode(String mgrAddrCode) {
		this.mgrAddrCode = mgrAddrCode;
	}
	public String getMgrBossName() {
		return mgrBossName;
	}
	public void setMgrBossName(String mgrBossName) {
		this.mgrBossName = mgrBossName;
	}
	public Date getMgrOpenDate() {
		return mgrOpenDate;
	}
	public void setMgrOpenDate(Date mgrOpenDate) {
		this.mgrOpenDate = mgrOpenDate;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
}
