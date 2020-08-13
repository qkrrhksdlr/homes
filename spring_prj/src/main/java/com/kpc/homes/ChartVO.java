package com.kpc.homes;

public class ChartVO {
	private String gu;
	private int apt_cnt;
	
	private int year;
	private double deal_index;
	private double rent_index;
	
	private int conym;
	private int deposit;
	private int price;
	private String aptStr;
	private String areaStr;
	
	private int y1990_1999;
	
	public int getY1990_1999() {
		return y1990_1999;
	}
	public void setY1990_1999(int y1990_1999) {
		this.y1990_1999 = y1990_1999;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getConym() {
		return conym;
	}
	public void setConym(int conym) {
		this.conym = conym;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public int getApt_cnt() {
		return apt_cnt;
	}
	public void setApt_cnt(int apt_cnt) {
		this.apt_cnt = apt_cnt;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public double getDeal_index() {
		return deal_index;
	}
	public void setDeal_index(double deal_index) {
		this.deal_index = deal_index;
	}
	public double getRent_index() {
		return rent_index;
	}
	public void setRent_index(double rent_index) {
		this.rent_index = rent_index;
	}
	public String getAptStr() {
		return aptStr;
	}
	public void setAptStr(String aptStr) {
		this.aptStr = aptStr;
	}
	public String getAreaStr() {
		return areaStr;
	}
	public void setAreaStr(String areaStr) {
		this.areaStr = areaStr;
	}
	
	@Override
	public String toString() {
		return "ChartVO [gu=" + gu + ", apt_cnt=" + apt_cnt + ", year=" + year + ", deal_index=" + deal_index
				+ ", rent_index=" + rent_index + ", conym=" + conym + ", deposit=" + deposit + ", price=" + price
				+ ", aptStr=" + aptStr + ", areaStr=" + areaStr + ", y1990_1999=" + y1990_1999 + "]";
	}	
}
