package com.catchbug.biz.admin;

import com.catchbug.biz.vo.*;

import java.util.HashMap;
import java.util.List;

public interface AdminService {

	

	public List<MemberVO> getMemberWaitList();

	public void memberLevelUpdate(MemberVO vo);

	public void memberrefuse(MemberVO vo);

	public List<HashMap<String, Object>> getunOrderHistory(Criteria cri);
	public MemberVO getMemberM(MemberVO vo);
	public List<OrderVO> getOrder(OrderVO vo);
	
	
	public List<MemberVO> franc_SearchList(SearchVO vo);

	public List<OrderVO> franc_SearchList2(SearchVO vo);
	
	public List<MemberVO> factory_SearchList(SearchVO sv);
	
	public List<OrderVO> factory_SearchList2(SearchVO sv);


	public List<OrderItemVO> getOrder_detail(OrderVO vo);
	public int getProduct_Quantily(int product_no);
	public int update_Quantily(OrderItemVO list);
	public void update_order_status(OrderVO vo);
	public void update_order_refuse(OrderVO vo);

	public List<MemberVO> getMemberList(Criteria cri);
	public int listCount(Criteria cri);

	

}
