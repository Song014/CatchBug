package com.catchbug.biz.chat;

import javax.servlet.http.HttpSession;

import com.catchbug.biz.vo.RoomVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.lang.reflect.Array;
import java.util.ArrayList;

@Controller
public class ChatController {

    private ArrayList<RoomVO> roomList = new ArrayList<RoomVO>();

    //채팅방 페이지 이동 메소드
    @GetMapping("/chatRoom.do")
    public String chatGET(Model model) {
        model.addAttribute("roomList",roomList);
        return "board/chatRoom";
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