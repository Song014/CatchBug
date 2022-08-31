package com.catchbug.biz.admin.stock;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ProductVO;



@Repository
public class StockDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	
	//검색조건에 맞는 상품리스트 검색
	public List<ProductVO> searchProductList(ProductVO vo){
		return mybatis.selectList("StockMapper.searchProduct",vo);
	}
	
	//선택한 상품의 모달창입력을 위한 메소드
	public List<ProductVO> getProductListO(ProductVO vo) {
		return mybatis.selectList("StockMapper.getProductListO",vo);
	}

	public List<CategoryVO> getMainCategory() {

		return  mybatis.selectList("CategoryMapper.getMainCategory");
	}

	public List<CategoryVO> getSubCategory() {
		
		return mybatis.selectList("CategoryMapper.getSubCategory");
	}


}
