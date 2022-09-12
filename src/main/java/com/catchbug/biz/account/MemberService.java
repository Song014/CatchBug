package com.catchbug.biz.account;

import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MemberVO;

import java.util.List;

public interface MemberService {

    // 회원 가입
    void insertMember(MemberVO vo);

    int updateMailKey(MemberVO vo) throws Exception;

    int updateMailAuth(MemberVO vo) throws Exception;

    int emailAuthFail(String id) throws Exception;

    List<MemberVO> FindMemberPW();

    void changeRandomPW(MemberVO vo);

    MemberVO FindMemberID(MemberVO vo);


    // 로그인
    MemberVO getMember(MemberVO vo);


    // 전체 회원 목록 조회
    List<MemberVO> getMemberList(MemberVO vo);

    // 마이페이지 정보수정
    void updateMypage(MemberVO vo);


    // 마이페이지 이미지 수정

    void insertMemberImg(ImgVO ivo);


    public int getTotalMember(MemberVO vo);

    // 마이페이지 비밀번호 변경
    void updatePass(MemberVO vo);


    // id 중복확인
    int idcheck(MemberVO vo);

    ImgVO getProfileImg(MemberVO vo);

    void updateUuid(MemberVO mvo);
	
}
