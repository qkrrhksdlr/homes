package com.kpc.homes;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kpc.homes.AptVO;

@RestController   //rest 
public class AptRestController {

	@Autowired
	AptServiceImpl svc;	

    //구글맵 파라미터
	@RequestMapping(value = "/googlemap.do", method = RequestMethod.GET)
	public ArrayList<AptVO> aptmap(Model model
			,@RequestParam(value="clat", required=false) String clat
			,@RequestParam(value="clng", required=false) String clng
			,@RequestParam(value="searchKey", required=false) String searchKey
			,@RequestParam(value="searchStr", required=false) String searchStr
			,HttpServletRequest request, HttpServletResponse response) {

      ArrayList<AptVO> list = svc.svcGooglemap(searchKey, searchStr);
      System.out.println("구글맵데이터:"+list);               
      return list;      
   }   

   //매매 차트
   @RequestMapping(value = "/aptmchart.do", method = RequestMethod.GET)
   public ArrayList<AptVO> aptmchart(Model model
         ,@RequestParam(value="aptStr", required=false) String aptStr
         ,@RequestParam(value="areaStr", required=false) String areaStr
         ,HttpServletRequest request, HttpServletResponse response) {
      
      System.out.println("매매차트");
      ArrayList<AptVO> list = svc.svcMAptChart(aptStr, areaStr);
      System.out.println(list);
      
      return list;
   }
   
   //전월세 차트
   @RequestMapping(value = "/aptzwchart.do", method = RequestMethod.GET)
   public ArrayList<AptVO> aptzwchart(Model model
         ,@RequestParam(value="aptStr", required=false) String aptStr
         ,@RequestParam(value="areaStr", required=false) String areaStr
         ,HttpServletRequest request, HttpServletResponse response) {
      
      System.out.println("전월세차트");
      ArrayList<AptVO> list = svc.svcZWAptChart(aptStr, areaStr);
      System.out.println(list);
      
      return list;
   }
   
   //가격지수 차트
   @RequestMapping(value = "/aptindexchart.do", method = RequestMethod.GET)
   public ArrayList<AptVO> aptindexchart(Model model
         ,HttpServletRequest request, HttpServletResponse response) {
      
      System.out.println("가격지수차트");
      ArrayList<AptVO> list = svc.svcAptIndex();
      System.out.println(list);
      
      return list;
   }

   //아파트비율 차트
   @RequestMapping(value = "/aptratiochart.do", method = RequestMethod.GET)
   public ArrayList<AptVO> aptratiochart(Model model
         ,HttpServletRequest request, HttpServletResponse response) {
      
      System.out.println("아파트비율차트");
      ArrayList<AptVO> list = svc.svcAptRatio();
      System.out.println(list);
      
      return list;
   }

}

