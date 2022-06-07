package com.multicampus.petdoc.petDoc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.multicampus.petdoc.petDoc.vo.BoardVO;
import com.multicampus.petdoc.petDoc.service.BoardService;


@Controller
public class BoardController {
	ModelAndView mav= new ModelAndView();
	
	@GetMapping("/notice/noticeList")
	public ModelAndView noticeList(String type){
		mav.setViewName("/notice/noticeList");
		return mav;
	}
	
	//글 수정
	@GetMapping("/notice/noticeEdit")
	public ModelAndView noticeEdit(int board_num) {
		mav.setViewName("/notice/noticeEdit");
		return mav;
	}

}
