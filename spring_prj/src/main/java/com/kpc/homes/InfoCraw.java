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


public class InfoCraw {
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
		
/*		String aptStr = "개나리래미안";
		InfoCraw info = new InfoCraw();
		ArrayList<InfoVO> list = info.getInfo(aptStr);

//		System.out.println(list.get(0).getTitle());
		for(InfoVO vo : list) {
			System.out.println(vo.toString());
		}*/
	}
	
	
	public ArrayList<InfoVO> getInfo(String aptStr) {	

//jsoup https 인증서 필요
		makeCert();

		ArrayList<InfoVO> list = new ArrayList<InfoVO>();
		String URL = "https://search.naver.com/search.naver?sm=tab_sly.hst&where=nexearch&query="+aptStr+"&oquery="+aptStr;
		
		try {
//Jsoup.connect(url).get();
			Document doc = Jsoup.connect(URL).get();	
				
//끌어올 시작점 지정
			Elements eles= doc.select("#main_pack div div .content_group._unit_wrap");

//for문으로 루프돌리면서 크롤링 (위치 : 마우스우클릭+copy selector)									
			for(Element ele : eles) {
				
				
				InfoVO vo = new InfoVO();
/*								
				name : 		#main_pack > div.sc.sp_nland._au_nland_apart_single > div.api_subject_bx._interest_wrap > div.content_group._unit_wrap > div.title_area > strong > a
				item type :	#main_pack > div.sc.sp_nland._au_nland_apart_single > div.api_subject_bx._interest_wrap > div.content_group._unit_wrap > div.title_area > div:nth-child(2) > span.item.type
			 	세대수 :		#main_pack > div.sc.sp_nland._au_nland_apart_single > div.api_subject_bx._interest_wrap > div.content_group._unit_wrap > div.title_area > div:nth-child(2) > span:nth-child(2)
				동수 :		#main_pack > div.sc.sp_nland._au_nland_apart_single > div.api_subject_bx._interest_wrap > div.content_group._unit_wrap > div.title_area > div:nth-child(2) > span:nth-child(3)
				준공년도 :		#main_pack > div.sc.sp_nland._au_nland_apart_single > div.api_subject_bx._interest_wrap > div.content_group._unit_wrap > div.title_area > div:nth-child(2) > span:nth-child(4)
				평형대 :		#main_pack > div.sc.sp_nland._au_nland_apart_single > div.api_subject_bx._interest_wrap > div.content_group._unit_wrap > div.title_area > div:nth-child(2) > span:nth-child(5)
				
				관리사무소 :	#main_pack > div.sc.sp_nland._au_nland_apart_single > div.api_subject_bx._interest_wrap > div.content_group._unit_wrap > div.bizinfo_area > div > div:nth-child(1) > div
				면적 : 		#main_pack > div.sc.sp_nland._au_nland_apart_single > div.api_subject_bx._interest_wrap > div.content_group._unit_wrap > div.bizinfo_area > div > div:nth-child(2) > div
				학군정보 : 	#main_pack > div.sc.sp_nland._au_nland_apart_single > div.api_subject_bx._interest_wrap > div.content_group._unit_wrap > div.bizinfo_area > div > div:nth-child(3) > div > a
				도로명주소 :	#main_pack > div.sc.sp_nland._au_nland_apart_single > div.api_subject_bx._interest_wrap > div.content_group._unit_wrap > div.bizinfo_area > div > div:nth-child(4) > div > ul > li:nth-child(1) > span
*/
				
				vo.setApt(ele.select(".title_area strong a").text());
				vo.setType(ele.select(".title_area div span.item.type").text());
				vo.setNumhouse(ele.select(".title_area .info_area span.item:nth-child(2)").text());
				vo.setNumbldg(ele.select(".title_area .info_area span.item:nth-child(3)").text());
				vo.setArchyear(ele.select(".title_area .info_area span.item:nth-child(4)").text());
				vo.setArea(ele.select(".title_area .info_area span.item:nth-child(5)").text());
				
				vo.setOffice(ele.select(".bizinfo_area .list_bizinfo div.item:nth-child(1) .txt").text());
				vo.setArealist(ele.select(".bizinfo_area .list_bizinfo div.item:nth-child(2) .txt").text());
				vo.setSchool(ele.select(".bizinfo_area .list_bizinfo div.item:nth-child(3) .txt").text());
				vo.setStreet(ele.select(".bizinfo_area .list_bizinfo div.item:nth-child(4) .txt").text());
				
				list.add(vo);
			}						
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return list;
	}
}


	
