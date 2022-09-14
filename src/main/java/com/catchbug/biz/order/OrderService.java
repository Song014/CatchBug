package com.catchbug.biz.order;

import com.catchbug.biz.vo.*;

import java.util.List;

public interface OrderService {

	void insertOrder(OrderVO oi);

	void insertOrderItemList(OrderItemVO oiv);

	public List<OrderVO> factoryOrderList(Criteria cri);

	List<OrderVO> getOrderList();

	List<OrderVO> getOrderDetailList(OrderVO dvo);

	List<OrderVO> getOrderSearch(Criteria cri);

	MemberVO getMember(MemberVO mvo);

	List<OrderVO> getOrderListid(String id);

	List<OrderVO> getOrderno(OrderVO ovo);

	List<TopOrderVO> getTopOrderFactory();

	List<TopOrderVO> getTopOrderFranc(String id);

	int getUnOrderCount(String id);

	List<OrderVO> getfactoryOrderList();

	List<OrderVO> factoryOrderList(OrderVO vo);


}