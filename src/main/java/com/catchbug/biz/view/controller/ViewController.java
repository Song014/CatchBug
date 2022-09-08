package com.catchbug.biz.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		return "company/company_intro";
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
