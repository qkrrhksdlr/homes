package com.kpc.homes;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpc.homes.AptVO;
import com.kpc.mapper.AptMapper;

@Service
public class AptServiceImpl implements AptService {

	@Autowired
	AptMapper dao;	//BoardMapper라는 namespace에 있는 id를 가져오게된다

	//카운트
	@Override
	public String svcAptCount() {
		String num = dao.aptCount();
		return num;
	}
	
	//목록보기
	@Override
	public ArrayList<AptVO> svcAptlist(String searchKey, String searchStr) {
		ArrayList<AptVO> list = dao.aptlist(searchKey, searchStr);
		return list;
	}

	//맵
	@Override
	public ArrayList<AptVO> svcGooglemap(String searchKey, String searchStr) {
		System.out.println("구글맵서비스.....");
		ArrayList<AptVO> list = dao.googlemap(searchKey, searchStr);
		return list;
	}
	
	//상세보기
	@Override
	public ArrayList<AptVO> svcAptview(String aptStr, String areaStr) {
		System.out.println("VIEW서비스.....");
		ArrayList<AptVO> list = dao.aptview(aptStr, areaStr);
		return list;
	}
	
	//매매
	@Override
	public ArrayList<AptVO> svcMAptChart(String aptStr, String areaStr) {
		System.out.println("매매차트서비스.....");
		ArrayList<AptVO> list = dao.aptmchart(aptStr, areaStr);
		return list;
	}
	
	//전월세
	@Override
	public ArrayList<AptVO> svcZWAptChart(String aptStr, String areaStr) {
		System.out.println("전월세차트서비스.....");
		ArrayList<AptVO> list = dao.aptzwchart(aptStr, areaStr);
		return list;
	}

	//가격지수
	@Override
	public ArrayList<AptVO> svcAptIndex() {
		System.out.println("가격지수서비스.....");
		ArrayList<AptVO> list = dao.aptindex();
		return list;
	}

	//아파트비율
	@Override
	public ArrayList<AptVO> svcAptRatio() {
		System.out.println("아파트비율서비스.....");
		ArrayList<AptVO> list = dao.aptratio();
		return list;
	}
	
	
	
	
}
