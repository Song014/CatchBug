package com.catchbug.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.MemberVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	
	private AdminDAO adminDAO;
	
	@Override
	public List<MemberVO> getMemberList() {
		System.out.println("AdminServiceIm --> getMemberList");
		return adminDAO.getMemberList();
	}

	@Override
	public void memberLevelUpdate(MemberVO vo) {
		System.out.println("가입 승인 서비스 회원아이디 : " + vo.getId());
		adminDAO.memberLevelUpdate(vo);
	}

	@Override
	public void memberrefuse(MemberVO vo) {
		System.out.println("가입 반려 서비스 회원아이디 : " + vo.getId());
		adminDAO.memberrefuse(vo);
	}

}
