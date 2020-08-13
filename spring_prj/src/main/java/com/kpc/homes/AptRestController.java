package com.kpc.homes;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kpc.homes.AptVO;

@RestController   //restful 
public class AptRestController {

   @Autowired
   AptServiceImpl svc;   

   //맵보기
   @RequestMapping(value = "/googlemap.do", method = RequestMethod.GET)
   public ArrayList<AptVO> aptMap(Model model
         ,@RequestParam(value="clat", required=false) String clat
         ,@RequestParam(value="clng", required=false) String clng
         ,@RequestParam(value="searchKey", required=false) String searchKey
         ,@RequestParam(value="searchStr", required=false) String searchStr
         ,HttpServletRequest request, HttpServletResponse response) {

	  System.out.println("구글맵");  
      ArrayList<AptVO> list = svc.svcGoogleMap(searchKey, searchStr);
      System.out.println(list); 
      
      return list;      
      }   
   
   //맵클릭
   @RequestMapping(value = "/clickmap.do", method = RequestMethod.GET)
   public ArrayList<AptVO> aptMapClick(Model model
         ,@RequestParam(value="clat", required=false) String clat
         ,@RequestParam(value="clng", required=false) String clng
         ,@RequestParam(value="aptStr", required=false) String aptStr
         ,HttpServletRequest request, HttpServletResponse response) {

	  System.out.println("맵클릭"); 
      ArrayList<AptVO> list = svc.svcClickMap(aptStr);
      System.out.println(list);        
      
      return list;      
      }   
   
   //매매 차트
   @RequestMapping(value = "/aptdealchart.do", method = RequestMethod.GET)
   public ArrayList<ChartVO> aptDealChart(Model model
         ,@RequestParam(value="aptStr", required=false) String aptStr
         ,@RequestParam(value="areaStr", required=false) String areaStr
         ,HttpServletRequest request, HttpServletResponse response) {
      
      System.out.println("매매차트");
      ArrayList<ChartVO> list = svc.svcDealAptChart(aptStr, areaStr);
      System.out.println(list);
      
      return list;
      }
   
   //전세 차트
   @RequestMapping(value = "/aptrentchart.do", method = RequestMethod.GET)
   public ArrayList<ChartVO> aptRentChart(Model model
         ,@RequestParam(value="aptStr", required=false) String aptStr
         ,@RequestParam(value="areaStr", required=false) String areaStr
         ,HttpServletRequest request, HttpServletResponse response) {
      
      System.out.println("전세차트");
      ArrayList<ChartVO> list = svc.svcRentAptChart(aptStr, areaStr);
      System.out.println(list);
      
      return list;
      }
   
   //가격지수 차트
   @RequestMapping(value = "/aptindexchart.do", method = RequestMethod.GET)
   public ArrayList<ChartVO> aptIndexChart(Model model
         ,HttpServletRequest request, HttpServletResponse response) {
      
      System.out.println("가격지수차트");
      ArrayList<ChartVO> list = svc.svcAptIndexChart();
      System.out.println(list);
      
      return list;
      }
   
   //아파트비율 차트
   @RequestMapping(value = "/aptratiochart.do", method = RequestMethod.GET)
   public ArrayList<ChartVO> aptRatioChart(Model model
         ,HttpServletRequest request, HttpServletResponse response) {
      
      System.out.println("아파트비율차트");
      ArrayList<ChartVO> list = svc.svcAptRatioChart();
      System.out.println(list);
      
      return list;
   }
   
   //아파트비율 차트
   @RequestMapping(value = "/aptarchchart.do", method = RequestMethod.GET)
   public ArrayList<ChartVO> aptArchChart(Model model
         ,HttpServletRequest request, HttpServletResponse response) {
      
      System.out.println("아파트건축연도차트");
      ArrayList<ChartVO> list = svc.svcAptArchChart();
      System.out.println(list);
      
      return list;
   }
}
