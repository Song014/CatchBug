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
	
	
	@RequestMapping("/master.do")
	public String MasterPage() {
		System.out.println("matser.do");
		return "main";
	}
	@RequestMapping("/user.do")
	public String UserPage() {
		
		
		return "index";
	}
	
	
	
	
	/* 계정 */
//	@RequestMapping("/sign_up.do")
//	public String signUp() {
//		return "account/sign_up";
//	}
//	
//	@RequestMapping("/login_page.do")
//	public String loginPage() {
//		return "account/login_page";
//	}
	
	@RequestMapping("/logout.do")
	public String loginOut() {
		return "account/login_page";
	}
	
	@RequestMapping("/find_id.do")
	public String findId() {
		return "account/find_id";
	}
	
	@RequestMapping("/find_pw.do")
	public String findPw() {
		return "account/find_pw";
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
