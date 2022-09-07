package com.catchbug.biz.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MainCategoryVO;
import com.catchbug.biz.vo.OrderItemVO;
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
	
	@Transactional
	public void insertProduct(ProductVO vo) {
		mybatis.insert("Product.insertProduct", vo);
		mybatis.insert("Product.insertProductQuantily", vo);
	}
	
	public void insertImg(ImgVO vo) {
		mybatis.insert("Product.insertImg",vo);
	}

	public List<ProductVO> selectListProduct(CategoryVO vo) {
		// 하위 카테고리 번호가 0이면 전체 리스트 최신순 
		if(vo.getSub_category()==0) {
			return mybatis.selectList("Product.getProductList");
		} else {
			return mybatis.selectList("Product.getProductListC", vo);
		}
	}

	public OrderItemVO selectOneProduct(int product_no) {
		
		return mybatis.selectOne("Product.getProductItem", product_no);
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
	
	public void deleteProduct(ProductVO vo) {
		mybatis.delete("Product.deleteProduct",vo);
	}

	public void updateStock(OrderItemVO oiv) {
		System.out.println(oiv);
		mybatis.update("Product.updateStock",oiv);
	}

	public List<ProductVO> getList(){
		return mybatis.selectList("Product.productList");
	}
	
	

}
