package com.catchbug.biz.admin.stock;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.ProductVO;

@Repository
public class StockDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertCart(ProductVO vo) {
		System.out.println("insertCart 처리");
		
		// 아이디 는 세션
		vo.setCategory_no(2);
		mybatis.insert("CartMapper.insertCart", vo);
	} 

	public List<ProductVO> getProductList(CategoryVO vo) {
		System.out.println("getProductList 처리");
		
		// 하위 카테고리 번호가 0이면 전체 리스트 최신순 
		if(vo.getSub_category()==0) {
			return mybatis.selectList("StockMapper.getProductList");
		} else {
			return mybatis.selectList("StockMapper.getProductListC", vo);
		}
		
		
	}


	public List<CategoryVO> getMainCategory() {

		return  mybatis.selectList("CategoryMapper.getMainCategory");
	}

	public List<CategoryVO> getSubCategory() {
		
		return mybatis.selectList("CategoryMapper.getSubCategory");
	}

	public void deleteCart(ProductVO vo) {
		System.out.println("deleteCart 처리");
		mybatis.delete("CartMapper.deleteCart",vo);
	}

}
