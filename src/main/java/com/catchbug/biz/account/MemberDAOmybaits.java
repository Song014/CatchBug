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
		   //DAO도 다 수정해야댐
	   }
	   //로그인 전 회원정보 검색
	   public MemberVO getMember(MemberVO vo) {
		   System.out.println("===> mybatis로 getMemeber 실행");
		   return memberMybatis.selectOne("MemberDAO.getMember",vo);
		   
	   }
	   //마이페이지 수정
	   public void updateMypage(MemberVO vo) {
		   System.out.println("===> mybatis로  updateMypage실행");
		   memberMybatis.update("MemberDAO.updateMypage", vo);
	   }
		   //마이페이지 이미지수정
		public void updateImg(MemberVO vo) {
			System.out.println("==> mybatis로 updateImg실행");
			memberMybatis.update("MemberDAO.updateImg",vo);
		}
		   
	}  


//	   
//	   //글 삭제
//	   public void deleteBoard(AccountVO vo) {
//		   System.out.println("===> mybatis로 deleteAccount 실행");
//		   accountMybatis.insert("AccountDAO.deleteAccount", vo);
//		   //DAO도 다 수정해야댐
//	   }
//	   
//	   //상세조회
//	   public AccountVO getBoard(AccountVO vo) {
//		   System.out.println("===> mybatis로 getBoard 실행");
//		  
//		   //DAO도 다 수정해야댐
//		   return accountMybatis.selectOne("AccountDAO.getboard",vo);
//		   
//	   }
//	 //글 전체 조회
//	   public List<AccountVO> getBoardList(AccountVO vo){
//		   System.out.println("===> mybatis로 getBoard 실행");
//		  
//		   return accountMybatis.selectList("AccountDAO.getBoard",vo);
//		   //DAO도 다 수정해야댐
		
		
		  
		      
//	   }

