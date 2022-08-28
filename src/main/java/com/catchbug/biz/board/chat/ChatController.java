package com.catchbug.biz.board.chat;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.catchbug.biz.vo.MemberVO;

@Controller
public class ChatController {

	@GetMapping("/chat")
	public void chat(Model model,HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("memberId.ceo");
		model.addAttribute("userid", user);
	}

}
