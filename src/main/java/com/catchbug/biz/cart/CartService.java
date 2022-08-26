package com.catchbug.biz.cart;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.ProductVO;

public interface CartService {

	void insertCart(CartVO vo);

	void deleteCart(CartVO vo);

}
