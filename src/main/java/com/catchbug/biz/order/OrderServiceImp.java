package com.catchbug.biz.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;

@Service
public class OrderServiceImp implements OrderService {

	@Autowired
	private OrderDAO dao;
	
	@Override
	public void getOrder() {
		// TODO 주문내역 불러오기

	}

	@Override
	public void insertOrder(OrderVO oi) {
		System.out.println(oi+"서비스");
		dao.insertOrder(oi);
	}

	@Override
	public void insertOrderItemList(OrderItemVO oiv) {
		
		dao.insertOrderItemList(oiv);
	}

}
