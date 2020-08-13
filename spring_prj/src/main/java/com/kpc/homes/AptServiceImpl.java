package com.kpc.homes;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.ArrayList;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpc.homes.AptVO;
import com.kpc.mapper.AptMapper;

@Service
public class AptServiceImpl implements AptService {

	@Autowired
	AptMapper dao;	
	
	//목록보기
	@Override
	public ArrayList<AptVO> svcAptList(String searchKey, String searchStr) {
		System.out.println("목록보기 서비스.....");
		ArrayList<AptVO> list = dao.aptList(searchKey, searchStr);
		return list;
	}

	//상세보기
	@Override
	public ArrayList<AptVO> svcAptView(String aptStr, String areaStr) {
		System.out.println("상세보기 서비스.....");
		ArrayList<AptVO> list = dao.aptView(aptStr, areaStr);
		return list;
	}
	
	//맵보기
	@Override
	public ArrayList<AptVO> svcGoogleMap(String searchKey, String searchStr) {
		System.out.println("맵보기 서비스.....");
		ArrayList<AptVO> list = dao.googleMap(searchKey, searchStr);
		return list;
	}
	
	//맵클릭
	@Override
	public ArrayList<AptVO> svcClickMap(String aptStr) {
		System.out.println("맵클릭 서비스.....");
		ArrayList<AptVO> list = dao.clickMap(aptStr);
		return list;
	}
	
	//매매차트
	@Override
	public ArrayList<ChartVO> svcDealAptChart(String aptStr, String areaStr) {
		System.out.println("매매차트 서비스.....");
		ArrayList<ChartVO> list = dao.aptDealChart(aptStr, areaStr);
		return list;
	}
	
	//전월세차트
	@Override
	public ArrayList<ChartVO> svcRentAptChart(String aptStr, String areaStr) {
		System.out.println("전세차트 서비스.....");
		ArrayList<ChartVO> list = dao.aptRentChart(aptStr, areaStr);
		return list;
	}

	//가격지수
	@Override
	public ArrayList<ChartVO> svcAptIndexChart() {
		System.out.println("가격지수 서비스.....");
		ArrayList<ChartVO> list = dao.aptIndexChart();
		return list;
	}

	//아파트비율
	@Override
	public ArrayList<ChartVO> svcAptRatioChart() {
		System.out.println("아파트비율 서비스.....");
		ArrayList<ChartVO> list = dao.aptRatioChart();
		return list;
	}
		
	//오늘의 뉴스
	@Override
	public ArrayList<CrawlVO> svcAptNews() {
		makeCert();
		
		String URL = "https://land.naver.com/news/field.nhn";
		ArrayList<CrawlVO> list = new ArrayList<CrawlVO>();
		CrawlVO vo = null;
		
		try {		
			Document doc = Jsoup.connect(URL).get();										//Jsoup.connect(url).get();
			Elements eles = doc.select("#content .section_headline .headline_list li dl");	//끌어올 시작점 지정
			
			for(Element ele : eles) {
				vo = new CrawlVO();
				vo.setImg(ele.select("dt.photo a img").attr("src"));
				vo.setUrl("https://land.naver.com" + ele.select("dt a").attr("href"));
				vo.setTitle(ele.select("dt a").text());
				vo.setContents(ele.select("dd").text());
				vo.setWriting(ele.select("dd span.writing").text());
				vo.setDate(ele.select("dd span.date").text());			
				list.add(vo);
			}			
		} catch(IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//아파트 단지 세부 정보
	@Override
	public ArrayList<CrawlVO> svcAptInfo(String aptStr) {
		makeCert();
		
		ArrayList<CrawlVO> list = new ArrayList<CrawlVO>();
		String URL = "https://search.naver.com/search.naver?sm=tab_sly.hst&where=nexearch&query="+aptStr+"&oquery="+aptStr;
		CrawlVO vo = null;
		
		try {
			Document doc = Jsoup.connect(URL).get();									//Jsoup.connect(url).get();	
			Elements eles= doc.select("#main_pack div div .content_group._unit_wrap");	//끌어올 시작점 지정
			
			for(Element ele : eles) {
				vo = new CrawlVO();
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
		} catch(IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//SSL 통신 인증서 관련 코드
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
}
