
package com.catchbug.biz.account;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
	public ModelAndView Mypage() {
		System.out.println("account/mypage //마이 페이지에서  get방식  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/mypage");
		return mav;
	}

	// mypage / 마이페이지 수정
	//여러 페이지를 할떈 value="/mypage.do/:id" 이런식으로 rest를 쓰면 해결할수있다.
	@RequestMapping(value = "/mypage.do/{page}", method = RequestMethod.POST)
	public ModelAndView MypageOverview(@PathVariable("page") String page, MemberVO vo, MemberDAOmybaits memberDAO, ModelAndView mav, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("mypage / 마이페이지 수정 ");
		memberService.updateMypage(vo);
		List<MemberVO> member = memberService.getMember(vo);

		MultipartFile uploadImgFile = vo.getUploadImgFile();
		
		
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
					
					
				}
			}
		if(page=="1") {
			memberService.updateImg(vo);
			if(!uploadImgFile.isEmpty()) {
				String fileName = uploadImgFile.getOriginalFilename();
				uploadImgFile.transferTo(new File("C:\\work\\STS-bundle\\workspace\\CatchBug6\\src\\main\\webapp\\resources\\assets\\img"+fileName));
				
			mav.setViewName("account/mypage");
		}else if(page=="2") {
			mav.setViewName("account/mypage");
		}else if(page=="3") {
			mav.setViewName("account/mypage");
		}
		
		}
		return mav;
	
	}
}