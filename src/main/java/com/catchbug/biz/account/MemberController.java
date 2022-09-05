
package com.catchbug.biz.account;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.catchbug.biz.account.mail.MailHandler;
import com.catchbug.biz.account.mail.TempKey;
import com.catchbug.biz.vo.MemberVO;

import net.sf.json.JSONArray;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	// 메일전송을 위한 의존주입
	@Autowired
	JavaMailSender mailSender;

	// 회원가입 시작
	@RequestMapping(value = "/sign_up.do", method = RequestMethod.GET)
	public ModelAndView MemeberSignUp() {
		System.out.println("account/sign_up //회원가입 페이지에서  get방식  ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/sign_up");
		return mav;
	}

	@Transactional
	@RequestMapping(value = "/sign_up.do", method = RequestMethod.POST)
	public ModelAndView InsertMember(MemberVO vo) throws Exception {
		String mail_key = new TempKey().getKey(30, false); // 랜덤키 30글자로 생성
		vo.setMail_key(mail_key); // 랜덤키 세터주입.
		memberService.insertMember(vo); // 회원가입 진행

		// 회원가입 완료후 메일인증 진행
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[CatchBug 물류사이트 인증메일 입니다.");
		sendMail.setText("<h1>CatchBug 회원가입 인증메일</h1>" + "<br>CatchBug에 오신것을 환영합니다.!" + "<br>아래 [이메일 인증 확인] 버튼을 눌러주세요."
				+ "<br><a href='http://localhost:8080/registerEmail?email=" + vo.getEmail() + "&mail_key=" + mail_key
				+ "' target='_blank'>이메일 인증 확인</a>");
		sendMail.setFrom("catchbugteam@gmail.com", "관리자");
		sendMail.setTo(vo.getEmail());
		sendMail.send();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/login_page");
		return mav;
	}

	// 비밀번호 찾기 임시비밀번호 메일전송 메소드
	@Transactional
	@PostMapping("/findPW.do")
	public String findePW(MemberVO vo) throws MessagingException, UnsupportedEncodingException {
		String pass = new TempKey().getKey(10, false); // 임시 비밀번호 생성
		vo.setPass(pass);
		memberService.changeRandomPW(vo);

		// 임시비밀번호 생성후 메일전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[CatchBug 물류사이트 인증메일 입니다.");
		sendMail.setText("<h1>CatchBug 회원가입 인증메일</h1>" + "<br>CatchBug에 오신것을 환영합니다.!" + 
						"<br>고객님의 새로운 비밀번호를 보내드립니다. <br>임시 비밀번호 : " + pass +
						"<br>로그인을 완료하시고 꼭 새로운 비밀번호로 변경하세요!");
		sendMail.setFrom("catchbugteam@gmail.com", "관리자");
		sendMail.setTo(vo.getEmail());
		sendMail.send();
		
		return "account/login_page";
	}

	@GetMapping("/find_pw.do")
	public String findPw(Model model, MemberVO vo) {
		model.addAttribute("find", JSONArray.fromObject(memberService.FindMemberPW()));
		return "account/find_pw";
	}

	@GetMapping("/registerEmail")
	public ModelAndView emailConfirm(MemberVO vo) throws Exception {
		memberService.updateMailAuth(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/account/emailAuthSuccess");

		return mav;
	}
	// 회원가입 끝

	// 로그인 시작
	@RequestMapping(value = "/login_page.do", method = RequestMethod.GET)
	public String MemeberLoginReady() {
		ModelAndView mav = new ModelAndView();
		return "account/login_page";
	}

	// 로그아웃 코드
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		return "redirect:login_page.do";
	}

	@RequestMapping(value = "/login_page.do", method = RequestMethod.POST)
	public String MemberLogin(MemberVO vo, MemberDAOmybaits memberDAO, ModelAndView mav, HttpSession session)
			throws Exception {

		System.out.println("account/login_page //로그인 페이지에서  post방식 ");
		MemberVO member = memberService.getMember(vo);

		if (memberService.emailAuthFail(vo.getId()) != 1) { // 이메일 인증 검증
			return "account/emailAuthFail";
		}

		if (member.getLevel1() == 4) {
			return "account/loginFail";
		}

		if (member != null) {
			session.setAttribute("member", member);
			return "account/mypage";
		}

		return "member/login_page";

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
	}// mypage / 개인정보 수정

	@RequestMapping(value = "/updateMypage.do", method = RequestMethod.POST)
	public String MypageChange(MemberVO vo, Model model, HttpSession session)
			throws IllegalStateException, IOException {
		System.out.println("mypage / 개인정보 수정 ");
		memberService.updateMypage(vo);
		MemberVO member = memberService.getMember(vo);

		model.addAttribute("member", member);
		session.setAttribute("member", member);
		return "account/mypage";
	}
}
