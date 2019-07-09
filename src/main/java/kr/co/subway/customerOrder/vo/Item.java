package kr.co.subway.customerOrder.vo;

public class Item {
	private int itemIdx;
	private int itemCusoIdx;
	private int itemBread;
	private int itemMain;
	private int itemVegi;
	private int itemCheese;
	private int itemSource;
	private int itemTopping;
	private int itemSide;
	private int itemIsSalad;
	private int itemIsOvened;
	private int itemSet;
	private int itemQuantity;
	private double itemDiscntRate;
	private int itemDiscntCost;
	public Item() {
		super();
	}
	public Item(int itemIdx, int itemCusoIdx, int itemBread, int itemMain, int itemVegi, int itemCheese, int itemSource,
			int itemTopping, int itemSide, int itemIsSalad, int itemIsOvened, int itemSet, int itemQuantity,
			double itemDiscntRate, int itemDiscntCost) {
		super();
		this.itemIdx = itemIdx;
		this.itemCusoIdx = itemCusoIdx;
		this.itemBread = itemBread;
		this.itemMain = itemMain;
		this.itemVegi = itemVegi;
		this.itemCheese = itemCheese;
		this.itemSource = itemSource;
		this.itemTopping = itemTopping;
		this.itemSide = itemSide;
		this.itemIsSalad = itemIsSalad;
		this.itemIsOvened = itemIsOvened;
		this.itemSet = itemSet;
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
	public int getItemCusoIdx() {
		return itemCusoIdx;
	}
	public void setItemCusoIdx(int itemCusoIdx) {
		this.itemCusoIdx = itemCusoIdx;
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
	public int getItemSet() {
		return itemSet;
	}
	public void setItemSet(int itemSet) {
		this.itemSet = itemSet;
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
