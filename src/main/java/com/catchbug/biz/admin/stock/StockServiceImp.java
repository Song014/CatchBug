package com.catchbug.biz.admin.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.ProductVO;

@Service
public class StockServiceImp implements StockService {

	@Autowired
	private StockDAO dao;
	
	@Override
	public List<ProductVO> getProductList(CategoryVO vo) {
		return dao.getProductList(vo);
	}

	@Override
	public List<CategoryVO> getMainCategory(){
		return dao.getMainCategory();
	}
	
	@Override
	public List<CategoryVO> getSubCategory() {
		return dao.getSubCategory();
	}

	@Override
	public void insertCart(ProductVO vo) {
		dao.insertCart(vo);
	}

	@Override
	public void deleteCart(ProductVO vo) {
		dao.deleteCart(vo);
	}

	

}
