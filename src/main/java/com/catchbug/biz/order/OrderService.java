package com.catchbug.biz.order;

import java.util.List;

import com.catchbug.biz.vo.Criteria;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;
import com.catchbug.biz.vo.TopOrderVO;

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
