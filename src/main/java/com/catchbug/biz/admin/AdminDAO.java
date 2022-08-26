package com.catchbug.biz.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.MemberVO;

@Repository
public class AdminDAO {	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 가맹점 전체 리스트
	public List<MemberVO> getMemberList() {
		System.out.println("AdminDAO --> getMemberList");
		return mybatis.selectList("AdminMapper.getMemberList");
	}
	
	// 가맹점 승인요청 리스트
	public List<MemberVO> getMemberWaitList() {
		System.out.println("AdminDAO --> getMemberList");
		return mybatis.selectList("AdminMapper.getMemberWaitList");
	}
	
	// 승인 처리
	public void memberLevelUpdate(MemberVO vo) {
		System.out.println("가입 승인 DAO 회원아이디 : " + vo.getId());
		mybatis.update("AdminMapper.memberLevelUpdate", vo);
	}
	
	// 반려 처리
	public void memberrefuse(MemberVO vo) {
		System.out.println("가입 반려 DAO 회원아이디 : " + vo.getId());
		mybatis.delete("AdminMapper.memberrefuse", vo);
	}

}
