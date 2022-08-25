
package com.catchbug.biz.account;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.catchbug.biz.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
    MemberService memberService;

	// 회원가입 시작
	@RequestMapping(value = "/sign_up.do", method = RequestMethod.GET)
	public String MemeberSignUp() {
		System.out.println("account/sign_up //회원가입 페이지에서  get방식  ");
		return "account/sign_up";
	}

	@RequestMapping(value = "/sign_up.do", method = RequestMethod.POST)
	public String InsertMember(MemberVO vo) {
		System.out.println("account/sign_up //회원가입 폼에서 post방식 ");
		memberService.insertMember(vo);

		return "account/login_page";
	}
	// 회원가입 끝

	// 로그인 시작
	@RequestMapping(value = "/login_page.do", method = RequestMethod.GET)
	public String MemeberLoginReady() {
		System.out.println("account/login_page //로그인 페이지에서  get방식  ");

		return "account/login_page";
	}

	@RequestMapping(value = "/login_page.do", method = RequestMethod.POST)
	public String MemberLogin(MemberVO vo, MemberDAOmybaits memberDAO,HttpSession session) {
		System.out.println("account/login_page //로그인 페이지에서  post방식 ");
		List<MemberVO> member = memberService.getMember(vo);
		
		
//		Iterator mem = member.iterator();
//		while(mem.hasNext()) {
//			System.out.println(mem.next());
//		}
 		
		for(MemberVO i: member) {
			System.out.println(i);
			System.out.println(i.getId());
			System.out.println(vo.getId());
			
			if(i.getId() != null) {
				System.out.println("환영합니다"+i.getId()+"님 어서오세요. 등급은 "+i.getLevel1()+"입니다");
				session.setAttribute("memberId", member);
				return "account/login_page";
		}
		}
		return "";
		
		
		
		
		
	}
}
//			List<MemberVO> memberList = 
//		if(member != null) {
//			session.setAttribute("member", member);
//			System.out.println("로그인성공");
//			return "account/sign_up";
//		}else {
//			System.out.println("외부인 안받음");
//			return "account/login_page";
//		}
		
	//로그인 끝