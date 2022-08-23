package com.catchbug.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.MemberVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<MemberVO> getMemberList() {
		System.out.println("리스트 검색 서비스");
//		List<MemberVO> member_list = adminDAO.getMemberList();
//		System.out.println(member_list);
		return adminDAO.getMemberList();
	}

}
