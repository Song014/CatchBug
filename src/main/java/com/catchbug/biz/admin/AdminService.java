package com.catchbug.biz.admin;

import java.util.*;

import com.catchbug.biz.vo.MemberVO;

public interface AdminService {
	
	public List<MemberVO> getMemberList();
	public List<MemberVO> getMemberWaitList();
	public void memberLevelUpdate(MemberVO vo);
	public void memberrefuse(MemberVO vo);
	public List<HashMap<String, Object>> getunOrderHistory();
	public List<MemberVO> getMemberM(MemberVO vo);
	
	
}
