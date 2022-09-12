package com.catchbug.biz.order;

import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;

import java.util.List;

public interface OrderService {

	void getOrder();

	void insertOrder(OrderVO oi);

	void insertOrderItemList(OrderItemVO oiv);
	
	List<OrderVO> getOrderList(OrderVO ovo);
	
	List<OrderVO> getOrderDetailList(OrderVO dvo);
	
	MemberVO getMember(MemberVO mvo);

	List<OrderVO> getOrderListid(OrderVO ovo);
	
	List<OrderVO> getOrderno(OrderVO ovo);
	
}
