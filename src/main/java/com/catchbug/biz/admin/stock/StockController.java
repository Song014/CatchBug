package com.catchbug.biz.admin.stock;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StockController {

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

	// 임시
//	@RequestMapping("/francOrder.do")
//	public String FrancOrder(Model model) {
//		List<ProductVO> productList = ss.getProductList();
//		for (ProductVO list : productList) {
//			System.out.println(list);
//		}
//		model.addAttribute("product", productList);
//
//		return "franc/franc_order";
//	}

	// 본사 발주 내역
	@RequestMapping("/factory_Order_History.do")
	public String FactoryOrderHistory() {
		return "admin/factory_order_history";
	}
}
