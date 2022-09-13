package com.catchbug.biz.order;

import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;
import com.catchbug.biz.vo.TopOrderVO;

import java.util.List;

public interface OrderService {


    void insertOrder(OrderVO oi);

    void insertOrderItemList(OrderItemVO oiv);

    List<OrderVO> getOrderList();

    List<OrderVO> getOrderDetailList(OrderVO dvo);

    MemberVO getMember(MemberVO mvo);

    List<OrderVO> getOrderListid(String id);

    List<OrderVO> getOrderno(OrderVO ovo);

    List<TopOrderVO> getTopOrderFactory();

    List<TopOrderVO> getTopOrderFranc(String id);

    int getUnOrderCount(String id);

}
