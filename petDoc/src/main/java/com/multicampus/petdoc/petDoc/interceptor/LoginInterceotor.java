package com.multicampus.petdoc.petDoc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceotor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		
		HttpSession session = req.getSession();//세션객체
		String logStatus = (String) session.getAttribute("logStatus");//로그인 상태 구하기
		
		if(logStatus!=null && logStatus.equals("Y")) {//로그인이 된 경우
			return true;
		}else {
			res.sendRedirect(req.getContextPath()+"/member/login");
			return false;
	}
}
}
