package kr.co.subway.customerOrder.vo;


public class Item {
	private int itemIdx;
	private int cusiIdx;		// 해당 주문내역 번호
	private int itemBread;
	private int itemMain;		// 메인메뉴
	private int itemVegi;
	private int itemCheese;
	private int itemSource;
	private int itemTopping;
	private int itemSide;
	private int itemIsSalad;	// 샐러드여부
	private int itemIsOvened;	// 오븐 여부
	private int itemIsSet;		// 세트 여부
	private int itemQuantity;	// 제품의 수량
	private double itemDiscntRate;
	private int itemDiscntCost;	// 할인 후 가격
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Item(int itemIdx, int cusiIdx, int itemBread, int itemMain, int itemVegi, int itemCheese,
			int itemSource, int itemTopping, int itemSide, int itemIsSalad, int itemIsOvened, int itemIsSet,
			int itemQuantity, double itemDiscntRate, int itemDiscntCost) {
		super();
		this.itemIdx = itemIdx;
		this.cusiIdx = cusiIdx;
		this.itemBread = itemBread;
		this.itemMain = itemMain;
		this.itemVegi = itemVegi;
		this.itemCheese = itemCheese;
		this.itemSource = itemSource;
		this.itemTopping = itemTopping;
		this.itemSide = itemSide;
		this.itemIsSalad = itemIsSalad;
		this.itemIsOvened = itemIsOvened;
		this.itemIsSet = itemIsSet;
		this.itemQuantity = itemQuantity;
		this.itemDiscntRate = itemDiscntRate;
		this.itemDiscntCost = itemDiscntCost;
	}
	public int getItemIdx() {
		return itemIdx;
	}
	public void setItemIdx(int itemIdx) {
		this.itemIdx = itemIdx;
	}
	public int getCusiIdx() {
		return cusiIdx;
	}
	public void setCusiIdx(int cusiIdx) {
		this.cusiIdx = cusiIdx;
	}
	public int getItemBread() {
		return itemBread;
	}
	public void setItemBread(int itemBread) {
		this.itemBread = itemBread;
	}
	public int getItemMain() {
		return itemMain;
	}
	public void setItemMain(int itemMain) {
		this.itemMain = itemMain;
	}
	public int getItemVegi() {
		return itemVegi;
	}
	public void setItemVegi(int itemVegi) {
		this.itemVegi = itemVegi;
	}
	public int getItemCheese() {
		return itemCheese;
	}
	public void setItemCheese(int itemCheese) {
		this.itemCheese = itemCheese;
	}
	public int getItemSource() {
		return itemSource;
	}
	public void setItemSource(int itemSource) {
		this.itemSource = itemSource;
	}
	public int getItemTopping() {
		return itemTopping;
	}
	public void setItemTopping(int itemTopping) {
		this.itemTopping = itemTopping;
	}
	public int getItemSide() {
		return itemSide;
	}
	public void setItemSide(int itemSide) {
		this.itemSide = itemSide;
	}
	public int getItemIsSalad() {
		return itemIsSalad;
	}
	public void setItemIsSalad(int itemIsSalad) {
		this.itemIsSalad = itemIsSalad;
	}
	public int getItemIsOvened() {
		return itemIsOvened;
	}
	public void setItemIsOvened(int itemIsOvened) {
		this.itemIsOvened = itemIsOvened;
	}
	public int getItemIsSet() {
		return itemIsSet;
	}
	public void setItemIsSet(int itemIsSet) {
		this.itemIsSet = itemIsSet;
	}
	public int getItemQuantity() {
		return itemQuantity;
	}
	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}
	public double getItemDiscntRate() {
		return itemDiscntRate;
	}
	public void setItemDiscntRate(double itemDiscntRate) {
		this.itemDiscntRate = itemDiscntRate;
	}
	public int getItemDiscntCost() {
		return itemDiscntCost;
	}
	public void setItemDiscntCost(int itemDiscntCost) {
		this.itemDiscntCost = itemDiscntCost;
	}
	
	
}
