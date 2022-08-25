package com.catchbug.biz.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
//	private AccountDAO accountDAO;
	private MemberDAOmybaits MemberDAO;
	
	
	@Override
	public void insertMember(MemberVO vo) {
		MemberDAO.insertMember(vo);
	}

}
