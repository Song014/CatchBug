package com.catchbug.biz.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {
	
	@RequestMapping("/notice_Board.do")
	public String NoticeBoard() {
		return "board/notice_Board";
	}
	
	@RequestMapping("/notice_Board_Write.do")
	public String NoticeBoardWrite() {
		return "board/notice_Board_Write";
	}
	
	@RequestMapping("/freeBoard.do")
	public String FreeBoard() {
		return "board/freeBoard";
	}
	
	@RequestMapping("/QnABoard.do")
	public String QnABoard() {
		return "board/QnABoard";
	}
	
	@RequestMapping("/FAQBoard.do")
	public String FAQBoard() {
		return "board/FAQBoard";
	}
	@RequestMapping("/francOrder.do")
	public String FrancOrder() {
		return "franc/francOrder";
	}
	
	@RequestMapping("/factory_Order_History.do")
	public String FactoryOrderHistory() {
		return "factory/factory_Order_History";
	}
	
	@RequestMapping("/francOrderHistory.do")
	public String FancOrderHistory() {
		return "franc/fanc_Order_History";
	}
	
	@RequestMapping("/factoryOrder.do")
	public String factoryOrder() {
		return "factory/factoryOrder";
	}
	@RequestMapping("/unOrderHistory.do")
	public String unOrderHistory() {
		return "factory/unOrderHistory";
	}
	@RequestMapping("/orderHistory.do")
	public String orderHistory() {
		return "factory/orderHistory";
	}


}