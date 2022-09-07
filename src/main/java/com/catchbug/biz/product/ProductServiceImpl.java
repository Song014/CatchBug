package com.catchbug.biz.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MainCategoryVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.ProductVO;
import com.catchbug.biz.vo.SubCategoryVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO pDao;

	@Override
	public List<MainCategoryVO> getMainCategory() {
		System.out.println("getMainCategory 작동");
		return pDao.getMainCategory();
	}

	@Override
	public List<SubCategoryVO> getSubCategory() {
		System.out.println("getSubCategory 작동");
		return pDao.getSubCategory();
	}

	@Override
	public void insertProduct(ProductVO vo) {
		System.out.println("insertProduct 작동");
		pDao.insertProduct(vo);
	}

	@Override
	public void insertImg(ImgVO vo) {
		pDao.insertImg(vo);
		
	}

	@Override

	public ProductVO getProduct(ProductVO vo) {
		return pDao.getProduct(vo);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		pDao.updateProduct(vo);
		
	}

	@Override
	public void updateImg(ImgVO vo) {
		pDao.updateImg(vo);
	}

	@Override
	public void deleteProduct(ProductVO vo) {
		pDao.deleteProduct(vo);
	}
	
	@Override
	public List<ProductVO> getProductList(CategoryVO vo) {

		return pDao.selectListProduct(vo);
	}

	@Override
	public OrderItemVO getProductItem(int product_no) {
		
		return pDao.selectOneProduct(product_no);

	}

	@Override
	public void updateStock(OrderItemVO oiv) {
		pDao.updateStock(oiv);
	}

	@Override
	public List<ProductVO> getList() {
		return pDao.getList();
	}


}
