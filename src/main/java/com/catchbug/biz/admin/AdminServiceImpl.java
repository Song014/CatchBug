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

}
