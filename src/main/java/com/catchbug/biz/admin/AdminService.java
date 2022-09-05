package com.catchbug.biz.admin;

import java.util.*;

import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderVO;

public interface AdminService {
	
	public List<MemberVO> getMemberList();
	public List<MemberVO> getMemberWaitList();
	public void memberLevelUpdate(MemberVO vo);
	public void memberrefuse(MemberVO vo);
	public List<HashMap<String, Object>> getunOrderHistory();
	public MemberVO getMemberM(MemberVO vo);
	public List<OrderVO> getOrder(OrderVO vo);
	
	
}
