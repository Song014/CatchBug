package com.catchbug.biz.cart;

import java.util.List;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.ProductVO;

public interface CartService {

	String insertCart(CartVO vo);

	String deleteCart(CartVO vo);

	void updateCart(CartVO vo);

	List<CartVO> getCart(MemberVO member);

}
