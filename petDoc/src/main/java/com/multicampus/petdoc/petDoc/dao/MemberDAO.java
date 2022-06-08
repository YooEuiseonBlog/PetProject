package com.multicampus.petdoc.petDoc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.multicampus.petdoc.petDoc.vo.MemberVO;
import com.multicampus.petdoc.petDoc.vo.PagingVO;

@Mapper
@Repository
public interface MemberDAO {
	    //로그인
		public MemberVO loginCheck(MemberVO vo);
		// 회원가입: 아이디 중복검사
		public int memberIdOk(String id);
		// 회원가입: 닉네임 중복검사
		public int memberNameOk(String name);
		// 회원가입
		public int memberInsert(MemberVO vo);
		
		//회원정보수정
		public MemberVO memberSelect(String user_id);
		public List<MemberVO> memberSelectList(String type, PagingVO pVO);
		
		//회원정보수정
		public int memberUpdate(MemberVO vo);
		
		// 비밀번호 변경
		public int updatePw(MemberVO vo) throws Exception;
			
		//해당 계정의 정보 조회
		public MemberVO readMember(String user_id);
		
		// 회원탈퇴
		public int memberDelete(MemberVO vo);
		
		// 정지 해제
		public int backtoNormal(String user_id);
		
		public MemberVO getFileName(String user_id);
		public int changeProfileImg(MemberVO vo);
}
