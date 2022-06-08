package com.multicampus.petdoc.petDoc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.multicampus.petdoc.petDoc.vo.BoardVO;
import com.multicampus.petdoc.petDoc.vo.PagingVO;

@Service
public interface BoardService {
	//글 등록
	public int BoardInsert(BoardVO vo);
	//글 선택(리스트)
	public List<BoardVO> BoardSelectList(String type, PagingVO pvo);
	//조회수 증가
	public void hitCount(int board_num);
	public void LikeInsert(int board_num, String user_id);
	public void LikeDelete(int board_num, String user_id);
	public int LikeCheck(int board_num);
	public int LikeModi(int board_num, int likes);
	
	//글 보기
	public BoardVO BoardView(int board_num, String type);
	
	//글 수정
	public int BoardUpdate(BoardVO vo);
	public int BoardFileUpdate(BoardVO vo);
	public BoardVO getFileName(int board_num);
	public int BoardDelete(int board_num, String user_id);
	
	public int totalRecord();
}
