
package com.catchbug.biz.account;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.catchbug.biz.vo.MemberVO;

@RestController
public class MemberController {

	@Autowired
	MemberService memberService;

	// 회원가입 시작
	@RequestMapping(value = "/sign_up.do", method = RequestMethod.GET)
	public ModelAndView MemeberSignUp() {
		System.out.println("account/sign_up //회원가입 페이지에서  get방식  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/sign_up");
		return mav;
	}

	@RequestMapping(value = "/sign_up.do", method = RequestMethod.POST)
	public ModelAndView InsertMember(MemberVO vo) {
		System.out.println("account/sign_up //회원가입 폼에서 post방식 ");

		memberService.insertMember(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/login_page");
		return mav;
	}
	// 회원가입 끝

	// 로그인 시작
	@RequestMapping(value = "/login_page.do", method = RequestMethod.GET)
	public ModelAndView MemeberLoginReady() {
		System.out.println("account/login_page //로그인 페이지에서  get방식  ");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/login_page");
		return mav;
	}

	// 로그아웃 코
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session,ModelAndView mav) {
		session.invalidate();
		mav.setViewName("redirect:login_page.do");
		return mav;
	}

	@RequestMapping(value = "/login_page.do", method = RequestMethod.POST)
	public ModelAndView MemberLogin(MemberVO vo, MemberDAOmybaits memberDAO, ModelAndView mav, HttpSession session) {

		System.out.println("account/login_page //로그인 페이지에서  post방식 ");
		MemberVO member = memberService.getMember(vo);

		if (member != null) {
			System.out.println("환영합니다" + member.getId() + "님 어서오세요. 등급은 " + member.getLevel1() + "입니다");
			// 세션에 멤버에대한 값들 전부 담아주실꺼면 아래처럼 한번에 담아주시고 프론트단에서 ${member.id} ${member.pass} 이런식으로 el태그 써주시면 됩니다
			session.setAttribute("member", member);
			mav.setViewName("account/mypage");
		}
		return mav;

	}

	// 로그인끝

	// 마이페이지
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView Mypage() {
		System.out.println("account/mypage //마이 페이지에서  get방식  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/mypage");
		return mav;
	}

	// mypage / 마이페이지 수정
	// 여러 페이지를 할떈 value="/mypage.do/:id" 이런식으로 rest를 쓰면 해결할수있다.
	@RequestMapping(value = "/mypage.do/{page}", method = RequestMethod.POST)
	public ModelAndView MypageOverview(@PathVariable("page") String page, MemberVO vo, MemberDAOmybaits memberDAO,
			ModelAndView mav, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("mypage / 마이페이지 수정 ");
		memberService.updateMypage(vo);
		MemberVO member = memberService.getMember(vo);
		
		if (member != null) {
			System.out.println("환영합니다" + member.getId() + "님 어서오세요. 등급은 " + member.getLevel1() + "입니다");
			session.setAttribute("member", member); // 세션 재할당?
		}
		
		MultipartFile uploadImgFile = vo.getUploadImgFile();
		
		if (page == "1") {
			memberService.updateImg(vo);
			if (!uploadImgFile.isEmpty()) {
				String fileName = uploadImgFile.getOriginalFilename();
				uploadImgFile.transferTo(
						new File("C:\\work\\STS-bundle\\workspace\\CatchBug6\\src\\main\\webapp\\resources\\assets\\img"
								+ fileName));

				mav.setViewName("account/mypage");
			} else if (page == "2") {
				mav.setViewName("account/mypage");
			} else if (page == "3") {
				mav.setViewName("account/mypage");
			}

		}
		return mav;
	}
}
