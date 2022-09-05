package com.catchbug.biz.account;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOmybaits {

	@Autowired
	private SqlSessionTemplate memberMybatis;

	// 회원가입 등록
	public void insertMember(MemberVO vo) {
		System.out.println("===> mybatis로 insertMemeber 실행");
		memberMybatis.insert("MemberDAO.insertMember", vo);
		// DAO도 다 수정해야댐
	}

	// 로그인 전 회원정보 검색
	public MemberVO getMember(MemberVO vo) {
		System.out.println("===> mybatis로 getMemeber 실행");

		return memberMybatis.selectOne("MemberDAO.getMember", vo);

	}

	// 마이페이지 수정
	public void updateMypage(MemberVO vo) {
		System.out.println("===> mybatis로  updateMypage실행");
		memberMybatis.update("MemberDAO.updateMypage", vo);

	}

	// 마이페이지 이미지수정
	public void updateImg(MemberVO vo) {
		System.out.println("==> mybatis로 updateImg실행");
		memberMybatis.update("MemberDAO.updateImg", vo);
	}

	public int updateMailKey(MemberVO vo) throws Exception {
		return memberMybatis.update("MemberDAO.updateMailKey", vo);
	}

	public int updateMailAuth(MemberVO vo) throws Exception {
		return memberMybatis.update("MemberDAO.updateMailAuth", vo);
	}

	public int emailAuthFail(String id) throws Exception{
		return memberMybatis.selectOne("MemberDAO.emailAuthFail",id);
	}
	
	//비밀번호 찾기 유효성 검증을 위한 전체 아이디,이메일 불러오기
	public List<MemberVO> findMemberPW(){
		return memberMybatis.selectList("MemberDAO.findMemberPW");
	}
	
	//임시비밀번호로 데이터베이스 변경
	public void changeRandomPW(MemberVO vo) {
		memberMybatis.update("MemberDAO.changeRandomPW",vo);
	}
	
	//아이디찾기 일치하는 정보 가져오기
	public MemberVO findMemberID(MemberVO vo) {
		return memberMybatis.selectOne("MemberDAO.findMemberID",vo);
	}
}
