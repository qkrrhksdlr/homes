package com.kpc.homes;

public class InfoVO {

	private String apt;
	private String type;
	private String numhouse;
	private String numbldg;
	private String archyear;
	private String area;
	
	private String office;
	private String arealist;
	private String school;
	private String street;
	
	public String getApt() {
		return apt;
	}
	public void setApt(String apt) {
		this.apt = apt;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNumhouse() {
		return numhouse;
	}
	public void setNumhouse(String numhouse) {
		this.numhouse = numhouse;
	}
	public String getNumbldg() {
		return numbldg;
	}
	public void setNumbldg(String numbldg) {
		this.numbldg = numbldg;
	}
	public String getArchyear() {
		return archyear;
	}
	public void setArchyear(String archyear) {
		this.archyear = archyear;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public String getArealist() {
		return arealist;
	}
	public void setArealist(String arealist) {
		this.arealist = arealist;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	
	@Override
	public String toString() {
		return "InfoVO [apt=" + apt + ", type=" + type + ", numhouse=" + numhouse + ", numbldg=" + numbldg
				+ ", archyear=" + archyear + ", area=" + area + ", office=" + office + ", arealist=" + arealist
				+ ", school=" + school + ", street=" + street + "]";
	}
	

	
	
	
	
	
}

