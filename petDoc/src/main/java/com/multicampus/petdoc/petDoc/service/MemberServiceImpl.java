package com.multicampus.petdoc.petDoc.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multicampus.petdoc.petDoc.dao.MemberDAO;
import com.multicampus.petdoc.petDoc.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;
	
	public MemberVO loginCheck(MemberVO vo) {
		return dao.loginCheck(vo);
	}
	public int memberIdOk(String id) {
		return dao.memberIdOk(id);
	}
	public int memberNameOk(String name) {
		return dao.memberNameOk(name);
	}
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}
	public MemberVO memberSelect(String user_id) {
		return dao.memberSelect(user_id);
	}
	public int memberUpdate(MemberVO vo) {
		return dao.memberUpdate(vo);
	}
	public int updatePw(MemberVO vo) throws Exception{
		return dao.updatePw(vo);
	}
	public MemberVO readMember(String user_id) {
		return dao.readMember(user_id);
	}
	public int memberDelete(MemberVO vo) {
		return dao.memberDelete(vo);
	}
	public int backtoNormal(String user_id) {
		return dao.backtoNormal(user_id);
	}
}
