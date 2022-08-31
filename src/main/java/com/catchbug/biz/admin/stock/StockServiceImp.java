package com.catchbug.biz.admin.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ProductVO;

@Service
public class StockServiceImp implements StockService {

	@Autowired
	private StockDAO dao;

	@Override
	public List<CategoryVO> getMainCategory() {
		return dao.getMainCategory();
	}

	@Override
	public List<CategoryVO> getSubCategory() {
		return dao.getSubCategory();
	}

	@Override
	public List<ProductVO> searchProductList(ProductVO vo) {
		return dao.searchProductList(vo);
	}

	@Override
	public List<ProductVO> getProductListO(ProductVO vo) {
		return dao.getProductListO(vo);
	}

}
