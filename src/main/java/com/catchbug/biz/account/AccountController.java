package com.catchbug.biz.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.catchbug.biz.vo.AccountService;
import com.catchbug.biz.vo.AccountVO;

@Controller
@SessionAttributes("account")
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/sign_up.do", method=RequestMethod.GET)
	public String signUp() {
		System.out.println("account/sign_up //get");
		return "account/sign_up";
	}
	
	@RequestMapping(value="/sign_up.do", method=RequestMethod.POST)
	public String insertAccount(AccountVO vo) {
		System.out.println("account/sign_up //post");
		accountService.insertAccount(vo);
		
		return "account/login_page";
	}
	
}
