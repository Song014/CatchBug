package com.catchbug.biz.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.catchbug.biz.vo.MemberVO;

@Controller
@SessionAttributes("member")
public class MemberController {

	@Autowired
	private MemberService accountService;
	
	@RequestMapping(value="/sign_up.do", method=RequestMethod.GET)
	public String MemebersignUp() {
		System.out.println("account/sign_up //회원가입 페이지에서  get방식  ");
		return "account/sign_up";
	}
	
	@RequestMapping(value="/sign_up.do", method=RequestMethod.POST)
	public String insertMember(MemberVO vo) {
		System.out.println("account/sign_up //회원가입 폼에서 post방식 ");
		accountService.insertMember(vo);
		
		return "account/login_page";
		
		
		
	}
	
}
