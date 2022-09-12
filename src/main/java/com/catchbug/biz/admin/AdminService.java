package com.catchbug.biz.admin;

import java.util.HashMap;
import java.util.List;

import com.catchbug.biz.vo.Criteria;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;
import com.catchbug.biz.vo.SearchVO;

public interface AdminService {

	public List<MemberVO> getMemberList();

	public List<MemberVO> getMemberWaitList();

	public void memberLevelUpdate(MemberVO vo);

	public void memberrefuse(MemberVO vo);

	public List<HashMap<String, Object>> getunOrderHistory(Criteria cri);
	public MemberVO getMemberM(MemberVO vo);
	public List<OrderVO> getOrder(OrderVO vo);
	public List<MemberVO> franc_SearchList(SearchVO vo);

	public List<OrderVO> franc_SearchList2(SearchVO vo);
	


	public List<OrderItemVO> getOrder_detail(OrderVO vo);
	public int getProduct_Quantily(int product_no);
	public int update_Quantily(OrderItemVO list);
	public void update_order_status(OrderVO vo);
	public void update_order_refuse(OrderVO vo);

	public int count(Criteria cri);
}
