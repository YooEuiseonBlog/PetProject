package com.multicampus.petdoc.petDoc.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.multicampus.petdoc.petDoc.service.BoardService;
import com.multicampus.petdoc.petDoc.vo.BoardVO;
import com.multicampus.petdoc.petDoc.vo.PagingVO;


@Controller
public class BoardController {
	@Inject
	BoardService bservice;
	
	ModelAndView mav= new ModelAndView();
	
	@GetMapping("/notice/noticeList")
	public ModelAndView noticeList(String type,  PagingVO pvo){
		mav.addObject("list", bservice.BoardSelectList("notice"));
		mav.setViewName("/notice/noticeList");
		pvo.setOnePageRecord(4);
		pvo.setOnePageCount(5);
		pvo.setTotalRecord(bservice.totalRecord());
		pvo.setOffsetIndex(pvo.getPageNum(), 4);
		System.out.println(pvo.getOffsetIndex());

		return mav;
	}
	
	@GetMapping("/notice/noticeWrite")
	public ModelAndView noticeWrite(BoardVO vo) {
		String msg = "<script>alert('글이 등록되었습니다');";
		if(vo.getBaordtype()=="notice") {
			msg+="location.href='/notice/noticeList;</script>";
		}
		mav.addObject("register", bservice.BoardInsert(vo));
		mav.setViewName("/notice/noticeWrite");
		return mav;
	}
	
	//글 수정
	@GetMapping("/notice/noticeEdit")
	public ModelAndView noticeEdit(int board_num) {
		mav.setViewName("/notice/noticeEdit");
		return mav;
	}
	
	@ResponseBody // Ajax
	@RequestMapping(value = "noticeListModal", method = RequestMethod.GET)
	public BoardVO noticeModal(@RequestParam("board_num") int board_num) {
		return bservice.BoardView(board_num, "notice");
	}

}