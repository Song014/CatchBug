package com.catchbug.biz.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MainCategoryVO;
import com.catchbug.biz.vo.ProductVO;
import com.catchbug.biz.vo.SubCategoryVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MainCategoryVO> getMainCategory(){
		System.out.println("==>getMainCategory DAO 작동");
		return mybatis.selectList("Product.mainCategory");
	}
	
	public List<SubCategoryVO> getSubCategory(){
		System.out.println("==>getSubCategory DAO 작동");
		return mybatis.selectList("Product.subCategory");
	}
	
	public void insertProduct(ProductVO vo) {
		System.out.println("==>insertProduct DAO 작동");
		mybatis.insert("Product.insertProduct", vo);
	}
	
	public void insertImg(ImgVO vo) {
		System.out.println("==>insertImg DAO 작동");
		mybatis.insert("Product.insertImg",vo);
	}

	public List<ProductVO> selectListProduct(CategoryVO vo) {
		// 하위 카테고리 번호가 0이면 전체 리스트 최신순 
		if(vo.getSub_category()==0) {
			return mybatis.selectList("StockMapper.getProductList");
		} else {
			return mybatis.selectList("StockMapper.getProductListC", vo);
		}
	}
	
	

}
