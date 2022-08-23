package com.catchbug.biz.admin.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.ProductVO;

@Service
public class StockServiceImp implements StockService {

	@Autowired
	private StockDAO dao;
	
	@Override
	public List<ProductVO> getList() {
		// TODO Auto-generated method stub
		return dao.getList();
	}

}
