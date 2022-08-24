package com.catchbug.biz.admin.stock;

import java.util.List;

import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ProductVO;

public interface StockService {

	List<ProductVO> getProductList();

	List<CategoryVO> getCategoryList();
	
}
