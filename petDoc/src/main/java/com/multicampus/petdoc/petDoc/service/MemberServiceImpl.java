package com.multicampus.petdoc.petDoc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multicampus.petdoc.petDoc.dao.MemberDAO;
import com.multicampus.petdoc.petDoc.vo.MemberVO;
import com.multicampus.petdoc.petDoc.vo.PagingVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;
	
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return dao.loginCheck(vo);
	}
	@Override
	public int memberIdOk(String id) {
		return dao.memberIdOk(id);
	}
	@Override
	public int memberNameOk(String name) {
		return dao.memberNameOk(name);
	}
	@Override
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}
	@Override
	public MemberVO memberSelect(String user_id) {
		return dao.memberSelect(user_id);
	}
	@Override
	public List<MemberVO> memberSelectList(String type, PagingVO pVO) {
		return dao.memberSelectList(type, pVO);
	}
	@Override
	public int memberUpdate(MemberVO vo) {
		return dao.memberUpdate(vo);
	}
	@Override
	public int updatePw(MemberVO vo) throws Exception{
		return dao.updatePw(vo);
	}
	@Override
	public MemberVO readMember(String user_id) {
		return dao.readMember(user_id);
	}
	@Override
	public int memberDelete(MemberVO vo) {
		return dao.memberDelete(vo);
	}
	@Override
	public int backtoNormal(String user_id) {
		return dao.backtoNormal(user_id);
	}
	@Override
	public MemberVO getFileName(String user_id) {
		return dao.getFileName(user_id);
	}
	@Override
	public int changeProfileImg(MemberVO vo) {
		return dao.changeProfileImg(vo);
	}
}
