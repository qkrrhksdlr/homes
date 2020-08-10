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

import com.google.gson.Gson;
import com.kpc.homes.AptVO;

@RestController	//rest 
public class AptRestController {
	@Autowired
	AptServiceImpl svc;	
	
    //구글맵 파라미터
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
    			
		ArrayList<AptVO> list = svc.svcGooglemap(searchKey, searchStr);
		System.out.println(list);
					
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
		
	
}
