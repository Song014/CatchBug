package com.catchbug.biz.account;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.MemberVO;


@Repository("memberDAO")
public class MemberDAOmybaits {

	@Autowired
	private SqlSessionTemplate memberMybatis;
	
	//회원가입 등록
	   public void insertMember(MemberVO vo){
		   System.out.println("===> mybatis로 insertMemeber 실행");
		   memberMybatis.insert("MemberDAO.insertMember",vo);
	   }
	   //로그인 전 회원정보 검색
	   public MemberVO getMember(MemberVO vo) {
		   System.out.println("===> mybatis로 getMemeber 실행");

		   return memberMybatis.selectOne("MemberDAO.getMember",vo);
		   
	   }
	   //마이페이지 수정
	   public void updateMypage(MemberVO vo) {
		   System.out.println("===> mybatis로  updateMypage실행");
		   memberMybatis.update("MemberDAO.updateMypage",vo);
		
	   }
		   //마이페이지 이미지수정
		public void updateImg(MemberVO vo) {
			System.out.println("==> mybatis로 updateImg실행");
			memberMybatis.update("MemberDAO.updateImg",vo);
		}
	//마이페이지 비밀번호 변경
		public void updatePass(MemberVO vo) {
			System.out.println("updatePass 실행");
			memberMybatis.update("MemberDAO.updateMypagePass",vo);
		}
		
		//아이디 중복 확인
		public int idcheck(MemberVO vo) {
			System.out.println("idcheck 실행");
			return memberMybatis.selectOne("MemberDAO.idChk", vo);
		}
		   
	}  


