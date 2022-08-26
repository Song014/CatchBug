package com.catchbug.biz.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.ProductVO;

@Service
public class CartServiceImp implements CartService {
	
	@Autowired
	private CartDAO dao;

	@Override
	public void insertCart(CartVO vo) {
		
		
		dao.insertCart(vo);
	}

	@Override
	public void deleteCart(CartVO vo) {
		dao.deleteCart(vo);
	}

	@Override
	public void updateCart(CartVO vo) {
		System.out.println(vo);
		dao.updateCart(vo);
	}

}
