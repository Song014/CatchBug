
package com.catchbug.biz.account;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catchbug.biz.vo.MemberVO;

@Controller
public class MemberController {

	@Inject
	BCryptPasswordEncoder pwdEncoder;

	@Autowired
	MemberService memberService;

	// 회원가입 페이지이동
	@RequestMapping(value = "/sign_up.do", method = RequestMethod.GET)
	public ModelAndView MemeberSignUp() {
		System.out.println("account/sign_up //회원가입 페이지에서  get방식  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/sign_up");
		return mav;
	}

	// 회원가입(암호화)
	@RequestMapping(value = "/sign_up.do", method = RequestMethod.POST)
	public String InsertMember(MemberVO vo) {
		System.out.println("account/sign_up //회원가입 폼에서 post방식 ");

		int result = memberService.idcheck(vo);

		if (result == 1) {
			return "account/sign_up";
			// 입력된 아이디가 존재한다면 >> 다시 회원가입 페이지로 돌아가기
		} else if (result == 0) {
			System.out.println("아이디 중복 x");
			String inputPass = vo.getPass();
			String pwd = pwdEncoder.encode(inputPass);
			vo.setPass(pwd);

			memberService.insertMember(vo);
			return "account/login_page";
			// 존재하지 않는 아이디라면 회원가입 진행
		}
		return "account/login_page";
	}

	// 로그인 페이지이동
	@RequestMapping(value = "/login_page.do", method = RequestMethod.GET)
	public ModelAndView MemeberLoginReady() {
		System.out.println("account/login_page //로그인 페이지에서  get방식  ");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/login_page");
		return mav;
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		mav.setViewName("redirect:login_page.do");
		return mav;
	}

	// 로그인
	@RequestMapping(value = "/login_page.do", method = RequestMethod.POST)
	public String MemberLogin(MemberVO vo, HttpSession session, RedirectAttributes ra) {
		System.out.println("account/login_page //로그인 페이지에서  post방식 ");
		session.getAttribute("member");
		MemberVO login = memberService.getMember(vo);
		boolean pwdMatch = pwdEncoder.matches(vo.getPass(), login.getPass());

		if (login != null && pwdMatch == true) {
			session.setAttribute("member", login);
			System.out.println("값 잘 들어감");
			return "account/mypage";
		} else {
			session.setAttribute("member", null);
			System.out.println("세션 null");
			return "account/login_page";
		}
	}

	// 로그인끝
	// 마이페이지
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String Mypage(MemberVO vo,Model model) {
		System.out.println("account/mypage //마이 페이지에서  get방식  ");
		return "account/mypage";
	}

	// mypage / 개인정보 수정
	@RequestMapping(value = "/myPageUpdate.do", method = RequestMethod.POST)
	public String MypageChange(MemberVO vo, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("mypage / 개인정보 수정 ");
//		MemberVO login = memberService.getMember(vo);
//
//		boolean pwdMatch = pwdEncoder.matches(vo.getPass(), login.getPass());
//		if (pwdMatch) {
//			System.out.println("pwdMatch 성공");
//			memberService.updateMypage(vo);
//			session.setAttribute("member", login);
//			System.out.println("개인정보 수정완료");
//		} else {
//			System.out.println("pwdMatch 실패");
//		}
		memberService.updateMypage(vo);
		session.invalidate();
		return "account/login_page";
	}

	// 비밀번호 체크
	@ResponseBody
	@RequestMapping(value = "/passChk.do", method = RequestMethod.POST)
	public boolean MypagePassChange(MemberVO vo,HttpSession session) throws Exception {
		System.out.println("mypage / 수정전 비밀번호 체크 ");
		
		  MemberVO login = memberService.getMember(vo);
		  
		  System.out.println(vo.getPass()+"입니다아아아");
		  System.out.println(login.getPass()+"입니닷");
		 
		boolean pwdcChk = pwdEncoder.matches(vo.getPass(),login.getPass());
		System.out.println(pwdcChk);
		return pwdcChk;

	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = memberService.idcheck(vo);
		return result;
	}

	// mypage //비밀번호 변경
	@RequestMapping(value = "/updatePass.do", method = RequestMethod.POST)
	public String MypagePassChange(MemberVO vo, Model model, HttpSession session, RedirectAttributes ra)
			throws IllegalStateException, IOException {
		System.out.println("mypage / 비밀번호  변경 ");

		return "account/mypage";
	}
}
