package com.kpc.homes;

public class AptVO {

	//파란글씨 : Property
	private long seq;
	private String gu;
	private String dong;
	private int addr1;
	private int addr2;
	private String apt;
	private String gubun;
	private String area;
	private int conym;
	private int price;
	private int deposit;
	private int mrent;
	private int floor;
	private int archyear;
	private String street;
	
	private String searchKey;
	private String searchStr;
	private String aptStr;
	private String areaStr;

	private int lat;
	private int lng;
	public long getSeq() {
		return seq;
	}
	public void setSeq(long seq) {
		this.seq = seq;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public int getAddr1() {
		return addr1;
	}
	public void setAddr1(int addr1) {
		this.addr1 = addr1;
	}
	public int getAddr2() {
		return addr2;
	}
	public void setAddr2(int addr2) {
		this.addr2 = addr2;
	}
	public String getApt() {
		return apt;
	}
	public void setApt(String apt) {
		this.apt = apt;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getConym() {
		return conym;
	}
	public void setConym(int conym) {
		this.conym = conym;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getMrent() {
		return mrent;
	}
	public void setMrent(int mrent) {
		this.mrent = mrent;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public int getArchyear() {
		return archyear;
	}
	public void setArchyear(int archyear) {
		this.archyear = archyear;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchStr() {
		return searchStr;
	}
	public void setSearchStr(String searchStr) {
		this.searchStr = searchStr;
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
	public int getLat() {
		return lat;
	}
	public void setLat(int lat) {
		this.lat = lat;
	}
	public int getLng() {
		return lng;
	}
	public void setLng(int lng) {
		this.lng = lng;
	}
	
	
	@Override
	public String toString() {
		return "AptVO [seq=" + seq + ", gu=" + gu + ", dong=" + dong + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", apt=" + apt + ", gubun=" + gubun + ", area=" + area + ", conym=" + conym + ", price=" + price
				+ ", deposit=" + deposit + ", mrent=" + mrent + ", floor=" + floor + ", archyear=" + archyear
				+ ", street=" + street + ", searchKey=" + searchKey + ", searchStr=" + searchStr + ", aptStr=" + aptStr
				+ ", areaStr=" + areaStr + ", lat=" + lat + ", lng=" + lng + "]";
	}

	

	
	
	
}
