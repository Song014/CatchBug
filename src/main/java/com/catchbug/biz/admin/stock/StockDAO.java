package com.catchbug.biz.admin.stock;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ProductVO;

@Repository
public class StockDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertCart(CartVO vo) {
		System.out.println("insertCart 처리");
		mybatis.insert("CartMapper.insertCart", vo);
	} 

	public List<ProductVO> getProductList() {
		System.out.println("getProductList 처리");
		return mybatis.selectList("StockMapper.getProductList");
	}

	public List<CategoryVO> getCategoryList() {
		System.out.println("getCategoryList 처리");
		return mybatis.selectList("CategoryMapper.getCategoryList");
	}

}
