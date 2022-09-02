package com.catchbug.biz.admin;


import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//메인 페이지
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {
		return "main";
	}
	
	/* 가맹점 관리 */
	// 전체 가맹리스트
	@RequestMapping("/member_List.do")
	public String memberList(Model model, MemberVO vo) {
		
		System.out.println("컨트롤러"); 
		  List<MemberVO> member_list = adminService.getMemberList();
		  
		  model.addAttribute("list", member_list);
		
		return "account/member_list";
	}
	
	// 가입승인 대기목록
	@RequestMapping("/factory_franc_wait_list.do")
	public String franc_WaitList(MemberVO vo, Model model) {
		
		  System.out.println("컨트롤러"); 
		  
		  List<MemberVO> member_list = adminService.getMemberWaitList();
		  model.addAttribute("list", member_list); 
		 
		return "admin/factory_franc_wait_list";
	}
	
	// 가입 승인 처리
	@RequestMapping("/member_approval.do")
	public String franc_Member_Approval(MemberVO vo) {
			
		System.out.println("가입 승인 컨트롤러 회원아이디 : " + vo.getId());
		adminService.memberLevelUpdate(vo);
		
		return "redirect:factory_franc_wait_list.do";
	}
	// 가입 반려
	@RequestMapping("/member_refuse.do")
	public String franc_Member_refuse(MemberVO vo) {
		
		System.out.println("가입 반려 컨트롤러 회원아이디 : " + vo.getId());
		
		adminService.memberrefuse(vo);
		
		return "redirect:factory_franc_wait_list.do";
	}
	
	// 미출고 주문 현황
	@RequestMapping("/unOrderHistory.do")
	public String unOrderHistory(Model model) {
		
		System.out.println("미출고 컨트롤러");
		List<HashMap<String,Object>> list = adminService.getunOrderHistory();
		System.out.println(list.get(0).get("ID"));
		model.addAttribute("list", list);
		return "admin/un_order_history";
	}  
	
	// 사업장 정보 모달
	@GetMapping("/memberInfo.do")
	@ResponseBody
	public MemberVO getMemberVO(MemberVO vo){
		System.out.println("회원정보 모달 컨트롤러");
		return adminService.getMemberM(vo);
	}
	
	// 주문 상세보기
	@GetMapping("/orderDetail.do")
	@ResponseBody
	public List<OrderVO> getOrder(MemberVO vo) {
		System.out.println("주문 상세보기 모달 컨트롤러");
		List<OrderVO> vo3 = adminService.getOrder(vo);
		System.out.println(vo3);
		return vo3;
	}
	
	// 가맹점 주문내역
		@RequestMapping("/orderHistory.do")
		public String orderHistory() {
			return "admin/order_history";
		}
	  
	
	
	/* 재고 관리 */
	
	
}
