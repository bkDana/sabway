package kr.co.subway.customerOrder.vo;


import java.sql.Date;

public class MyMenu {
	private int mmIdx;
	private String mmCustomerIdx;
	private String mmCusoOrderNo;
	private String mmBread;
	private String mmMain;
	private String mmVegi;
	private String mmCheese;
	private String mmSource;
	private String mmTopping;
	private String mmSide;
	private String mmIsSalad;
	private String mmIsOvened;
	private String mmSet;
	private int mmCost;
	private double mmDiscntRate;
	private int mmKcal;
	private int mmQuantity;
	private Date mmRegDate;
	private String mmBranch;
	public MyMenu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyMenu(int mmIdx, String mmCustomerIdx, String mmCusoOrderNo, String mmBread, String mmMain, String mmVegi,
			String mmCheese, String mmSource, String mmTopping, String mmSide, String mmIsSalad, String mmIsOvened,
			String mmSet, int mmCost, double mmDiscntRate, int mmKcal, int mmQuantity, Date mmRegDate,
			String mmBranch) {
		super();
		this.mmIdx = mmIdx;
		this.mmCustomerIdx = mmCustomerIdx;
		this.mmCusoOrderNo = mmCusoOrderNo;
		this.mmBread = mmBread;
		this.mmMain = mmMain;
		this.mmVegi = mmVegi;
		this.mmCheese = mmCheese;
		this.mmSource = mmSource;
		this.mmTopping = mmTopping;
		this.mmSide = mmSide;
		this.mmIsSalad = mmIsSalad;
		this.mmIsOvened = mmIsOvened;
		this.mmSet = mmSet;
		this.mmCost = mmCost;
		this.mmDiscntRate = mmDiscntRate;
		this.mmKcal = mmKcal;
		this.mmQuantity = mmQuantity;
		this.mmRegDate = mmRegDate;
		this.mmBranch = mmBranch;
	}
	public int getMmIdx() {
		return mmIdx;
	}
	public void setMmIdx(int mmIdx) {
		this.mmIdx = mmIdx;
	}
	public String getMmCustomerIdx() {
		return mmCustomerIdx;
	}
	public void setMmCustomerIdx(String mmCustomerIdx) {
		this.mmCustomerIdx = mmCustomerIdx;
	}
	public String getMmCusoOrderNo() {
		return mmCusoOrderNo;
	}
	public void setMmCusoOrderNo(String mmCusoOrderNo) {
		this.mmCusoOrderNo = mmCusoOrderNo;
	}
	public String getMmBread() {
		return mmBread;
	}
	public void setMmBread(String mmBread) {
		this.mmBread = mmBread;
	}
	public String getMmMain() {
		return mmMain;
	}
	public void setMmMain(String mmMain) {
		this.mmMain = mmMain;
	}
	public String getMmVegi() {
		return mmVegi;
	}
	public void setMmVegi(String mmVegi) {
		this.mmVegi = mmVegi;
	}
	public String getMmCheese() {
		return mmCheese;
	}
	public void setMmCheese(String mmCheese) {
		this.mmCheese = mmCheese;
	}
	public String getMmSource() {
		return mmSource;
	}
	public void setMmSource(String mmSource) {
		this.mmSource = mmSource;
	}
	public String getMmTopping() {
		return mmTopping;
	}
	public void setMmTopping(String mmTopping) {
		this.mmTopping = mmTopping;
	}
	public String getMmSide() {
		return mmSide;
	}
	public void setMmSide(String mmSide) {
		this.mmSide = mmSide;
	}
	public String getMmIsSalad() {
		return mmIsSalad;
	}
	public void setMmIsSalad(String mmIsSalad) {
		this.mmIsSalad = mmIsSalad;
	}
	public String getMmIsOvened() {
		return mmIsOvened;
	}
	public void setMmIsOvened(String mmIsOvened) {
		this.mmIsOvened = mmIsOvened;
	}
	public String getMmSet() {
		return mmSet;
	}
	public void setMmSet(String mmSet) {
		this.mmSet = mmSet;
	}
	public int getMmCost() {
		return mmCost;
	}
	public void setMmCost(int mmCost) {
		this.mmCost = mmCost;
	}
	public double getMmDiscntRate() {
		return mmDiscntRate;
	}
	public void setMmDiscntRate(double mmDiscntRate) {
		this.mmDiscntRate = mmDiscntRate;
	}
	public int getMmKcal() {
		return mmKcal;
	}
	public void setMmKcal(int mmKcal) {
		this.mmKcal = mmKcal;
	}
	public int getMmQuantity() {
		return mmQuantity;
	}
	public void setMmQuantity(int mmQuantity) {
		this.mmQuantity = mmQuantity;
	}
	public Date getMmRegDate() {
		return mmRegDate;
	}
	public void setMmRegDate(Date mmRegDate) {
		this.mmRegDate = mmRegDate;
	}
	public String getMmBranch() {
		return mmBranch;
	}
	public void setMmBranch(String mmBranch) {
		this.mmBranch = mmBranch;
	}
	
	
}	