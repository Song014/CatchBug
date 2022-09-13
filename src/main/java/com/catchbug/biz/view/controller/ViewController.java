package com.catchbug.biz.view.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.catchbug.biz.order.OrderService;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.TopOrderVO;

@Controller
public class ViewController {

	@Autowired
	OrderService os;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		// TODO 판매 현황 이미지, 상품명, 가격, 주문수, 금액 관리자, 가맹점 따로
		MemberVO member = (MemberVO) session.getAttribute("member");
		// 관리자일때 가맹점일때 보이는게 다름
		if (member != null) {
			List<TopOrderVO> topOrder = new ArrayList<TopOrderVO>();
			int total = 0;
			String id = null;
			for (TopOrderVO topOrderVO : member.getLevel1() == 2 ? os.getTopOrderFranc(member.getId())
					: os.getTopOrderFactory()) {
				topOrderVO.initTotal(); 
				topOrder.add(topOrderVO);
				total += topOrderVO.getTotal(); //
			}
			
			if(member.getLevel1()==2) {
				id = member.getId();
			} 
			model.addAttribute("count",os.getUnOrderCount(id));
			model.addAttribute("total", total);
			model.addAttribute("topOrder", topOrder);
			
			
		} else {
			return "redirect:/login_page.do";
		}

		return "index";
	}

	@RequestMapping("/emailAuthSuccess.do")
	public String emailAuthSuccess() {
		return "/";
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

	/* 회사소개 */
	@RequestMapping("/company_intro.do")
	public String companyIntro() {
		return "company/company_intro";
	}

	@RequestMapping("/howto_way.do")
	public String howtoWay() {
		return "company/howto_way";
	}

}
