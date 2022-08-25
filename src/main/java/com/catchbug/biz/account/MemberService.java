package com.catchbug.biz.account;

import java.util.List;

import com.catchbug.biz.vo.MemberVO;

public interface MemberService {

	//회원 가입
		void insertMember(MemberVO vo);
		
	//로그인
		List<MemberVO> getMember(MemberVO vo);

}
