package com.catchbug.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.catchbug.biz.vo.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {

		return "main";
	}
	
	/* 가맹점 관리 */
	// 전체 가맹리스트
	@RequestMapping("/member_List.do")
	public String memberList() {
		return "account/member_list";
	}
	// 가맹점 주문내역
	@RequestMapping("/orderHistory.do")
	public String orderHistory() {
		return "admin/order_history";
	}
	// 가입승인 대기목록
	@RequestMapping("/factory_franc_wait_list.do")
	public String franc_WaitList(Model model) {
		System.out.println("컨트롤러");
		List<MemberVO> member_list = adminService.getMemberList();
		
		model.addAttribute("list", member_list);
		System.out.println(member_list);
		return "admin/factory_franc_wait_list";
	}
	// 미출고 주문 현황
	@RequestMapping("/unOrderHistory.do")
	public String unOrderHistory() {
		return "admin/un_order_history";
	}
	
	/* 재고 관리 */
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
	public String factoryOrder() {
		return "admin/factory_order";
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
