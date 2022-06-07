package com.multicampus.petdoc.petDoc.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.multicampus.petdoc.petDoc.service.MemberService;
import com.multicampus.petdoc.petDoc.vo.MemberVO;

@RestController
@RequestMapping("/member/")
public class MemberController {
	@Inject
	MemberService service;

	//로그인페이지로 이동
	@GetMapping("login")
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/login");
		return mav;
	}
	
	//로그인 진행
		@PostMapping("/loginOk")
		public ModelAndView loginOk(MemberVO vo, HttpSession session) {
			MemberVO vo2 = service.loginCheck(vo);
					
			ModelAndView mav = new ModelAndView();
			if (vo2 != null) {// 로그인 성공
				session.setAttribute("logId", vo2.getUser_id());
				session.setAttribute("logLevel", vo2.getUser_level());
				session.setAttribute("logName", vo2.getUser_name());
				session.setAttribute("logImg", vo2.getUser_img());
				session.setAttribute("logStatus", "Y");
				mav.setViewName("redirect:/");// 홈으로 이동
			}else {// 로그인 실패
				mav.setViewName("member/loginFail");
			}
			return mav;
		}
		
		// 로그아웃
		@GetMapping("/logout")
		public ModelAndView logout(HttpSession session) {
			
			session.invalidate();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/");
			return mav;
		}
	
	
	//회원가입페이지로 이동
	@GetMapping("join")
	public ModelAndView joinPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/join");
		return mav;
	}
	
	// 회원가입: 아이디 중복검사
		@GetMapping("idCheck")
		@ResponseBody
		public int idCheck(String id) {
			return service.memberIdOk(id);
		}
		
		// 회원가입: 닉네임 중복검사
		@GetMapping("nameCheck")
		@ResponseBody
		public int nameCheck(String name) {
			return service.memberNameOk(name);
		}
		
		// 회원가입
		@PostMapping("/joinUpOk")
		public ModelAndView signUpOk(MemberVO vo) {
			ModelAndView mav = new ModelAndView();
			int cnt = service.memberInsert(vo);
			mav.addObject("cnt", cnt);
			mav.setViewName("member/joinUpOk");
			return mav;
		}
		
		//마이페이지 이동
		@GetMapping("/memberinfo")
		public ModelAndView memberPage(HttpSession session) {
			String userid = (String) session.getAttribute("logId");
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo", service.memberSelect(userid));
			mav.setViewName("/member/memberinfo");
			return mav;
		}
		
		//회원정보 수정 페이지 이동
		@GetMapping("/memberEdit")
		public ModelAndView memberEdit(HttpSession session) {
			String userid = (String) session.getAttribute("logId");
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo", service.memberSelect(userid));
			mav.setViewName("/member/memberEdit");
			return mav;
		}
		
		// 회원탈퇴
		@GetMapping("/memberDelete")
		public ModelAndView memberDelete(MemberVO vo, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			vo.setUser_id((String) session.getAttribute("logId"));
			service.memberDelete(vo);
			session.invalidate();
			System.out.println("회원탈퇴됨");
			mav.setViewName("/member/login");
			return mav;
		}
			
		//회원정보 수정
		@PostMapping("/memberEditOk")
		public ResponseEntity<String> changeProfileImg(MemberVO vo, HttpSession session, MultipartHttpServletRequest req) {
			vo.setUser_id((String)session.getAttribute("logId"));
			String path = session.getServletContext().getRealPath("/upload");
				
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");
			
			List<String> newUpload = new ArrayList<String>();// 폼에서 온 파일중 게시물에 없는 파일만 고른 컬렉션
			try {
				//	1. DB에서 파일명 가져오기
				MemberVO dbfileVO = service.getFileName(vo.getUser_id());
				
				//	2. 새로 업로드 하기
				MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;

				// 3. 새로 업로드된 MultipartFile객체를 얻어오기
				List<MultipartFile> newFileList = mr.getFiles("filename");
				if(newFileList != null) {	// 새로 업로드 되는 파일이 없어도 input file 갯수만큼 
											// 객체가 들어오는듯 함
					for(int i=0; i<newFileList.size(); i++) {
						MultipartFile newMf = newFileList.get(i);
						String newUploadFilename = newMf.getOriginalFilename();
						System.out.println(newUploadFilename);
						// 리네임 작업
						//폼에서 새로 업로드 한 파일이 있을 경우 
						if(newUploadFilename != null && !newUploadFilename.equals("")) {
							File f = new File(path, newUploadFilename);
							if (f.exists()) {
								System.out.println("파일명 있음");
								// 있으면 여기서 rename
								for (int n = 1;; n++) {
									int point = newUploadFilename.lastIndexOf(".");
									String fileNameNoExt = newUploadFilename.substring(0, point);
									String ext = newUploadFilename.substring(point + 1);

									// 새로운 파일명 만들어 존재유무 확인
									String nf = fileNameNoExt + " (" + n + ")." + ext;
									f = new File(path, nf);
									if (!f.exists()) { // 없으면
										System.out.println("파일명 바꿨음");
										newUploadFilename = nf;
										break;
									}
									System.out.println(f);
								} // for
							}
							// 업로드
								newMf.transferTo(f);
								newUpload.add(newUploadFilename);
								System.out.println(newUploadFilename);
								dbfileVO.setUser_img(newUploadFilename);
						}
					}//for
				}
				
				dbfileVO.setUser_id(vo.getUser_id());
				// DB update
				service.memberUpdate(vo);
				service.changeProfileImg(dbfileVO);
				System.out.println(dbfileVO);
				String msg = "<script>";
				msg += "alert('회원정보 수정 완료.);";
				msg += "location.href='/member/memberinfo';</script>";

				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
				
			}catch(Exception e) {
				e.printStackTrace();
				//DB잘못수정했을때
				for(String fname:newUpload) {
					fileDelete(path, fname);
				}
				
				//수정페이지로 이동
				String msg = "<script>";
				msg += "alert('회원정보 수정 오류.)";
				msg += "history.back();</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			}
			/*
			 * for(String d:fileList) { System.out.println(d); }
			 */
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
			
