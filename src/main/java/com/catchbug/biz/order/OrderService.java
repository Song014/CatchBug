package com.catchbug.biz.order;

import com.catchbug.biz.vo.*;

import java.util.List;

public interface OrderService {

	void insertOrder(OrderVO oi);

	void insertOrderItemList(OrderItemVO oiv);

	List<OrderVO> getOrderList();

	List<OrderVO> getOrderDetailList(OrderVO dvo);

	List<OrderVO> getOrderSearch(Criteria cri);

	MemberVO getMember(MemberVO mvo);

	List<OrderVO> getOrderListid(String id);

	List<OrderVO> getOrderno(OrderVO ovo);

	List<TopOrderVO> getTopOrderFactory();

	List<TopOrderVO> getTopOrderFranc(String id);

	int getUnOrderCount(String id);

}