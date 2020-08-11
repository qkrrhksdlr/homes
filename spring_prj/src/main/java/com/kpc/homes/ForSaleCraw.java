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


public class ForSaleCraw {
	
	
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
		ForSaleCraw forsale = new ForSaleCraw();
		ArrayList<ForSaleVO> list = forsale.getData();

//		System.out.println(list.get(0).getTitle());
		for(ForSaleVO vo : list) {
			System.out.println(vo.toString());
		}
	}
	
	
	public ArrayList<ForSaleVO> getData() {	
//		Jsoup jsoup = new Jsoup();		//new Jsoup에 에러 -> Jsoup은 static

//jsoup https 인증서 필요
		makeCert();

		ArrayList<ForSaleVO> list = new ArrayList<ForSaleVO>();
		
		try {
//Jsoup.connect(url).get();
			Document doc = Jsoup.connect("https://new.land.naver.com/complexes/18213?ms=37.498452,127.046103,17&a=APT:ABYG:JGC&e=RETAIL").get();	

//끌어올 시작점 지정
			Elements eles = doc.select("#articleListArea div:nth-child(1) div");

			
//for문으로 루프돌리면서 크롤링 (위치 : 마우스우클릭+copy selector)									
			for(Element ele : eles) {
				ForSaleVO vo = new ForSaleVO();

/*				매물명	#articleListArea div:nth-child(1) div > a div.item_title span
				구분		#articleListArea > div:nth-child(1) > div > a div.price_line span.type
				가격		#articleListArea > div:nth-child(1) > div > a div.price_line span.price
				월세		#articleListArea > div:nth-child(1) > div > a div.price_line span.price span
				스펙		#articleListArea > div:nth-child(1) > div > a div.info_area p:nth-child(1) span
				커멘트	#articleListArea > div:nth-child(1) > div > a div.info_area p:nth-child(2) span
				공인중개사	#articleListArea > div:nth-child(1) > div > div.cp_area div span:nth-child(2) a
				정보출처	#articleListArea > div:nth-child(1) > div > div.cp_area div span:nth-child(1) a
				확인일자	#articleListArea > div:nth-child(1) > div > div.label_area span em.data
				*/
				
				vo.setApt(ele.select("a div.item_title span").text());
				vo.setGubun(ele.select("a div.price_line span.type").text());
				vo.setPrice(ele.select("a div.price_line span.price").text());
				vo.setMrent(ele.select("a div.price_line span.price span").text());
				vo.setSpec(ele.select("a div.info_area p:nth-child(1) span").text());
				vo.setComment(ele.select("a div.info_area p:nth-child(2) span").text());
				vo.setAgent(ele.select("div.cp_area div span:nth-child(2) a").text());
				vo.setSource(ele.select("div.cp_area div span:nth-child(1) a").text());
				vo.setConfirmdate(ele.select("div.label_area span em.data").text());
				
				list.add(vo);
			}					
		}
		catch (IOException e) {
			e.printStackTrace();
		} 
		return list;
		
	}
}


	
