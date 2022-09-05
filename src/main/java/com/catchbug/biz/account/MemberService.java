package com.catchbug.biz.account;

import java.util.List;

import com.catchbug.biz.vo.MemberVO;

public interface MemberService {

	// 회원 가입
	void insertMember(MemberVO vo);

	// 로그인
	MemberVO getMember(MemberVO vo);

	// 전체 회원 목록 조회
	List<MemberVO> getMemberList(MemberVO vo);

	// 마이페이지 정보수정
	void updateMypage(MemberVO vo);

	// 마이페이지 이미지 수정
	void updateImg(MemberVO vo);

	public int getTotalMember(MemberVO vo);


}
