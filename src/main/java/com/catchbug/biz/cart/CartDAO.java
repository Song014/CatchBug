package com.catchbug.biz.cart;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.ProductVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// c
	public void insertCart(CartVO vo) {
		System.out.println("insertCart 처리");
		
		// 아이디 는 세션
		System.out.println(vo);
		mybatis.insert("CartMapper.insertCart", vo);
	} 
	// r
	
	// u 
	
	// d
	
	public void deleteCart(CartVO vo) {
		System.out.println("deleteCart 처리");
		mybatis.delete("CartMapper.deleteCart",vo);
	}
}
