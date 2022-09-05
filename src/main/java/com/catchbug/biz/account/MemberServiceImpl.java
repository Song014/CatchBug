package com.catchbug.biz.account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
//	private AccountDAO accountDAO;
	private MemberDAOmybaits MemberDAO;

	// 훠왼가입 기능

	@Override
	public void insertMember(MemberVO vo) {
		MemberDAO.insertMember(vo);
	}

	// 로그인 기능

	@Override
	public MemberVO getMember(MemberVO vo) {

		System.out.println("DAO" + vo);

		return MemberDAO.getMember(vo);

	}

	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		return (List<MemberVO>) MemberDAO.getMemberList(vo);
	}

	@Override
	public void updateMypage(MemberVO vo) {
		MemberDAO.updateMypage(vo);
	}

	@Override
	public void updateImg(MemberVO vo) {
		MemberDAO.updateImg(vo);

	}

	@Override
	public int getTotalMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;

	}

}
