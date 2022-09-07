
package com.catchbug.biz.account;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.catchbug.biz.product.ProductService;
import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MemberVO;

@Controller
public class MemberController {

	@Inject
	BCryptPasswordEncoder pwdEncoder;

	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;

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
	public String Mypage(MemberVO vo,ImgVO ivo,Model model) {
		System.out.println("account/mypage //마이 페이지에서  get방식  "+vo);
		// 이미지 불러와야됨 멤버가 가지고있는 uuid와 img 테이블의 uuid 비교후 
		
		model.addAttribute("img",memberService.getProfileImg(vo));
		
		return "account/mypage";
	}
	
	@PostMapping(value = "myProfileUpload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ImgVO> MypageProfile(MultipartFile multipartFile, ImgVO vo) {
		System.out.println("이미지 업로드 에이작스 작동");
		System.out.println(multipartFile);
		File checkFile = new File(multipartFile.getOriginalFilename());
		String type = null;
		
		try {
			type = Files.probeContentType(checkFile.toPath());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String uploadFolder = "C:/work/spring-space/CatchBug/src/main/webapp/resources/profileImg";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, str);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		String uploadFileName = multipartFile.getOriginalFilename();
		
		vo.setFileName(uploadFileName);
		vo.setUploadPath(str);
		String uuid = null;
		/* uuid 적용 파일 이름 파일이름 중복 방지 */
		uuid = UUID.randomUUID().toString();
		
		vo.setUuid(uuid);
		uploadFileName = uuid + "_" + uploadFileName;
		
		/* 파일 위치, 파일 이름을 합친 File 객체 */
		File saveFile = new File(uploadPath, uploadFileName);

		/* 파일 저장 */
		try {
			multipartFile.transferTo(saveFile);

			BufferedImage bo_image = ImageIO.read(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(vo);
		ResponseEntity<ImgVO> result = new ResponseEntity<ImgVO>(vo, HttpStatus.OK);
		return result;
	}

	// mypage / 개인정보 수정
	@RequestMapping(value = "/myPageUpdate.do", method = RequestMethod.POST)
	public String MypageChange(MemberVO vo,HttpSession session) throws IllegalStateException, IOException {
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
	
	@ResponseBody
	@PostMapping(value = "profileUpdate")
	public String MypageProfileUpdate(ImgVO ivo,MemberVO mvo) {
		System.out.println("이미지 업데이트"+ivo+"  : 사용자"+mvo);
		
		// 이미지 테이블에 이미지 정보 올리고
		memberService.updateImg(ivo);			
		// 회원 테이블 uuid 값 업데이트
		memberService.updateUuid(mvo); 
		
		return "성공";
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
