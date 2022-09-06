package com.catchbug.biz.product;

import java.util.List;

import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MainCategoryVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.ProductVO;
import com.catchbug.biz.vo.SubCategoryVO;

public interface ProductService {
	
	public List<MainCategoryVO> getMainCategory();
	
	public List<SubCategoryVO> getSubCategory();

	public void insertProduct(ProductVO vo);
	
	public void insertImg(ImgVO vo);
	

	public ProductVO getProduct(ProductVO vo);
	
	public void updateProduct(ProductVO vo);
	
	public void updateImg(ImgVO vo);
	
	public void deleteProduct(ProductVO vo);

	List<ProductVO> getProductList(CategoryVO vo);

	OrderItemVO getProductItem(int product_no);
	
	public void updateStock(OrderItemVO oiv);

}
