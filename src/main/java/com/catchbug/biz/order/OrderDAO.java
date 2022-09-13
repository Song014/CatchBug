package com.catchbug.biz.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.catchbug.biz.vo.QnaReplyVO;
import com.catchbug.biz.vo.TopOrderVO;
import com.catchbug.biz.vo.MemberVO;

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
// 가맹점 발주내역 리스트
	public List<OrderVO> getOrderList(OrderVO ovo) {
		return mybatis.selectList("OrderMapper.getOrderListid", ovo);
	}

	// 해당 가맹점 id의 주문서 상세 리스트(모달)
	public List<OrderVO> getOrderDetailList(OrderVO dvo) {
		return mybatis.selectList("OrderMapper.getOrderDetail", dvo);
	}
	//해당 가맹점 상세정보(모달)
	public MemberVO getMember(MemberVO mvo) {
		return mybatis.selectOne("MemberDAO.getMemberid", mvo);
	}
	//가맹점 본인 반주내역 리스트
	public List<OrderVO> getOrderListid(String id){
		return mybatis.selectList("OrderMapper.getOrderListid", id);
	}
	//가맹점 주문서 상세 조회(모달)
	public List<OrderVO> getOrderno(OrderVO ovo) {
		System.out.println("getOrderno 실행");
		return mybatis.selectList("OrderMapper.getOrderno", ovo);
	

	}

	public List<TopOrderVO> getTopOrderFactory() {
		return mybatis.selectList("OrderMapper.getTopOrderFactory");
	}

	public List<TopOrderVO> getTopOrderFranc(String id) {
		return mybatis.selectList("OrderMapper.getTopOrderFranc",id);
	}

	public int getUnOrderCount(String id) {
		return mybatis.selectOne("OrderMapper.getUnOrderCount",id);
	}

	
}
