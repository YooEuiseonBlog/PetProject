package com.multicampus.petdoc.petDoc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multicampus.petdoc.petDoc.dao.BoardDAO;
import com.multicampus.petdoc.petDoc.vo.BoardVO;
import com.multicampus.petdoc.petDoc.vo.PagingVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAO dao;
	
	@Override
	public int BoardInsert(BoardVO vo) {
		return dao.BoardInsert(vo);
	}
	@Override
	public List<BoardVO> BoardSelectList(String type, PagingVO pvo){
		return dao.BoardSelectList(type, pvo);
	}
	@Override
	public List<BoardVO> BoardSelectListAjax(String type, PagingVO pVO){
		return dao.BoardSelectListAjax(type, pVO);
	}
	@Override
	public List<BoardVO> boardSearch(String searchKey, String string, int start, int end, String boardtype){
		return dao.boardSearch(searchKey, string, start, end, boardtype);
	}
	@Override
	public void hitCount(int board_num) {
		dao.hitCount(board_num);
	}
	@Override
	public void LikeInsert(int board_num, String user_id) {
		dao.LikeInsert(board_num, user_id);
	}
	@Override
	public void LikeDelete(int board_num, String user_id) {
		dao.LikeDelete(board_num, user_id);
	}
	@Override
	public int LikeCheck(int board_num) {
		return dao.LikeCheck(board_num);
	}
	@Override
	public int LikeModi(int board_num, int likes) {
		return dao.LikeModi(board_num, likes);
	}
	
	@Override
	public BoardVO BoardView(int board_num, String type) {
		return dao.BoardView(board_num, type);
	}
	
	@Override
	public int BoardUpdate(BoardVO vo) {
		return dao.BoardUpdate(vo);
	}
	@Override
	public int BoardFileUpdate(BoardVO vo) {
		return dao.BoardFileUpdate(vo);
	}
	@Override
	public BoardVO getFileName(int board_num) {
		return dao.getFileName(board_num);
	}
	@Override
	public int BoardDelete(int board_num, String user_id) {
		return dao.BoardDelete(board_num, user_id);
	}
	@Override 
	public int totalRecord() { 
		return dao.totalRecord(); 
	}
	@Override
	public int BoardDeleteAdmin(int board_num) {
		return dao.BoardDeleteAdmin(board_num);
	}
	@Override
	public String getType(int board_num) {
		return dao.getType(board_num);
	}
}