package kr.co.subway.customerOrder.vo;


import java.sql.Date;

public class Bucket {
	private int bucIdx;
	private int bucCusoIdx;
	private int bucBread;
	private int bucMain;
	private int bucVegi;
	private int bucCheese;
	private int bucSource;
	private int bucTopping;
	private int bucSide;
	private int bucIsSalad;
	private int bucIsOvened;
	private int bucSet;
	private int bucCost;
	private double bucDiscntRate;
	private int bucKcal;
	private int bucQuantity;
	private Date bucRegDate;
	public Bucket() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bucket(int bucIdx, int bucCusoIdx, int bucBread, int bucMain, int bucVegi, int bucCheese, int bucSource,
			int bucTopping, int bucSide, int bucIsSalad, int bucIsOvened, int bucSet, int bucCost, double bucDiscntRate,
			int bucKcal, int bucQuantity, Date bucRegDate) {
		super();
		this.bucIdx = bucIdx;
		this.bucCusoIdx = bucCusoIdx;
		this.bucBread = bucBread;
		this.bucMain = bucMain;
		this.bucVegi = bucVegi;
		this.bucCheese = bucCheese;
		this.bucSource = bucSource;
		this.bucTopping = bucTopping;
		this.bucSide = bucSide;
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
	public int getBucCusoIdx() {
		return bucCusoIdx;
	}
	public void setBucCusoIdx(int bucCusoIdx) {
		this.bucCusoIdx = bucCusoIdx;
	}
	public int getBucBread() {
		return bucBread;
	}
	public void setBucBread(int bucBread) {
		this.bucBread = bucBread;
	}
	public int getBucMain() {
		return bucMain;
	}
	public void setBucMain(int bucMain) {
		this.bucMain = bucMain;
	}
	public int getBucVegi() {
		return bucVegi;
	}
	public void setBucVegi(int bucVegi) {
		this.bucVegi = bucVegi;
	}
	public int getBucCheese() {
		return bucCheese;
	}
	public void setBucCheese(int bucCheese) {
		this.bucCheese = bucCheese;
	}
	public int getBucSource() {
		return bucSource;
	}
	public void setBucSource(int bucSource) {
		this.bucSource = bucSource;
	}
	public int getBucTopping() {
		return bucTopping;
	}
	public void setBucTopping(int bucTopping) {
		this.bucTopping = bucTopping;
	}
	public int getBucSide() {
		return bucSide;
	}
	public void setBucSide(int bucSide) {
		this.bucSide = bucSide;
	}
	public int getBucIsSalad() {
		return bucIsSalad;
	}
	public void setBucIsSalad(int bucIsSalad) {
		this.bucIsSalad = bucIsSalad;
	}
	public int getBucIsOvened() {
		return bucIsOvened;
	}
	public void setBucIsOvened(int bucIsOvened) {
		this.bucIsOvened = bucIsOvened;
	}
	public int getBucSet() {
		return bucSet;
	}
	public void setBucSet(int bucSet) {
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