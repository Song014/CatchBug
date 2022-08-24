package com.catchbug.biz.product;

import java.util.List;

import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MainCategoryVO;
import com.catchbug.biz.vo.ProductVO;
import com.catchbug.biz.vo.SubCategoryVO;

public interface ProductService {
	
	public List<MainCategoryVO> getMainCategory();
	
	public List<SubCategoryVO> getSubCategory();

	public void insertProduct(ProductVO vo);
	
	public void insertImg(ImgVO vo);
}
