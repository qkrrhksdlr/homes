package com.kpc.homes;

public class ForSaleVO {

	
	private String apt;
	private String gubun;
	private String price;
	private String mrent;
	private String spec;
	private String comment;
	private String agent;
	private String source;
	private String confirmdate;
	
	
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMrent() {
		return mrent;
	}
	public void setMrent(String mrent) {
		this.mrent = mrent;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getConfirmdate() {
		return confirmdate;
	}
	public void setConfirmdate(String confirmdate) {
		this.confirmdate = confirmdate;
	}
	
	
	@Override
	public String toString() {
		return "ForSaleVO [apt=" + apt + ", gubun=" + gubun + ", price=" + price + ", mrent=" + mrent + ", spec=" + spec
				+ ", comment=" + comment + ", agent=" + agent + ", source=" + source + ", confirmdate=" + confirmdate
				+ "]";
	}
	
	
	
	
	
	
}
