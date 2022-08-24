package com.catchbug.biz.admin.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ProductVO;

@Controller
public class StockController {
	
	@Autowired
	private StockService ss;
	
	// 상품 리스트
	@RequestMapping("/stockList.do")
	public String StockList() {
		return "admin/stock_list";
	}

	// 본사 재고현황
	@RequestMapping("/factoryStockList.do")
	public String FactoryStockList() {
		return "admin/factory_stock_list";
	}

	// 본사 발주서 작성
	@RequestMapping("/factoryOrder.do")
	public String factoryOrder(Model model) {
			
		// 처음 들어갔을때 카테고리 불러오기
		List<CategoryVO> categoryList = ss.getCategoryList();
		for(CategoryVO list: categoryList) {
			System.out.println(list);
		}
		model.addAttribute("category",categoryList);
		
		// 기본 상품 데이터 출력 등록순?
		List<ProductVO> productList = ss.getProductList();
		for(ProductVO list: productList) {
			System.out.println(list);
		}
		model.addAttribute("product",productList);
		
		return "admin/factory_order";
	}
	
	// 임시
	@RequestMapping("/francOrder.do")
	public String FrancOrder(Model model) {
		List<ProductVO> productList = ss.getProductList();
		for(ProductVO list: productList) {
			System.out.println(list);
		}
		model.addAttribute("product",productList);
		
		return "franc/franc_order";
	}

	// 본사 발주 내역
	@RequestMapping("/factory_Order_History.do")
	public String FactoryOrderHistory() {
		return "admin/factory_order_history";
	}

	// 상품 등록
	@RequestMapping("/productRegister.do")
	public String ProductRegister() {
		return "admin/product_register";
	}
}
