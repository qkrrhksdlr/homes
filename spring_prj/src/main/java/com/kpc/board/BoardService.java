package com.kpc.board;

import java.util.ArrayList;

import com.kpc.board.BoardVO;

public interface BoardService {
	//검색	
		public	ArrayList<BoardVO> svcSelect(String searchKey, String searchStr);
		//글쓰기	
		public	int	svcInsert(BoardVO vo);  //(int bseq, String title, String contents, String regid);
		//글목록	
		public	ArrayList<BoardVO> svcSelect();
		
		//글상세보기	
		public	BoardVO	svcSelect(int bseq);
		//수정	
		public	int	svcUpdate(BoardVO vo);  //(int bseq, String title, String contents, String regid);
		//삭제	
		public	int	svcDelete(int bseq);
}
