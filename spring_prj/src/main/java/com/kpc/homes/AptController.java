package com.kpc.homes;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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


@Controller
public class AptController {
	
	private static final Logger logger = LoggerFactory.getLogger(AptController.class);

	@Autowired
	AptServiceImpl svc;
	
	//목록보기
	@RequestMapping(value = "/aptlist.do", method = RequestMethod.GET)
	public String aptlist(Model model
			,@RequestParam(value="searchKey", required=false) String searchKey
			,@RequestParam(value="searchStr", required=false) String searchStr) {
		
		ArrayList<AptVO> list = svc.svcAptlist(searchKey, searchStr);

		model.addAttribute("APTLISTKKK", list);
		return "apt_list";
	}

	//상세보기
	@RequestMapping(value = "/aptview.do", method = RequestMethod.GET)
	public String aptview(Model model
			,@RequestParam(value="aptStr", required=false) String aptStr
			,@RequestParam(value="areaStr", required=false) String areaStr) {
		ArrayList<AptVO> list = svc.svcAptview(aptStr, areaStr);	
		model.addAttribute("APTVIEWKKK", list);
		return "apt_view";	
	} 
	
	//카운트
	@RequestMapping(value = "/aptcount.do", method = RequestMethod.GET)
	public String aptcount(Model model) {

		String num = svc.svcAptCount();
		
		model.addAttribute("APTNUMKKK", num);
		return "apt_count";
	}
	

		
}
