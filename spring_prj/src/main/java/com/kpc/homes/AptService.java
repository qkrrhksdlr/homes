package com.kpc.homes;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kpc.homes.AptVO;

@Service
public interface AptService {
	
	public String svcAptCount();
	
	//글목록	
	public	ArrayList<AptVO> svcAptlist(String searchKey, String searchStr);

	//구글맵
	public	ArrayList<AptVO> svcGooglemap(String searchKey, String searchStr);

	//글상세보기	
	public  ArrayList<AptVO> svcAptview(String aptStr, String areaStr);

	//매매 차트
	public ArrayList<AptVO> svcMAptChart(String aptStr, String areaStr);
	
	//전월세 차트
	public ArrayList<AptVO> svcZWAptChart(String aptStr, String areaStr);
	
}
