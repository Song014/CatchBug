package com.catchbug.biz.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		return "index";
	}
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {

		return "main";
	}
	
	@RequestMapping("/master.do")
	public String MasterPage() {
		System.out.println("matser.do");
		return "main";
	}
	@RequestMapping("/user.do")
	public String UserPage() {
		return "index";
	}
	
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
	
	@RequestMapping("/free_Board_Write.do")
	public String FreeBoardWrite() {
		return "board/free_Board_Write";
	}
	
	@RequestMapping("/QnABoard.do")
	public String QnABoard() {
		return "board/QnABoard";
	}
	
	@RequestMapping("/QnA_Board_Write.do")
	public String QnABoardWrite() {
		return "board/QnA_Board_Write";
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
		return "franc/franc_Order_History";
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
	
	@RequestMapping("/orderList.do")
	public String orderList() {
		
		return "franc/franc_OrderList";
	}
	
	@RequestMapping("/factory_franc_WaitList.do")
	public String franc_WaitList() {
		
		return "factory/factory_franc_WaitList";
	}


	@RequestMapping("/factory_StorckList.do")
	public String FactorySotckList() {
		return "factory/factory_StockList";
	}

	@RequestMapping("/main_StorckList.do")
	public String mainSotckList() {
		return "factory/main_StockList";
	}

	@RequestMapping("/main_ProductRegister.do")
	public String mainProductRegister() {
		return "factory/main_ProductRegister";
	}
	
	@RequestMapping("/stockList.do")
	public String StockList() {
		return "item/stockList";
	}
	
	@RequestMapping("/factoryStockList.do")
	public String FactoryStockList() {
		return "factory/factory_StockList";
	}
	
	@RequestMapping("/productRegister.do")
	public String ProductRegister() {
		return "item/productRegister";
	}

}
