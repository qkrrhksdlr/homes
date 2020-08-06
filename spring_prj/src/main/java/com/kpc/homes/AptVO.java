package com.kpc.homes;

public class AptVO {

	//파란글씨 : Property
	private long seq;
	private String gu;
	private String dong;
	private String addr1;
	private String addr2;
	private String apt;
	private String gubun;
	private String area;
	private String conym;
	private String price;
	private String deposit;
	private String mrent;
	private String floor;
	private String archyear;
	private String street;
	
	
	
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
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
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
	public String getConym() {
		return conym;
	}
	public void setConym(String conym) {
		this.conym = conym;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getMrent() {
		return mrent;
	}
	public void setMrent(String mrent) {
		this.mrent = mrent;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getArchyear() {
		return archyear;
	}
	public void setArchyear(String archyear) {
		this.archyear = archyear;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	
	
	@Override
	public String toString() {
		return "AptVO [seq=" + seq + ", gu=" + gu + ", dong=" + dong + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", apt=" + apt + ", gubun=" + gubun + ", area=" + area + ", conym=" + conym + ", price=" + price
				+ ", deposit=" + deposit + ", mrent=" + mrent + ", floor=" + floor + ", archyear=" + archyear
				+ ", street=" + street + "]";
	}
	
	
	


	
	
}
