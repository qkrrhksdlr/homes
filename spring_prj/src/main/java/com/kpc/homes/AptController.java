package com.kpc.homes;

import java.util.ArrayList;	

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpc.homes.AptVO;

@Controller
public class AptController {
   private static final Logger logger = LoggerFactory.getLogger(AptController.class);

   @Autowired
   AptServiceImpl svc;
   
   //메인화면 (오늘의 부동산 시장 동향 뉴스)
   @RequestMapping(value = "/main.do", method = RequestMethod.GET)
   public String news(Model model) {
	   
	  ArrayList<CrawlVO> list = svc.svcAptNews();
      model.addAttribute("NEWSLISTKKK", list);
      
      return "admin/apt_main";
   } 
   
   //목록보기
   @RequestMapping(value = "/aptlist.do", method = RequestMethod.GET)
   public String aptlist(Model model
         ,@RequestParam(value="searchKey", required=false) String searchKey
         ,@RequestParam(value="searchStr", required=false) String searchStr) {
      
      ArrayList<AptVO> list = svc.svcAptList(searchKey, searchStr);
      model.addAttribute("APTLISTKKK", list);
      
      return "admin/apt_list";
   }

   //상세보기
   @RequestMapping(value = "/aptview.do", method = RequestMethod.GET)
   public String aptview(Model model
         ,@RequestParam(value="aptStr", required=false) String aptStr
         ,@RequestParam(value="areaStr", required=false) String areaStr) {
	   
      ArrayList<AptVO> list = svc.svcAptView(aptStr, areaStr);   
      model.addAttribute("APTVIEWKKK", list);
    
      ArrayList<CrawlVO> detailList = svc.svcAptInfo(aptStr);
      model.addAttribute("AptInfoKKK", detailList);
      
      return "admin/apt_view";
   }  
}