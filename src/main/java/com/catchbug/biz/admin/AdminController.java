package com.catchbug.biz.admin;


import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.catchbug.biz.vo.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService AdminService;
	
	
	
	
	//메인 페이지
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {
		return "main";
	}
	
	/* 가맹점 관리 */
//	// 전체 가맹리스트
//	@RequestMapping("/member_List.do")
//	public String memberList() {
//		return "account/member_list";
//	}
	// 가맹점 주문내역
	@RequestMapping("/orderHistory.do")
	public String orderHistory() {
		return "admin/order_history";
	}
	// 가입승인 대기목록
	@RequestMapping("/factory_franc_wait_list.do")
	public String franc_WaitList(MemberVO vo, Model model) {
		
		  System.out.println("컨트롤러"); 
		  
		  List<MemberVO> member_list = AdminService.getMemberList();
		  model.addAttribute("list", member_list); 
		 
		return "admin/factory_franc_wait_list";
	}
	
	// 가입 승인 처리
	@RequestMapping("/member_approval.do")
	public String franc_Member_Approval(MemberVO vo) {
			
		System.out.println("가입 승인 컨트롤러 회원아이디 : " + vo.getId());
		AdminService.memberLevelUpdate(vo);
		
		return "redirect:factory_franc_wait_list.do";
	}
	// 가입 반려
	@RequestMapping("/member_refuse.do")
	public String franc_Member_refuse(MemberVO vo) {
		
		System.out.println("가입 반려 컨트롤러 회원아이디 : " + vo.getId());
		
		AdminService.memberrefuse(vo);
		
		return "redirect:factory_franc_wait_list.do";
	}
	

	@RequestMapping("/franc_wait_list.do")
	public String franc_WaitList() {
		
		return "admin/franc_wait_list";
	}

	// 미출고 주문 현황
	@RequestMapping("/unOrderHistory.do")
	public String unOrderHistory() {
		return "admin/un_order_history";
	}
	
	/* 재고 관리 */
	
	
}
