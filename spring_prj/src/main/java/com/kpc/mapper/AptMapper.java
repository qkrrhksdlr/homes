package com.kpc.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kpc.homes.AptVO;

@Repository
@Mapper
public interface AptMapper {

	//메서드명 = BoardMapper.xml에서 sql문의 id명과 일치 11
	
	public String aptCount();

	//목록보기
	public ArrayList<AptVO> aptlist(
			@Param("searchKey")  String searchKey
			,@Param("searchStr")  String searchStr);

	//맵
	public ArrayList<AptVO> googlemap(
			@Param("searchKey")  String searchKey
			,@Param("searchStr")  String searchStr);

	//상세보기
	public ArrayList<AptVO> aptview(
			@Param("aptStr") String aptStr
			,@Param("areaStr") String areaStr);
	
	//매매차트
	public ArrayList<AptVO> aptmchart(
			@Param("aptStr") String aptStr
			,@Param("areaStr") String areaStr);
	
	//전월세차트
	public ArrayList<AptVO> aptzwchart(
			@Param("aptStr") String aptStr
			,@Param("areaStr") String areaStr);
	
	//가격지수
	public ArrayList<AptVO> aptindex(); 
	
	//아파트비율
	public ArrayList<AptVO> aptratio();
	
}
