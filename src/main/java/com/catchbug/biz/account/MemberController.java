
package com.catchbug.biz.account;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catchbug.biz.account.mail.MailHandler;
import com.catchbug.biz.account.mail.TempKey;
import com.catchbug.biz.vo.MemberVO;

import net.sf.json.JSONArray;

@Controller
public class MemberController {

	@Inject
	BCryptPasswordEncoder pwdEncoder;

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

	//회원가입 메소드
	@Transactional
	@RequestMapping(value = "/sign_up.do", method = RequestMethod.POST)
	public String InsertMember(MemberVO vo) throws Exception {
		String mail_key = new TempKey().getKey(30, false); // 랜덤키 30글자로 생성
		vo.setMail_key(mail_key); // 랜덤키 세터주입.

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

		// 회원가입 완료후 메일인증 진행
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[CatchBug 물류사이트 인증메일 입니다.");
		sendMail.setText("<h1>CatchBug 회원가입 인증메일</h1>" + "<br>CatchBug에 오신것을 환영합니다.!" + "<br>아래 [이메일 인증 확인] 버튼을 눌러주세요."
				+ "<br><a href='http://localhost:8080/registerEmail?email=" + vo.getEmail() + "&mail_key=" + mail_key
				+ "' target='_blank'>이메일 인증 확인</a>");
		sendMail.setFrom("catchbugteam@gmail.com", "관리자");
		sendMail.setTo(vo.getEmail());
		sendMail.send();
		return "account/login_page";
	}
	
	//아이디 찾기 이동 메소드
	@RequestMapping("/find_id.do")
	public String findId() {
		return "account/find_id";
	}
	
	//아이디 찾기 로직작동 메소드
	
	@ResponseBody
	@RequestMapping("/findid.do")
	public MemberVO findeID(MemberVO vo) {
		return memberService.FindMemberID(vo);
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
		sendMail.setText("<h1>CatchBug 비밀번호 찾기 인증메일</h1>" + "<br>CatchBug에 오신것을 환영합니다.!" + 
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


	// 로그인 페이지이동


	//로그아웃 코드
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		return "redirect:login_page.do";
	}

	//로그인페이지
	@RequestMapping(value = "/login_page.do", method = RequestMethod.POST)
	public String MemberLogin(MemberVO vo, MemberDAOmybaits memberDAO, ModelAndView mav, HttpSession session)
			throws Exception {
		MemberVO login = memberService.getMember(vo);
		boolean pwdMatch = pwdEncoder.matches(vo.getPass(), login.getPass());

		if (login != null && pwdMatch == true) {
			session.setAttribute("member", login);
			return "account/mypage";
		} 

		if (memberService.emailAuthFail(vo.getId()) != 1) { // 이메일 인증 검증
			return "account/emailAuthFail";
		}

		if (login.getLevel1() == 4) {
			return "account/loginFail";
		}

		if (login != null) {
			session.setAttribute("member", login);
			return "account/mypage";
		}
		session.setAttribute("member", null);
		return "member/login_page";


	}
	// 로그인끝

	// 마이페이지
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String Mypage(MemberVO vo,Model model) {
		System.out.println("account/mypage //마이 페이지에서  get방식  ");
		return "account/mypage";
	}

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
						new File("/Users/hyeon1339/CatchBugProject/src/main/webapp/resources/productImg/profile"
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
