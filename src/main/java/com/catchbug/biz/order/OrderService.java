package com.catchbug.biz.order;

import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;

public interface OrderService {

	void getOrder();

	void insertOrder(OrderVO oi);

	void insertOrderItemList(OrderItemVO oiv);
	
}
