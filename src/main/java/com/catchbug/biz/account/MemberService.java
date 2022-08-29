package com.catchbug.biz.account;

import com.catchbug.biz.vo.MemberVO;

public interface MemberService {

	//회원 가입
		void insertMember(MemberVO vo);
		
	//로그인
		MemberVO getMember(MemberVO vo);

	//마이페이지 정보수정
		void updateMypage(MemberVO vo);
		
	//마이페이지 이미지 수정
		void updateImg(MemberVO vo);

}
