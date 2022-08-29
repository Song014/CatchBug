package com.catchbug.biz.admin.stock;

import java.util.List;

import com.catchbug.biz.vo.CategoryVO;

public interface StockService {

	List<CategoryVO> getMainCategory();

	List<CategoryVO> getSubCategory();
}
