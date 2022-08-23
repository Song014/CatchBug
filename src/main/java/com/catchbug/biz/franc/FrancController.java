package com.catchbug.biz.franc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrancController {
	
	/* 가맹점관리 */
	// 상품리스트 관리자 꺼랑 안나눠져 있음
//	@RequestMapping("/stockList.do")
//	public String StockList() {
//		return "franc/stockList";
//	}
	// 발주서 작성
	@RequestMapping("/francOrder.do")
	public String FrancOrder() {
		return "franc/franc_order";
	}
	// 발주 내역
	@RequestMapping("/francOrderHistory.do")
	public String FancOrderHistory() {
		return "franc/franc_order_history";
	}
}
