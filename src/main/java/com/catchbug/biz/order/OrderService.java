package com.catchbug.biz.order;

import com.catchbug.biz.vo.*;

import java.util.List;

public interface OrderService {


    void insertOrder(OrderVO oi);

    void insertOrderItemList(OrderItemVO oiv);

    List<OrderVO> getOrderList(OrderVO ovo);

    List<OrderVO> getOrderDetailList(OrderVO dvo);

    MemberVO getMember(MemberVO mvo);

    List<OrderVO> getOrderListid(String id);

    List<OrderVO> getOrderno(OrderVO ovo);

    List<TopOrderVO> getTopOrderFactory();

    List<TopOrderVO> getTopOrderFranc(String id);

    int getUnOrderCount(String id);

	List<OrderVO> getOrderSearch(Criteria cri);

}
