package com.catchbug.biz.admin.stock;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.ProductVO;

@Repository
public class StockDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<ProductVO> getList() {

		System.out.println("기능 처리");
		return mybatis.selectList("StockMapper.getList");
	}
	
	
	

}
