package com.catchbug.biz.admin.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ProductVO;

@Service
public class StockServiceImp implements StockService {

	@Autowired
	private StockDAO dao;
	
	@Override
	public List<ProductVO> getProductList() {

		return dao.getProductList();
	}

	@Override
	public List<CategoryVO> getCategoryList() {
		
		return dao.getCategoryList();
	}

	@Override
	public void insertCart(CartVO vo) {
		
		dao.insertCart(vo);
	}

}
