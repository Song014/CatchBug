package com.catchbug.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.MemberVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	
	//가맹점 전체 리스트
	@Override
	public List<MemberVO> getMemberList() {
		System.out.println("AdminServiceIm --> getMemberList");
		return adminDAO.getMemberList();
	}
	
	//가맹점 승인요청 리스트
	@Override
	public List<MemberVO> getMemberWaitList() {
		System.out.println("AdminServiceIm --> getMemberList");
		return adminDAO.getMemberWaitList();
	}
	
	//가맹점 승인처리
	@Override
	public void memberLevelUpdate(MemberVO vo) {
		System.out.println("가입 승인 서비스 회원아이디 : " + vo.getId());
		adminDAO.memberLevelUpdate(vo);
	}
	
	//가맹점 반려처리
	@Override
	public void memberrefuse(MemberVO vo) {
		System.out.println("가입 반려 서비스 회원아이디 : " + vo.getId());
		adminDAO.memberrefuse(vo);
	}

	
	
	
	

}
