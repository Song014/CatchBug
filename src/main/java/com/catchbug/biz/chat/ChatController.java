package com.catchbug.biz.chat;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {

	@GetMapping("/chat")
	public String chatGET() {

		System.out.println("@ChatController, chat GET()");

		return "chat";
	}
}