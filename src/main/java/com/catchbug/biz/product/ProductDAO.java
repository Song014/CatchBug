package com.catchbug.biz.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MainCategoryVO;
import com.catchbug.biz.vo.ProductVO;
import com.catchbug.biz.vo.SubCategoryVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MainCategoryVO> getMainCategory(){
		return mybatis.selectList("Product.mainCategory");
	}
	
	public List<SubCategoryVO> getSubCategory(){
		return mybatis.selectList("Product.subCategory");
	}
	
	public void insertProduct(ProductVO vo) {
		mybatis.insert("Product.insertProduct", vo);
	}
	
	public void insertImg(ImgVO vo) {
		mybatis.insert("Product.insertImg",vo);
	}
	
	public ProductVO getProduct(ProductVO vo) {
		return mybatis.selectOne("Product.getProduct",vo);
	}
	
	public void updateProduct(ProductVO vo) {
		mybatis.update("Product.updateProduct",vo);
	}
	
	public void updateImg(ImgVO vo) {
		mybatis.update("Product.updateImg",vo);
	}
	
	

}
