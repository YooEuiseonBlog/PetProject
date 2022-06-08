package com.multicampus.petdoc.petDoc.vo;

import java.util.List;

public class PagingVO {
	//페이징
	private int onePageRecord = 10;//한페이지당 출력할 레코드 수
	private int boardOnePageRecord = 5;	// 출력할 레코드 수
	private int pageNum = 1;//현재페이지
	private int boardPageNum = 1;// 현재페이지
	private int totalRecord;//총 레코드의 수
	private int boardTotalRecord;//총 레코드의 수
	private int totalPage;//총 페이지 수
	private int boardTotalPage;//총 페이지 수
	private int offsetIndex = 0;
	private int onePageCount = 10;//한번에 표시할 페이지 수
	private int startPage = 1;
	//검색
	private String searchKey;
	private String searchWord;
	
	private List<String> sclass;
	private List<String> stype;
	/* private List<String> sstatus; */
	 private String status;
	
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	
	public int getBoardOnePageRecord() {
		return boardOnePageRecord;
	}
	public void setBoardOnePageRecord(int boardOnePageRecord) {
		this.boardOnePageRecord = boardOnePageRecord;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		offsetIndex = (pageNum-1)*onePageRecord;
		startPage = ((pageNum-1)/onePageCount*onePageCount)+1;
	}
	public int getBoardPageNum() {
		return boardPageNum; 
	}
	public void setBoardPageNum(int boardPageNum) {
		this.boardPageNum = boardPageNum;
		offsetIndex = (boardPageNum-1)*boardOnePageRecord;
		startPage = ((boardPageNum-1)/onePageCount*onePageCount)+1;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		if(totalRecord%onePageRecord==0) {
			totalPage = totalRecord/onePageRecord;
		}else {
			totalPage = totalRecord/onePageRecord+1;
		}
	}
	public int getBoardTotalRecord() {
		return boardTotalRecord;
	}
	public void setBoardTotalRecord(int boardTotalRecord) {
		this.boardTotalRecord = boardTotalRecord;
		
		if(boardTotalRecord%boardOnePageRecord==0) {
			boardTotalPage = boardTotalRecord/boardOnePageRecord;
		}else {
			boardTotalPage = boardTotalRecord/boardOnePageRecord+1;
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getBoardTotalPage() {
		return boardTotalPage;
	}
	public void setBoardTotalPage(int boardTotalPage) {
		this.boardTotalPage = boardTotalPage;
	}
	public int getOffsetIndex() {
		return offsetIndex;
	}
	public void setOffsetIndex(int pageNum, int onePageRecord) {
		this.offsetIndex = (pageNum-1)*onePageRecord;
	}
	public int getOnePageCount() {
		return onePageCount;
	}
	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public List<String> getSclass() {
		return sclass;
	}
	public void setSclass(List<String> sclass) {
		System.out.println(":>>>"+sclass);
		this.sclass = sclass;
	}
	public List<String> getStype() {
		return stype;
	}
	public void setStype(List<String> stype) {
		this.stype = stype;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}