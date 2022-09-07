package com.catchbug.biz.account;

import java.util.List;

import com.catchbug.biz.vo.ImgVO;
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
	void updateImg(ImgVO ivo);


	public int getTotalMember(MemberVO vo);


	// 마이페이지 비밀번호 변경
	void updatePass(MemberVO vo);

	// id 중복확인
	int idcheck(MemberVO vo);

	ImgVO getProfileImg(MemberVO vo);

	void updateUuid(MemberVO mvo);

}
