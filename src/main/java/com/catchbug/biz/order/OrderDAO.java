package com.catchbug.biz.order;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.QnaReplyVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void getOrder() {
		// TODO 주문내역 불러오기

	}

	public void insertOrder(OrderVO oi) {
		System.out.println(oi + "다오");
		mybatis.insert("OrderMapper.insertOrder", oi);
	}

	public void insertOrderItemList(OrderItemVO oiv) {

		mybatis.insert("OrderMapper.insertItemList", oiv);
	}

	
}
