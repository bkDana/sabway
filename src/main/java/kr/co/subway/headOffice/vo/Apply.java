package kr.co.subway.headOffice.vo;

import java.sql.Date;

public class Apply {
	private int applyNo;
	private String applyName;
	private String applyPhone;
	private String applyEmail;
	private String applyEmail2;
	private String applyArea;
	private String applyArea2;
	private String applyTitle;
	private String applyContent;
	private String applyFilename;
	private String applyFilepath;
	private int applyStatus;
	private Date applyDate;
	public Apply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Apply(int applyNo, String applyName, String applyPhone, String applyEmail, String applyEmail2,
			String applyArea, String applyArea2, String applyTitle, String applyContent, String applyFilename,
			String applyFilepath, int applyStatus, Date applyDate) {
		super();
		this.applyNo = applyNo;
		this.applyName = applyName;
		this.applyPhone = applyPhone;
		this.applyEmail = applyEmail;
		this.applyEmail2 = applyEmail2;
		this.applyArea = applyArea;
		this.applyArea2 = applyArea2;
		this.applyTitle = applyTitle;
		this.applyContent = applyContent;
		this.applyFilename = applyFilename;
		this.applyFilepath = applyFilepath;
		this.applyStatus = applyStatus;
		this.applyDate = applyDate;
	}
	public int getApplyNo() {
		return applyNo;
	}
	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}
	public String getApplyName() {
		return applyName;
	}
	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}
	public String getApplyPhone() {
		return applyPhone;
	}
	public void setApplyPhone(String applyPhone) {
		this.applyPhone = applyPhone;
	}
	public String getApplyEmail() {
		return applyEmail;
	}
	public void setApplyEmail(String applyEmail) {
		this.applyEmail = applyEmail;
	}
	public String getApplyEmail2() {
		return applyEmail2;
	}
	public void setApplyEmail2(String applyEmail2) {
		this.applyEmail2 = applyEmail2;
	}
	public String getApplyArea() {
		return applyArea;
	}
	public void setApplyArea(String applyArea) {
		this.applyArea = applyArea;
	}
	public String getApplyArea2() {
		return applyArea2;
	}
	public void setApplyArea2(String applyArea2) {
		this.applyArea2 = applyArea2;
	}
	public String getApplyTitle() {
		return applyTitle;
	}
	public void setApplyTitle(String applyTitle) {
		this.applyTitle = applyTitle;
	}
	public String getApplyContent() {
		return applyContent;
	}
	public void setApplyContent(String applyContent) {
		this.applyContent = applyContent;
	}
	public String getApplyFilename() {
		return applyFilename;
	}
	public void setApplyFilename(String applyFilename) {
		this.applyFilename = applyFilename;
	}
	public String getApplyFilepath() {
		return applyFilepath;
	}
	public void setApplyFilepath(String applyFilepath) {
		this.applyFilepath = applyFilepath;
	}
	public int getApplyStatus() {
		return applyStatus;
	}
	public void setApplyStatus(int applyStatus) {
		this.applyStatus = applyStatus;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	
}
