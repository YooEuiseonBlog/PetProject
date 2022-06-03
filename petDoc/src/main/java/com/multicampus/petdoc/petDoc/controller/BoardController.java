package com.multicampus.petdoc.petDoc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@GetMapping("/notice/noticeList")
	public ModelAndView noticeList(String type){
		ModelAndView mav= new ModelAndView();
		mav.setViewName("/notice/noticeList");
		return mav;
	}
	
	//글 수정
	@GetMapping("/notice/noticeEdit")
	public ModelAndView noticeEdit(String type) {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("/notice/noticeEdit");
		return mav;
	}

}
