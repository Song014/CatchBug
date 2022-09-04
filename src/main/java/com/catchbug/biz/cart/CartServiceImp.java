package com.catchbug.biz.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.MemberVO;

@Service
public class CartServiceImp implements CartService {
	
	@Autowired
	private CartDAO dao;
	
	@Override
	public List<CartVO> getCart(MemberVO vo) {

		return dao.selectListCart(vo);
	}

	@Override
	public String insertCart(CartVO vo) {
		
		try {
			// 1성공 Exception 실패
			if (dao.insertCart(vo)== 1) {
				return "ok";
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return null;
	}

	@Override
	public String deleteCart(CartVO vo) {
		try {
			int result = dao.deleteCart(vo);
			if(result==0) {
				return "false";
			} else if(result==1) {
				return "true";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return null;
		
	}

	@Override
	public void updateCart(CartVO vo) {
		System.out.println(vo);
		dao.updateCart(vo);
	}

	

}
