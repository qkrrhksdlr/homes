package com.kpc.homes;

public class NewsVO {

	private String img;
	private String url;
	private String title;
	private String contents;
	private String writing;
	private String date;
	
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	public String getWriting() {
		return writing;
	}
	public void setWriting(String writing) {
		this.writing = writing;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "NewsVO [img=" + img + ", url=" + url + ", title=" + title + ", contents=" + contents + ", writing="
				+ writing + ", date=" + date + "]";
	}
	
	
	

	
	
	
	
}

