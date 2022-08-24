package com.catchbug.biz.account.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.AccountVO;


@Repository
public class AccountDAOmybaits {

	@Autowired
	private SqlSessionTemplate accountMybatis;
	
	//글 등록
	   public void insertAccount(AccountVO vo){
		   System.out.println("===> mybatis로 insertAccount 실행");
		   accountMybatis.insert("AccountDAO.insertAccount",vo);
		   //DAO도 다 수정해야댐
	   }
}
//	   //글 수정
//	   public void updateBoard(AccountVO vo) { 
//		   System.out.println("===> mybatis로 updateAccount 실행");
//		   accountMybatis.insert("AccountDAO.updateAccount", vo);
//		   //DAO도 다 수정해야댐
//	   }
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

