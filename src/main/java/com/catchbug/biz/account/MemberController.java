
package com.catchbug.biz.account;


import com.catchbug.biz.account.mail.MailHandler;
import com.catchbug.biz.account.mail.TempKey;
import com.catchbug.biz.img.ImgService;
import com.catchbug.biz.product.ProductService;
import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MemberVO;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;


@Controller
public class MemberController {
    //	private String uploadFolder = "C:/work/spring-space/CatchBug/src/main/webapp/resources";
    private String uploadFolder = "/Users/hyeon1339/CatchBugProject/src/main/webapp/resources/profileImg";

    @Inject
    BCryptPasswordEncoder pwdEncoder;

    @Autowired
    MemberService memberService;

    @Autowired
    ProductService productService;

    @Autowired
    ImgService imgService;

    // 메일전송을 위한 의존주입
    @Autowired
    JavaMailSender mailSender;

    // 회원가입 시작
    @RequestMapping(value = "/sign_up.do", method = RequestMethod.GET)
    public ModelAndView MemeberSignUp() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("account/sign_up");
        return mav;
    }

    // 비밀번호 체크
    @ResponseBody
    @RequestMapping(value = "/passChk.do", method = RequestMethod.POST)
    public boolean MypagePassChange(MemberVO vo, HttpSession session) throws Exception {
        MemberVO login = memberService.getMember(vo);
        boolean pwdcChk = pwdEncoder.matches(vo.getPass(), login.getPass());
        return pwdcChk;

    }


    //아이디 중복찾기 메소드
    @PostMapping("/idChk.do")
    @ResponseBody
    public int IdCheck(MemberVO vo) {
        int result = memberService.idcheck(vo);

        return result;
    }

    //회원가입 메소드
    @Transactional
    @RequestMapping(value = "/sign_up.do", method = RequestMethod.POST)
    public String InsertMember(MemberVO vo) throws Exception {
        String mail_key = new TempKey().getKey(30, false); // 랜덤키 30글자로 생성
        vo.setMail_key(mail_key); // 랜덤키 세터주입.

        String inputPass = vo.getPass();
        String pwd = pwdEncoder.encode(inputPass);
        vo.setPass(pwd);

        memberService.insertMember(vo);

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
        String pass = new TempKey().getKey(10, false); // 성임시 비밀번호 생성
        vo.setPass(pwdEncoder.encode(pass));
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
    public String findPw(Model model) {
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
    @RequestMapping(value = "/login_page.do", method = RequestMethod.GET)
    public ModelAndView MemeberLoginReady() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("account/login_page");
        return mav;
    }

    //로그아웃 코드
    @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:login_page.do";
    }

    //로그인페이지
    @RequestMapping(value = "/login_page.do", method = RequestMethod.POST)
    public String MemberLogin(MemberVO vo, HttpSession session)
            throws Exception {
        MemberVO login = memberService.getMember(vo);
        boolean pwdMatch = pwdEncoder.matches(vo.getPass(), login.getPass());


        if (login.getId() != null && pwdMatch) {
            session.setAttribute("member", login);
            session.setAttribute("profile", memberService.getProfileImg(vo));
            return "redirect:mypage.do?id=" + login.getId();
        }

        if (memberService.emailAuthFail(vo.getId()) != 1) { // 이메일 인증 검증
            return "account/emailAuthFail";
        }

        if (login.getLevel1() == 4) {
            return "account/loginFail";
        }
        session.setAttribute("member", null);
        return "account/login_id_Fail";


    }
    // 로그인끝

    // 마이페이지
    @RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
    public String Mypage(MemberVO vo, Model model) {
        // 이미지 불러와야됨 멤버가 가지고있는 uuid와 img 테이블의 uuid 비교후

        model.addAttribute("img", memberService.getProfileImg(vo));

        return "account/mypage";
    }

    @PostMapping(value = "myProfileUpload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<ImgVO> MypageProfile(MultipartFile multipartFile, ImgVO vo) {
        File checkFile = new File(multipartFile.getOriginalFilename());
        String type = null;

        try {
            type = Files.probeContentType(checkFile.toPath());
        } catch (Exception e) {
            e.printStackTrace();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String str = sdf.format(date);

        /* 폴더 생성 */
        File uploadPath = new File(uploadFolder, str);


        if (uploadPath.exists() == false) {
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
        ResponseEntity<ImgVO> result = new ResponseEntity<ImgVO>(vo, HttpStatus.OK);
        return result;
    }

    // mypage / 개인정보 수정
    @RequestMapping(value = "/myPageUpdate.do", method = RequestMethod.POST)
    public String MypageChange(MemberVO vo, HttpSession session) throws IllegalStateException, IOException {
        memberService.updateMypage(vo);
        session.invalidate();
        return "account/login_page";
    }

    @ResponseBody
    @PostMapping(value = "profileUpdate")
    public String MypageProfileUpdate(ImgVO ivo, MemberVO mvo, HttpSession session) {
        // 이미지 관련 세션데이터 삭제
        session.removeAttribute("profile");
        // 프론트에서 받아온 이미지 관련 데이터 재설정
        session.setAttribute("profile", ivo);

        imgService.insertImg(ivo);
        // 회원 테이블 uuid 값 업데이트
        memberService.updateUuid(mvo);

        return "성공";
    }


    // mypage / 개인정보 수정

    @RequestMapping(value = "/updateMypage.do", method = RequestMethod.POST)
    public String MypageChange(MemberVO vo, Model model, HttpSession session)
            throws IllegalStateException, IOException {
        memberService.updateMypage(vo);
        MemberVO member = memberService.getMember(vo);

        model.addAttribute("member", member);
        session.setAttribute("member", member);

        return "account/mypage";
    }

    //mypage 비밀번호 변경
    @PostMapping("/updatePass.do")
    public String MypagePassChange(String newPassword, MemberVO vo){
        String pass = pwdEncoder.encode(newPassword);
        vo.setPass(pass);
        memberService.updatePass(vo);
        return "account/mypage";
    }


}
