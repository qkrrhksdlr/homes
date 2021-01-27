package com.kpc.homes;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kpc.homes.AptVO;

@Service
public interface AptService {
	//목록보기	
	public	ArrayList<AptVO> svcAptList(String searchKey, String searchStr);

	//상세보기	
	public  ArrayList<AptVO> svcAptView(String aptStr, String areaStr);
	
	//맵보기
	public	ArrayList<AptVO> svcGoogleMap(String searchKey, String searchStr);

	//맵클릭
	public	ArrayList<AptVO> svcClickMap(String aptStr);
	
	//매매 차트
	public ArrayList<ChartVO> svcDealAptChart(String aptStr, String areaStr);
	
	//전세 차트
	public ArrayList<ChartVO> svcRentAptChart(String aptStr, String areaStr);
	
	//가격지수 차트
	public ArrayList<ChartVO> svcAptIndexChart();
	
	//아파트 비율차트
	public ArrayList<ChartVO> svcAptRatioChart();
	
	//아파트 건축연도 차트
	public ArrayList<ChartVO> svcAptArchChart();
	
	//오늘의 뉴스
	public ArrayList<CrawlVO> svcAptNews();
	
	//아파트 단지 세부 정보
	public ArrayList<CrawlVO> svcAptInfo(String aptStr);	
}