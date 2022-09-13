package com.catchbug.biz.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;
import com.catchbug.biz.vo.TopOrderVO;

@Service
public class OrderServiceImp implements OrderService {

    @Autowired
    private OrderDAO dao;


    @Override
    public void insertOrder(OrderVO oi) {
        System.out.println(oi + "서비스");
        dao.insertOrder(oi);
    }

    @Override
    public void insertOrderItemList(OrderItemVO oiv) {

        dao.insertOrderItemList(oiv);
    }

    @Override
    public List<OrderVO> getOrderList() {
        System.out.println("getOrderList ServiceImpl");
        return dao.getOrderList();
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
    public List<OrderVO> getOrderListid(String id) {
        System.out.println("getOrderListid ServiceImpl");
        return dao.getOrderListid(id);
    }

    @Override
    public List<OrderVO> getOrderno(OrderVO ovo) {
        System.out.println("getOrderno ServiceImpl");
        return dao.getOrderno(ovo);
    }

    @Override
    public List<TopOrderVO> getTopOrderFactory() {
        return dao.getTopOrderFactory();
    }

    @Override
    public List<TopOrderVO> getTopOrderFranc(String id) {
        return dao.getTopOrderFranc(id);
    }

    @Override
    public int getUnOrderCount(String id) {
        return dao.getUnOrderCount(id);
    }
}
