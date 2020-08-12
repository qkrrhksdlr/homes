package com.kpc.homes;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kpc.homes.AptVO;
import com.kpc.homes.NewsVO;

@Controller
public class AptController {
   
   private static final Logger logger = LoggerFactory.getLogger(AptController.class);

 
   @Autowired
   AptServiceImpl svc;
   
   //목록보기
   @RequestMapping(value = "/aptlist.do", method = RequestMethod.GET)
   //@RequestMapping(value = "http://localhost/admin/index4.jsp", method = RequestMethod.GET)
   public String aptlist(Model model
         ,@RequestParam(value="searchKey", required=false) String searchKey
         ,@RequestParam(value="searchStr", required=false) String searchStr) {
      
      ArrayList<AptVO> list = svc.svcAptlist(searchKey, searchStr);

      model.addAttribute("APTLISTKKK", list);
      //return "apt_list";
      return "admin/index4";
   }

   //상세보기
   @RequestMapping(value = "/aptview.do", method = RequestMethod.GET)
   public String aptview(Model model
         ,@RequestParam(value="aptStr", required=false) String aptStr
         ,@RequestParam(value="areaStr", required=false) String areaStr) {
	   
      ArrayList<AptVO> list = svc.svcAptview(aptStr, areaStr);   
      model.addAttribute("APTVIEWKKK", list);
      //return "apt_view";
   
      InfoCraw info = new InfoCraw();
      ArrayList<InfoVO> list1 = info.getInfo(aptStr);
      model.addAttribute("AptInfoKKK", list1);
      return "admin/index5";
   } 
   
   //카운트
   @RequestMapping(value = "/aptcount.do", method = RequestMethod.GET)
   public String aptcount(Model model) {

      String num = svc.svcAptCount();
      
      model.addAttribute("APTNUMKKK", num);
      return "apt_count";
   }
   
   //오늘의 부동산 시장 동향 뉴스
   @RequestMapping(value = "/main.do", method = RequestMethod.GET)
   public String news(Model model) {

      NewsCraw news = new NewsCraw();
      ArrayList<NewsVO> list = news.getNews();

      model.addAttribute("NEWSLISTKKK", list);
      return "admin/index3";
   }
      

   
   
   
}