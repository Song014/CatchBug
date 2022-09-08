package com.catchbug.biz.account;

import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import retrofit2.http.HEAD;


@Repository("memberDAO")
public class MemberDAOmybaits {
	@Autowired
	private SqlSessionTemplate memberMybatis;

	// 회원가입 등록
	public void insertMember(MemberVO vo) {
		System.out.println("===> mybatis로 insertMemeber 실행");
		memberMybatis.insert("MemberDAO.insertMember", vo);
	}

	// 마이페이지 uuid수정
	public void updateUuid(MemberVO vo) {
		System.out.println("==> mybatis로 updateImg실행");
		memberMybatis.update("MemberDAO.updateUuid", vo);
	}

	// 마이페이지 uuid수정
	public void updateUuid(MemberVO vo) {
		System.out.println("==> mybatis로 updateImg실행");
		memberMybatis.update("MemberDAO.updateUuid", vo);
	}

	// 마이페이지 비밀번호 변경
	public void updatePass(MemberVO vo) {
		System.out.println("updatePass 실행");
		memberMybatis.update("MemberDAO.updateMypagePass", vo);
	}

    // 로그인 전 회원정보 검색
    public MemberVO getMember(MemberVO vo) {
        System.out.println("===> mybatis로 getMemeber 실행");
        return memberMybatis.selectOne("MemberDAO.getMember", vo);

    }


	// 전체 회원 조회
	public List<MemberVO> getMemberList(MemberVO vo) {
		System.out.println("====> mybatis로 getMemberList 실행");
		return memberMybatis.selectList("MemberDAO.getMemberList", vo);
	}

	public ImgVO getProfileImg(MemberVO vo) {

		return memberMybatis.selectOne("MemberDAO.getProfileImg",vo);
	}
	public void insertMemberImg(ImgVO vo) {
		memberMybatis.insert("MemberDAO.insertMemberImg",vo);
	}

    // 마이페이지 수정
    public void updateMypage(MemberVO vo) {
        System.out.println("===> mybatis로  updateMypage실행");
        memberMybatis.update("MemberDAO.updateMypage", vo);

    }

    // 아이디 중복 확인
    public int idcheck(MemberVO vo) {
        System.out.println("idcheck 실행");
        return memberMybatis.selectOne("MemberDAO.idChk", vo);
    }

    // 전체 회원 조회
    public List<MemberVO> getMemberList(MemberVO vo) {
        System.out.println("====> mybatis로 getMemberList 실행");
        return memberMybatis.selectList("MemberDAO.getMemberList", vo);
    }

    //마이페이지 이미지수정
    public void updateImg(MemberVO vo) {
        System.out.println("==> mybatis로 updateImg실행");
        memberMybatis.update("MemberDAO.updateImg", vo);
    }

    public int updateMailKey(MemberVO vo) throws Exception {
        return memberMybatis.update("MemberDAO.updateMailKey", vo);
    }

    public int updateMailAuth(MemberVO vo) throws Exception {
        return memberMybatis.update("MemberDAO.updateMailAuth", vo);
    }

    public int emailAuthFail(String id) throws Exception {
        return memberMybatis.selectOne("MemberDAO.emailAuthFail", id);
    }

    //비밀번호 찾기 유효성 검증을 위한 전체 아이디,이메일 불러오기
    public List<MemberVO> findMemberPW() {
        return memberMybatis.selectList("MemberDAO.findMemberPW");
    }

    //임시비밀번호로 데이터베이스 변경
    public void changeRandomPW(MemberVO vo) {
        memberMybatis.update("MemberDAO.changeRandomPW", vo);
    }

    //아이디찾기 일치하는 정보 가져오기
    public MemberVO findMemberID(MemberVO vo) {
        return memberMybatis.selectOne("MemberDAO.findMemberID", vo);
    }
}