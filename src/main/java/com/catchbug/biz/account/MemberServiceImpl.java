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
	
	
	@Override
	public void insertMember(MemberVO vo) {
		MemberDAO.insertMember(vo);
	}


	@Override
	public MemberVO getMember(MemberVO vo) {

		return MemberDAO.getMember(vo);
		 
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
	public int updateMailKey(MemberVO vo) throws Exception {
		
		return MemberDAO.updateMailKey(vo);
	}


	@Override
	public int updateMailAuth(MemberVO vo) throws Exception {
		return MemberDAO.updateMailAuth(vo);
	}


	@Override
	public int emailAuthFail(String id) throws Exception {
		// TODO Auto-generated method stub
		return MemberDAO.emailAuthFail(id);
	}


	
	//비밀번호 찾기를 위한 필요정보 가져오기
	@Override
	public List<MemberVO> FindMemberPW() {
		return MemberDAO.findMemberPW();
	}


	//임시비밀번호로 변경
	@Override
	public void changeRandomPW(MemberVO vo) {
		MemberDAO.changeRandomPW(vo);
	}

}
