package com.kpc.homes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kpc.common.PagingUtil;

@WebServlet("/aptlist")
public class AptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//AJAX 테스트용 리스트
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();

		String lat = request.getParameter("clat");
		String lng = request.getParameter("clng");
		String gu = request.getParameter("searchKey");
		String dong = request.getParameter("searchBtn");
		String apt = request.getParameter("searchBtn");
		String street = request.getParameter("searchBtn");

		AptVO vo = new AptVO();
		vo.setApt(apt);
		vo.setGu(gu);
		vo.setDong(dong);
		vo.setStreet(street);
		vo.setLng(lng);
		vo.setLat(lat);

		
		AptImpl impl = new AptImpl();
		
		ArrayList<AptVO> list = new ArrayList<AptVO>();
		if(!vo.getDong().equals("") || !vo.getStreet().equals("")) {			//CityCode, 동이름 둘다 null이 아니라면
			list = impl.selectByCount(vo);				//동명 검색시 약국 찾기					impl.selectByCount 실행
		} else if(!vo.getLat().equals("") && !vo.getLng().equals("")) {					//위도, 경도 둘다 null이 아니라면 
			list = impl.selectByLatLng(vo);				//위치로 약국 찾기					impl.selectByLatLng 실행
		}
		
		//객체(list)를  <--> 글자(String)로 변환
		String jsonStr = gson.toJson(list);
		
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(jsonStr); 
	}

}
