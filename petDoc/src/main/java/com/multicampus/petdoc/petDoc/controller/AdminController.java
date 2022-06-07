package com.multicampus.petdoc.petDoc.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.multicampus.petdoc.petDoc.vo.BoardVO;
import com.multicampus.petdoc.petDoc.vo.MemberVO;
import com.multicampus.petdoc.petDoc.vo.PagingVO;
import com.multicampus.petdoc.petDoc.service.BoardService;
import com.multicampus.petdoc.petDoc.service.MemberService;

@Controller
public class AdminController {
	@Inject
	MemberService service;
	@Inject
	BoardService bservice;
	
			//관리자 페이지 이동
			@GetMapping("/admin/admininfo")
			public ModelAndView memberPage(BoardVO vo, HttpSession session, String type) {
				ModelAndView mav = new ModelAndView();
				mav.addObject("type", type);
				mav.addObject("vo", vo);
				mav.setViewName("/admin/admininfo");
				return mav;
			}
			
			//ajax
			@ResponseBody
			@RequestMapping(value="/admin/noticeList")
			public List<BoardVO> InfoPaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{	
				try {
				pvo.setStart(Integer.parseInt(startNum));
				}catch(NumberFormatException e) {
					pvo.setStart(0);
				}
				pvo.setEnd(8);
				return bservice.BoardSelectListAjax("notice", pvo);
			}
			
			@ResponseBody
			@GetMapping("/admin/noticeSearch")
			public ModelAndView Nsearch(String searchKey, String searchWord, String type) {
				ModelAndView mav = new ModelAndView();
				//게시판 타입
				mav.addObject("type", type);
				mav.setViewName("/admin/admininfo");
				return mav;
			}
			
			@ResponseBody // Ajax
			@RequestMapping(value = "/admin/noticeSearchLists")
			public List<BoardVO> searchMoreViewN(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
				int start = Integer.parseInt(startNum);
				int end = 8;
				return bservice.boardSearch(searchKey, "%"+searchWord+"%", start, end, "notice");
			}
			
			//자유게시판
			//ajax
			@ResponseBody
			@RequestMapping(value="/admin/boardList")
			public List<BoardVO> boardPaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{	
				try {
				pvo.setStart(Integer.parseInt(startNum));
				}catch(NumberFormatException e) {
					pvo.setStart(0);
				}
				pvo.setEnd(8);
				return bservice.BoardSelectListAjax("board", pvo);
			}
			
			//다른곳에서 검색했을때 용도
			@ResponseBody
			@GetMapping("/admin/boardSearch")
			public ModelAndView Bsearch(String searchKey, String searchWord, String type) {
				ModelAndView mav = new ModelAndView();
				//게시판 타입
				mav.addObject("type", type);
				mav.setViewName("/admin/admininfo");
				return mav;
			}
			
			@ResponseBody // Ajax
			@RequestMapping(value = "/admin/boardSearchLists")
			public List<BoardVO> searchMoreViewB(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
				int start = Integer.parseInt(startNum);
				int end = 8;
				return bservice.boardSearch(searchKey, "%"+searchWord+"%", start, end, "board");
			}
			
			//멤버
			//ajax
			@ResponseBody
			@RequestMapping(value="/admin/userList")
			public List<MemberVO> userPaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{	
				try {
				pvo.setStart(Integer.parseInt(startNum));
				}catch(NumberFormatException e) {
					pvo.setStart(0);
				}
				pvo.setEnd(8);
				return service.memberSelectList("user",pvo);
			}
			
			//다른곳에서 검색했을때 용도
			@ResponseBody
			@GetMapping("/admin/userSearch")
			public ModelAndView Usearch(String searchKey, String searchWord, String type) {
				ModelAndView mav = new ModelAndView();
				//게시판 타입
				mav.addObject("type", type);
				mav.setViewName("/admin/admininfo");
				return mav;
			}
			
			
			
			
			
			//글삭제
			@GetMapping("/board/boardDelete")
			public ResponseEntity<String> boardDelete(int board_num, HttpSession session) {
				
				String userid = (String)session.getAttribute("logId");
				
				String path = session.getServletContext().getRealPath("/upload/");
				
				String boardtype= bservice.getType(board_num);
				ResponseEntity<String> entity = null;
				HttpHeaders headers = new HttpHeaders();
				headers.add("Content-Type", "text/html; charset=utf-8");
				
				try {
					// 1. 삭제할 레코드의 파일명 얻어오기
					BoardVO dbFileVO = bservice.getFileName(board_num);
					if(dbFileVO == null) {
						dbFileVO = bservice.BoardView(board_num,boardtype);
					}
					
					// 2. 레코드 삭제
					bservice.BoardDeleteAdmin(board_num);
					
					// 3. 파일 삭제
					fileDelete(path, dbFileVO.getFilename1());
					
					String msg = "<script>alert('글이 삭제되었습니다');";
						   msg += "location.href='/admin/admininfo?type="+boardtype+"';</script>";

					entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
					
				}catch(Exception e) {
					e.printStackTrace();
					
					String msg = "<script>alert('글 삭제에 실패했습니다.');history.back();</script>";
					entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
				}
				return entity;
				
			}
			
			// 파일지우기
			public void fileDelete(String p, String f) {
				if(f != null) {	//파일명이 있을때만
					File file = new File(p, f);
					file.delete();
				}
			}
			
			
		
		
}
