package com.kpc.homes;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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

import com.google.gson.Gson;
import com.kpc.homes.AptVO;


@Controller
public class AptController {
	
	private static final Logger logger = LoggerFactory.getLogger(AptController.class);

	@Autowired
	AptServiceImpl svc;
	

	
	@RequestMapping(value = "/aptlist.do", method = RequestMethod.GET)
	public String aptlist(Model model
			,@RequestParam(value="searchKey", required=false) String searchKey
			,@RequestParam(value="searchStr", required=false) String searchStr) {

		ArrayList<AptVO> list = svc.svcAptlist(searchKey, searchStr);

		model.addAttribute("APTLISTKKK", list);
		return "apt_list";
	}
	
	
	
	
    //AJAX 테스트용 리스트
	@RequestMapping(value = "/googlemap.do", method = RequestMethod.GET)
	public ArrayList<AptVO> aptmap(Model model
			,HttpServletRequest request, HttpServletResponse response) {

		System.out.println("ajax요청");
		//기본값 설정
		Gson gson = new Gson();
		
    	String lat = request.getParameter("clat");  
    	String lng = request.getParameter("clng");
    	String searchKey = request.getParameter("searchKey");
    	String searchStr = request.getParameter("searchStr");
    			
		//forward는 화면 리로딩하므로 response로..
    	//list값을 보내는 방법은 forward밖에 없는데 forward는 화면리로딩이 됨 -> 동일 화면에서 text(IO)만 출력하도록 forward 대신 ajax
		ArrayList<AptVO> list = svc.svcGooglemap(searchKey, searchStr);
		System.out.println(list);
					
		//out.println("ok..."+list);		//문제점 : println은 IO(텍스트)출력 -> list를 println하면 list가 주소로 출력-> 주소가 아니라 객체 값을 출력하려면???
		//* JSON(객체) <-> String(텍스트) 변환 라이브러리(API) : gson, goxmson 등
			//글자->객체	: vo=gson.fromJson(str, Vo.class)
			//객체->글자	: String str = gson.toJson(list)
		
		//list객체를 String으로 변환
//		String jsonStr = gson.toJson(list);
		
		return list;
		
		
		
	}
	
	
	
	
	@RequestMapping(value = "/aptview.do", method = RequestMethod.GET)
	public String aptview(Model model
			,@RequestParam(value="aptStr", required=false) String aptStr
			,@RequestParam(value="areaStr", required=false) String areaStr) {

		ArrayList<AptVO> list = svc.svcAptview(aptStr, areaStr);
		
		model.addAttribute("APTVIEWKKK", list);
		return "apt_view";
			
	} 
	
	
	
	@RequestMapping(value = "/aptcount.do", method = RequestMethod.GET)
	public String aptcount(Model model) {

		String num = svc.svcAptCount();
		
		model.addAttribute("APTNUMKKK", num);
		return "apt_count";
			
	}
	
}
