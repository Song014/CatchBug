package com.catchbug.biz.order;

import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
	@Override
	public List<OrderVO> getOrderList(OrderVO ovo) {
		System.out.println("getOrderList ServiceImpl");
		return dao.getOrderList(ovo);
	}
	@Override
	public List<OrderVO> getOrderDetailList(OrderVO dvo) {
		System.out.println("getOrderDetailList ServiceImpl");
		return dao.getOrderDetailList(dvo);
	}

	@Override
	public MemberVO getMember(MemberVO mvo) {
		System.out.println("getMember ServiceImpl");
		return dao.getMember(mvo);
	}
	@Override
	public List<OrderVO> getOrderListid(OrderVO ovo) {
		System.out.println(dao.getOrderListid(ovo));
		return dao.getOrderListid(ovo);
	}

	@Override
	public List<OrderVO> getOrderno(OrderVO ovo) {
		System.out.println("getOrderno ServiceImpl");
		return dao.getOrderno(ovo);
	}
}
