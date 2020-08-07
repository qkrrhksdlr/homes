package com.kpc.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kpc.homes.AptVO;

@Repository
@Mapper
public interface AptMapper {

	//메서드명 = BoardMapper.xml에서 sql문의 id명과 일치 
	
	public String aptCount();

	public ArrayList<AptVO> aptlist(
			@Param("searchKey")  String searchKey
			,@Param("searchStr")  String searchStr);

	public ArrayList<AptVO> aptview(
			@Param("aptStr") String aptStr
			,@Param("areaStr") String areaStr);


}
