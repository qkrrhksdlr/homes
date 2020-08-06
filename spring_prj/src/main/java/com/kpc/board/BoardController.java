package com.kpc.board;

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
import com.kpc.board.BoardVO;
//dkdkdkdkdk
@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardServiceImpl svc;

//	public void setDDD(BoardImpl ox10) { 
//		this.impl =  ox10;
//	}
//	@Qualifier @Resource @Inject
	
	
	@RequestMapping(value = "/bdelete.do", method = RequestMethod.GET)
	public String bdelete(Model model,
		@RequestParam(value = "bseq", required = false) int bseq ) {
//		@RequestParam("bseq") int bseq ) {
		//BoardImpl impl = new BoardImpl();
		int res = svc.svcDelete(bseq);
		if(res <= 0) {
			return "error_page";  //  /error.jsp
		} else {
			return "redirect:/blist.do";
		}
	}
	
	@RequestMapping(value = "/blist.do", method = RequestMethod.GET)
	public String blist(Model model) {
		System.out.println("Controller 실행.....");
    	//BoardImpl impl = new BoardImpl();
		ArrayList<BoardVO> list = svc.svcSelect();
		System.out.println(list.size());
		System.out.println("hello");
		
		model.addAttribute("MYLISTKKKKK", list);
		//return "admin/ajax/board_list";
		return "board_list";
	}
	@RequestMapping(value = "/blist.do", method = RequestMethod.POST)
	public String blistBySearch(Model model,
			@RequestParam(value = "searchKey", required = false) String searchKey ,
	@RequestParam(value = "searchStr", required = false) String searchStr
			) {
    	//BoardImpl impl = new BoardImpl();
		ArrayList<BoardVO> list = svc.svcSelect(searchKey, searchStr);
		System.out.println(list.size());
		
		model.addAttribute("MYLISTKKKKK", list);
//		return "admin/ajax/board_list";
		return "board_list";
	}
	
	@RequestMapping(value = "/bview.do", method = RequestMethod.GET)
	public String bview(Model model,
			@RequestParam(value = "bseq", required = false) int bseq ) {
    	//BoardImpl impl = new BoardImpl();
		BoardVO vo = svc.svcSelect(bseq);
		model.addAttribute("VOKKKK", vo);
		return "board_view";
//		return "board_list";
	}
	
	@RequestMapping(value = "/binsert.do", method = RequestMethod.POST)
	public String binsert(Model model,
			@ModelAttribute BoardVO vo) {
	
		//BoardImpl impl = new BoardImpl();
		int res = svc.svcInsert(vo);  //<----------------
		String goURL="error_page";
		if(res <= 0) {
			goURL="error_page";
		} else {
			goURL="redirect:/blist.do";
		}
		return goURL;
	}
	@RequestMapping(value = "/bupdate.do", method = RequestMethod.POST)
	public String bupdate(Model model,
			@ModelAttribute BoardVO vo) {
		//BoardImpl impl = new BoardImpl();
		int res = svc.svcUpdate(vo); 
		
		if(res <= 0) {
			return "error_page";
		} else {
			return "redirect:/blist.do";
		}
	}
	
}
