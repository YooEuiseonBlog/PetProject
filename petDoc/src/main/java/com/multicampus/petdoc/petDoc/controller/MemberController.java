package com.multicampus.petdoc.petDoc.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
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
}
