package com.catchbug.biz.order;

import java.util.List;

import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;
import com.catchbug.biz.vo.TopOrderVO;

public interface OrderService {

	void getOrder();

	void insertOrder(OrderVO oi);

	void insertOrderItemList(OrderItemVO oiv);
	
	List<OrderVO> getOrderList(OrderVO ovo);
	
	List<OrderVO> getOrderDetailList(OrderVO dvo);
	
	MemberVO getMember(MemberVO mvo);
	
	OrderVO getOrderListid(OrderVO ovo);
	
	List<OrderVO> getOrderno(OrderVO ovo);

	List<TopOrderVO> getTopOrderFactory();

	List<TopOrderVO> getTopOrderFranc(String id);

	int getUnOrderCount(String id);
	
}
