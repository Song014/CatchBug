package com.catchbug.biz.cart;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.ProductVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// c
	public int insertCart(CartVO vo) throws SQLException{
		return mybatis.insert("CartMapper.insertCart", vo);
	} 
	// r
	public List<CartVO> selectListCart(MemberVO vo) {
		System.out.println(vo.getId());
		return mybatis.selectList("CartMapper.selectListCart", vo);
		
	}
	
	// u 
	public void updateCart(CartVO vo) {
		System.out.println("updateCart 처리");
		mybatis.update("CartMapper.updateCart",vo);
	}
	
	// d
	
	public int deleteCart(CartVO vo) {
		System.out.println("deleteCart 처리");
		return mybatis.delete("CartMapper.deleteCart",vo);
	}

	

	
}
