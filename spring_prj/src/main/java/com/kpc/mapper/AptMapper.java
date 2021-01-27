package com.kpc.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kpc.homes.AptVO;
import com.kpc.homes.ChartVO;

@Repository
@Mapper
public interface AptMapper {
	//목록보기
	public ArrayList<AptVO> aptList(
			@Param("searchKey")  String searchKey
			,@Param("searchStr")  String searchStr);
	
	//상세보기
	public ArrayList<AptVO> aptView(
			@Param("aptStr") String aptStr
			,@Param("areaStr") String areaStr);
	
	//맵보기
	public ArrayList<AptVO> googleMap(
			@Param("searchKey")  String searchKey
			,@Param("searchStr")  String searchStr);
	
	//맵클릭
	public ArrayList<AptVO> clickMap(
			@Param("aptStr") String aptStr);

	//매매차트
	public ArrayList<ChartVO> aptDealChart(
			@Param("aptStr") String aptStr
			,@Param("areaStr") String areaStr);
	
	//전세차트
	public ArrayList<ChartVO> aptRentChart(
			@Param("aptStr") String aptStr
			,@Param("areaStr") String areaStr);
	
	//가격지수차트
	public ArrayList<ChartVO> aptIndexChart(); 
	
	//아파트비율차트
	public ArrayList<ChartVO> aptRatioChart();
	
	//아파트 건축연도 비율차트
	public ArrayList<ChartVO> aptArchChart();
}
