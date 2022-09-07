package com.catchbug.biz.franc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchbug.biz.admin.stock.StockService;
import com.catchbug.biz.product.ProductService;
import com.catchbug.biz.vo.CategoryVO;

@Controller
public class FrancController {
	@Autowired
	private StockService ss;
	
	@Autowired
	private ProductService ps;

	/* 가맹점관리 */
	// 상품리스트 관리자 꺼랑 안나눠져 있음
//	@RequestMapping("/stockList.do")
//	public String StockList() {
//		return "franc/stockList";
//	}
	// 발주서 작성
	/*
	 * @RequestMapping("/francOrder.do") public String FrancOrder() {
	 * 
	 * 
	 * return "franc/franc_order"; }
	 */
	

	// 상품 리스트
	@RequestMapping("/francStockList.do")
	public String StockList(Model model, CategoryVO vo) {

		// 처음 들어갔을때 카테고리 불러오기

		// 대분류 카테고리
		model.addAttribute("mainCategory", ss.getMainCategory());
		// 소분류 카테고리
		List<CategoryVO> category = ss.getSubCategory();
		model.addAttribute("subCategory", category);
		// 첫 요청 상품 데이터 최근 등록순
		vo.setSub_category(0);
		model.addAttribute("product", ps.getProductList(vo));
		return "franc/franc_stock_list";
	}
}
