package com.kpc.homes;

import java.io.IOException;

import org.jsoup.Jsoup; 
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import javax.net.ssl.*;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.ArrayList;


//JSOUP : 웹 크롤링을 위한 Open API

//* getElementById(String id) : Element 객체를 반환합니다. 하나를 반환합니다. 없으면 null 을 반환합니다.
//* getElementsByTag(String tag) : Elements 객체를 반환합니다. 없으면 size() 가 0 입니다.
//* getElementsByClass(String className) : Elements 객체를 반환합니다. 없으면 size() 가 0 입니다.

//***getElementByID("ytn_list_v2014") : # = id접근 (id는 페이지당 단 하나)
//***getElementByClass(String Classname) : . = class접근

//* doc.select("a") : <a> 요소를 모두 선택합니다.
//* doc.select("#logo") : id="logo" 인 요소를 선택합니다.
//* doc.select(".head") : class="head"인 요소들을 선택합니다.
//* doc.select("[href]") : href 속성을 가진 요소들을 선택합니다.
//* doc.select("[width=500]") : width 속성의 값이 500인 모든 요소들을 선택합니다.


public class NewsCraw {
	//----------- SSL 통신 인증서 관련 코드 -------------
	public void makeCert() {
		try {
			
	        TrustManager[] trustAllCerts = new TrustManager[]{new X509TrustManager(){
	            public X509Certificate[] getAcceptedIssuers(){return new X509Certificate[0];}
	            public void checkClientTrusted(X509Certificate[] certs, String authType){}
	            public void checkServerTrusted(X509Certificate[] certs, String authType){}
	        }};

	        SSLContext sc; 
		    sc = SSLContext.getInstance("TLS");
			sc.init(null, trustAllCerts, new SecureRandom());
	        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		} 
	}	
	
	public static void main(String[] args) {
		NewsCraw news = new NewsCraw();
		ArrayList<NewsVO> list = news.getNews();

//		System.out.println(list.get(0).getTitle());
		for(NewsVO vo : list) {
			System.out.println(vo.toString());
		}
	}
	
	
	public ArrayList<NewsVO> getNews() {	
//		Jsoup jsoup = new Jsoup();		//new Jsoup에 에러 -> Jsoup은 static

//jsoup https 인증서 필요
		makeCert();

		ArrayList<NewsVO> list = new ArrayList<NewsVO>();
		
		try {
//Jsoup.connect(url).get();
			Document doc = Jsoup.connect("https://land.naver.com/news/field.nhn").get();	

//끌어올 시작점 지정
			Elements eles = doc.select("#content .section_headline .headline_list li dl");

//for문으로 루프돌리면서 크롤링 (위치 : 마우스우클릭+copy selector)									
			for(Element ele : eles) {
				NewsVO vo = new NewsVO();
				
/*				#content > div.section_headline > ul > li:nth-child(1) > dl > dt.photo > a > img
				#content > div.section_headline > ul > li:nth-child(1) > dl > dt:nth-child(2) > a
				#content > div.section_headline > ul > li:nth-child(1) > dl > dd
				#content > div.section_headline > ul > li:nth-child(1) > dl > dd > span.writing
				#content > div.section_headline > ul > li:nth-child(1) > dl > dd > span.date*/
				
				vo.setImg(ele.select("dt.photo a img").attr("src"));
				vo.setUrl("https://land.naver.com" + ele.select("dt a").attr("href"));
				vo.setTitle(ele.select("dt a").text());
				vo.setContents(ele.select("dd").text());
				vo.setWriting(ele.select("dd span.writing").text());
				vo.setDate(ele.select("dd span.date").text());
				
				list.add(vo);
			}						
		}
		catch (IOException e) {
			e.printStackTrace();
		} 
		return list;
	}
}


	
