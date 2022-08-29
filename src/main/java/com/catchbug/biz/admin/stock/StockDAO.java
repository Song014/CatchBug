package com.catchbug.biz.admin.stock;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.CategoryVO;



@Repository
public class StockDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<CategoryVO> getMainCategory() {

		return  mybatis.selectList("CategoryMapper.getMainCategory");
	}

	public List<CategoryVO> getSubCategory() {
		
		return mybatis.selectList("CategoryMapper.getSubCategory");
	}

	

}
