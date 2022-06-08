package com.multicampus.petdoc.petDoc.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		pvo.setOnePageRecord(8);
		pvo.setOnePageCount(5);
		pvo.setTotalRecord(bservice.totalRecord());
		pvo.setOffsetIndex(pvo.getPageNum(), 4);
		System.out.println(pvo.getOffsetIndex());
		
		mav.addObject("list", bservice.BoardSelectList("notice", pvo));
		mav.setViewName("/notice/noticeList");
		mav.addObject("pvo",pvo);
		return mav;
	}
	
	@GetMapping("/notice/noticeWrite")
	public ModelAndView noticeWrite(BoardVO vo) {
		mav.setViewName("/notice/noticeWrite");
		return mav;
	}
	
	// 글 등록
		@PostMapping("/notice/noticeWriteOk")
		public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpSession session) {
			vo.setUser_id((String)session.getAttribute("logId"));
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

			
			try {
				//vo.setBoardtype("notice");
				bservice.BoardInsert(vo);
				String msg = "<script>";
			    msg += "alert('글이 등록되었습니다');";
				msg += "location.href='/notice/noticeList';</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);

				
			}catch(Exception e){
				e.printStackTrace();
				String msg = "<script>";
				msg += "alert('글이 등록 실패하였습니다');";
				msg += "history.back();</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST); // 400
			}
			return entity;
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