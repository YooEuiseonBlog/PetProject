package com.multicampus.petdoc.petDoc.service;

import java.util.List;

import com.multicampus.petdoc.petDoc.vo.MemberVO;
import com.multicampus.petdoc.petDoc.vo.PagingVO;

public interface MemberService {
	  //로그인
			public MemberVO loginCheck(MemberVO vo);
			public int memberIdOk(String id);
			public int memberNameOk(String name);
			public int memberInsert(MemberVO vo);
			public MemberVO memberSelect(String user_id);
			public List<MemberVO> memberSelectList(String type, PagingVO pVO);
			public int memberUpdate(MemberVO vo);
			public int updatePw(MemberVO vo) throws Exception;	
			public MemberVO readMember(String user_id);
			public int memberDelete(MemberVO vo);
			public int backtoNormal(String user_id);
			public MemberVO getFileName(String user_id);
			public int changeProfileImg(MemberVO vo);
			
}
