package kr.co.subway.customerOrder.vo;


import java.sql.Date;

public class Bucket {
	private int bucIdx;
	private int bucCustomerIdx;
	private int bucCusoIdx;
	private String bucBread;
	private String bucMain;
	private String bucVegi;
	private String bucCheese;
	private String bucSource;
	private String bucTopping;
	private String bucSide;
	private String bucIs15;
	private String bucIsSalad;
	private String bucIsOvened;
	private String bucSet;
	private int bucCost;
	private double bucDiscntRate;
	private int bucKcal;
	private int bucQuantity;
	private Date bucRegDate;
	public Bucket() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bucket(int bucIdx, int bucCustomerIdx, int bucCusoIdx, String bucBread, String bucMain, String bucVegi,
			String bucCheese, String bucSource, String bucTopping, String bucSide, String bucIs15, String bucIsSalad,
			String bucIsOvened, String bucSet, int bucCost, double bucDiscntRate, int bucKcal, int bucQuantity,
			Date bucRegDate) {
		super();
		this.bucIdx = bucIdx;
		this.bucCustomerIdx = bucCustomerIdx;
		this.bucCusoIdx = bucCusoIdx;
		this.bucBread = bucBread;
		this.bucMain = bucMain;
		this.bucVegi = bucVegi;
		this.bucCheese = bucCheese;
		this.bucSource = bucSource;
		this.bucTopping = bucTopping;
		this.bucSide = bucSide;
		this.bucIs15 = bucIs15;
		this.bucIsSalad = bucIsSalad;
		this.bucIsOvened = bucIsOvened;
		this.bucSet = bucSet;
		this.bucCost = bucCost;
		this.bucDiscntRate = bucDiscntRate;
		this.bucKcal = bucKcal;
		this.bucQuantity = bucQuantity;
		this.bucRegDate = bucRegDate;
	}
	public int getBucIdx() {
		return bucIdx;
	}
	public void setBucIdx(int bucIdx) {
		this.bucIdx = bucIdx;
	}
	public int getBucCustomerIdx() {
		return bucCustomerIdx;
	}
	public void setBucCustomerIdx(int bucCustomerIdx) {
		this.bucCustomerIdx = bucCustomerIdx;
	}
	public int getBucCusoIdx() {
		return bucCusoIdx;
	}
	public void setBucCusoIdx(int bucCusoIdx) {
		this.bucCusoIdx = bucCusoIdx;
	}
	public String getBucBread() {
		return bucBread;
	}
	public void setBucBread(String bucBread) {
		this.bucBread = bucBread;
	}
	public String getBucMain() {
		return bucMain;
	}
	public void setBucMain(String bucMain) {
		this.bucMain = bucMain;
	}
	public String getBucVegi() {
		return bucVegi;
	}
	public void setBucVegi(String bucVegi) {
		this.bucVegi = bucVegi;
	}
	public String getBucCheese() {
		return bucCheese;
	}
	public void setBucCheese(String bucCheese) {
		this.bucCheese = bucCheese;
	}
	public String getBucSource() {
		return bucSource;
	}
	public void setBucSource(String bucSource) {
		this.bucSource = bucSource;
	}
	public String getBucTopping() {
		return bucTopping;
	}
	public void setBucTopping(String bucTopping) {
		this.bucTopping = bucTopping;
	}
	public String getBucSide() {
		return bucSide;
	}
	public void setBucSide(String bucSide) {
		this.bucSide = bucSide;
	}
	public String getBucIs15() {
		return bucIs15;
	}
	public void setBucIs15(String bucIs15) {
		this.bucIs15 = bucIs15;
	}
	public String getBucIsSalad() {
		return bucIsSalad;
	}
	public void setBucIsSalad(String bucIsSalad) {
		this.bucIsSalad = bucIsSalad;
	}
	public String getBucIsOvened() {
		return bucIsOvened;
	}
	public void setBucIsOvened(String bucIsOvened) {
		this.bucIsOvened = bucIsOvened;
	}
	public String getBucSet() {
		return bucSet;
	}
	public void setBucSet(String bucSet) {
		this.bucSet = bucSet;
	}
	public int getBucCost() {
		return bucCost;
	}
	public void setBucCost(int bucCost) {
		this.bucCost = bucCost;
	}
	public double getBucDiscntRate() {
		return bucDiscntRate;
	}
	public void setBucDiscntRate(double bucDiscntRate) {
		this.bucDiscntRate = bucDiscntRate;
	}
	public int getBucKcal() {
		return bucKcal;
	}
	public void setBucKcal(int bucKcal) {
		this.bucKcal = bucKcal;
	}
	public int getBucQuantity() {
		return bucQuantity;
	}
	public void setBucQuantity(int bucQuantity) {
		this.bucQuantity = bucQuantity;
	}
	public Date getBucRegDate() {
		return bucRegDate;
	}
	public void setBucRegDate(Date bucRegDate) {
		this.bucRegDate = bucRegDate;
	}
	
}	