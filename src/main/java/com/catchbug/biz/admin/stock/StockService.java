package com.catchbug.biz.admin.stock;

import java.util.List;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.ProductVO;

public interface StockService {

	List<ProductVO> getProductList(CategoryVO vo);

	List<CategoryVO> getMainCategory();

	List<CategoryVO> getSubCategory();
	
	void insertCart(ProductVO vo);

	void deleteCart(ProductVO vo);
	
	List<ProductVO> searchProductList(ProductVO vo);
	
	List<ProductVO> getProductListO(ProductVO vo);

	
}
