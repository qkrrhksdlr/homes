package com.kpc.board;
 
public class BoardVO {
	//프로퍼티(Property) : 파란글쓰
	private int bseq;
	private String title;
	private String contents;
	private String regid;
	private String regdate;
	
	
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegid() {
		return regid;
	}
	public void setRegid(String regid) {
		this.regid = regid;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "BoardVO [bseq=" + bseq + ", title=" + title + ", contents=" + contents + ", regid=" + regid
				+ ", regdate=" + regdate + "]";
	}
	
	
}
