package com.catchbug.biz.account;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.ImgVO;
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
	public void updateUuid(MemberVO vo) {
		MemberDAO.updateUuid(vo);

	}

	@Override
	public int getTotalMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updatePass(MemberVO vo) {
		MemberDAO.updatePass(vo);
	}

	@Override
	public int idcheck(MemberVO vo) {
		return MemberDAO.idcheck(vo);

	}

	@Override
	public ImgVO getProfileImg(MemberVO vo) {
		
		return MemberDAO.getProfileImg(vo);
	}

	@Override
	public void updateImg(ImgVO vo) {
		
		MemberDAO.updateImg(vo);
	}
}
