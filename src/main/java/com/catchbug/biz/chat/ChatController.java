package com.catchbug.biz.chat;

import com.catchbug.biz.account.MemberService;
import com.catchbug.biz.vo.ImgVO;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.RoomVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
public class ChatController {

    private ArrayList<RoomVO> roomList = new ArrayList<RoomVO>();
    @Autowired
    MemberService memberService;


    //채팅방 페이지 이동 메소드
    @GetMapping("/chatRoom.do")
    public String chatGET(MemberVO vo, Model model) {
        model.addAttribute("roomList",roomList);
        return "board/chatRoom";
    }

    @PostMapping("/getUploadPath.do")
    @ResponseBody
    public String uploadPath(MemberVO vo){
        ImgVO iVo = memberService.getProfileImg(vo);
        String uploadPath = iVo.getUploadPath();
        return uploadPath;
    }

    //채팅방 생성
    @GetMapping("/createRoom.do")
    public String createRoom(RoomVO vo){
        roomList.add(vo);
        return "redirect:chatRoom.do";
    }
    //채팅방 삭제
    @GetMapping("/deleteRoom.do")
    public String deleteRoom(RoomVO vo){
        for(int i = 0; i < roomList.size();i ++){
            if(vo.getMember_id().equals(roomList.get(i).getMember_id())){
                roomList.remove(i);
            }
        }
        return "redirect:chatRoom.do";
    }

    //채팅룸 이동
    @RequestMapping("/ViewChat.do")
    public String ViewBoard(String room,Model model) {
        model.addAttribute("room",room);
        return "board/chat";
    }

}