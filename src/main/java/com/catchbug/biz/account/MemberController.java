
package com.catchbug.biz.account;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView MemberLogin(MemberVO vo, MemberDAOmybaits memberDAO, ModelAndView mav, HttpSession session) {
		System.out.println("account/login_page //로그인 페이지에서  post방식 ");
		List<MemberVO> member = memberService.getMember(vo);

//		Iterator mem = member.iterator();
//		while(mem.hasNext()) {
//			System.out.println(mem.next());
//		}

		for (MemberVO i : member) {
			System.out.println(i);
			System.out.println(i.getId());
			System.out.println(vo.getId());

			if (i.getId() != null) {
				if (i.getLevel1() == 1) {
					System.out.println("환영합니다" + i.getId() + "님 어서오세요. 등급은 " + i.getLevel1() + "입니다");

					session.setAttribute("member", i);
					session.setAttribute("memberId", i.getId());
					session.setAttribute("memberPass", i.getPass());
					session.setAttribute("memberBusiness_no", i.getBusiness_no());
					session.setAttribute("memberBusiness_name", i.getBusiness_name());
					session.setAttribute("memberCeo", i.getCeo());
					session.setAttribute("memberContact", i.getContact());
					session.setAttribute("memberEmail", i.getEmail());
					session.setAttribute("memberBusiness_address", i.getBusiness_address());
					session.setAttribute("memberJoin_day", i.getRegdate());
					session.setAttribute("memberLevel", i.getLevel1());
					mav.addObject("member", member);
					mav.setViewName("account/mypage");
				} else if (i.getLevel1() == 2) {
					System.out.println("환영합니다" + i.getId() + "님 어서오세요. 등급은 " + i.getLevel1() + "입니다");
					session.setAttribute("member", i);
					session.setAttribute("memberId", i.getId());
					session.setAttribute("memberPass", i.getPass());
					session.setAttribute("memberBusiness_no", i.getBusiness_no());
					session.setAttribute("memberBusiness_name", i.getBusiness_name());
					session.setAttribute("memberCeo", i.getCeo());
					session.setAttribute("memberContact", i.getContact());
					session.setAttribute("memberEmail", i.getEmail());
					session.setAttribute("memberBusiness_address", i.getBusiness_address());
					session.setAttribute("memberJoin_day", i.getRegdate());
					session.setAttribute("memberLevel", i.getLevel1());
					mav.addObject("member", member);
					mav.setViewName("account/mypage");

				} else if (i.getLevel1() == 3) {
					System.out.println("환영합니다" + i.getId() + "님 어서오세요. 등급은 " + i.getLevel1() + "입니다");
					session.setAttribute("memberId", i.getId());
					session.setAttribute("memberLevel", i.getLevel1());
					mav.addObject("member", member);
					mav.setViewName("account/mypage");
				}
			}
		}
		return mav;
	}
	// 로그인끝

	// 마이페이지
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String Mypage() {
		System.out.println("account/mypage //마이 페이지에서  get방식  ");

		return "account/mypage";
	}

	// mypage / 마이페이지 수정
	@RequestMapping(value = "/mypage.do", method = RequestMethod.POST)
	public ModelAndView MypageOverview(MemberVO vo, MemberDAOmybaits memberDAO, ModelAndView mav, HttpSession session) {
		System.out.println("mypage / 마이페이지 수정 ");
		memberService.updateMypage(vo);

		List<MemberVO> member = memberService.getMember(vo);

		for (MemberVO i : member) {
			System.out.println(i);
			System.out.println(i.getId());
			System.out.println(vo.getId());

			if (i.getId() != null) {
					System.out.println("환영합니다" + i.getId() + "님 어서오세요. 등급은 " + i.getLevel1() + "입니다");

					session.setAttribute("member", i);
					session.setAttribute("memberId", i.getId());
					session.setAttribute("memberPass", i.getPass());
					session.setAttribute("memberBusiness_no", i.getBusiness_no());
					session.setAttribute("memberBusiness_name", i.getBusiness_name());
					session.setAttribute("memberCeo", i.getCeo());
					session.setAttribute("memberContact", i.getContact());
					session.setAttribute("memberEmail", i.getEmail());
					session.setAttribute("memberBusiness_address", i.getBusiness_address());
					session.setAttribute("memberJoin_day", i.getRegdate());
					session.setAttribute("memberLevel", i.getLevel1());
					mav.addObject("member", member);
					mav.setViewName("account/mypage");
					
				}
			}
		return mav;
		}
	}

//if(user != null) {
//mav.setViewName("redirect:getBoardList.do"); // url이 /getBoardList.do로 바로 가집니다. 
//									//redirect : viewResolver를 무시하고 싶을때
//}else {
//mav.setViewName("redirect:login.jsp"); //url이 바로 /login.jsp로 가집니다.
//}

// 로그인 끝