package com.catchbug.biz.chat;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class ChatHandler extends TextWebSocketHandler{

    // (<"room", 방ID>, <"session", 세션>) - (<"room", 방ID>, <"session", 세션>) - (<"room", 방ID>, <"session", 세션>) 형태
    private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        super.handleTextMessage(session, message);

        // JSON --> Map으로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);

        switch (mapReceive.get("cmd")) {

            // CLIENT 입장
            case "CMD_ENTER":
                // 세션 리스트에 저장= n
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("ceo",mapReceive.get("ceo"));
                map.put("room", mapReceive.get("room"));
                map.put("session", session);
                sessionList.add(map);

                // 같은 채팅방에 입장 메세지 전송
                for (int i = 0; i < sessionList.size(); i++) {
                    Map<String, Object> mapSessionList = sessionList.get(i);
                    String room = (String) mapSessionList.get("room");
                    String ceo = (String) mapSessionList.get("ceo");
                    WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

                    if(room.equals(mapReceive.get("room"))) {
                        Map<String, String> mapToSend = new HashMap<String, String>();
                        mapToSend.put("ceo", ceo );
                        mapToSend.put("room", room);
                        mapToSend.put("cmd", "CMD_ENTER");
                        mapToSend.put("msg", mapReceive.get("ceo") +  "님이 입장 했습니다.");

                        String jsonStr = objectMapper.writeValueAsString(mapToSend); //제이슨형태로 메세지 변환
                        sess.sendMessage(new TextMessage(jsonStr));
                    }
                }
                break;

            // CLIENT 메세지
            case "CMD_MSG_SEND":
                // 같은 채팅방에 메세지 전송
                for (int i = 0; i < sessionList.size(); i++) {
                    Map<String, Object> mapSessionList = sessionList.get(i);
                    String room = (String) mapSessionList.get("room");
                    WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

                    if (room.equals(mapReceive.get("room"))) {
                        Map<String, String> mapToSend = new HashMap<String, String>();
                        mapToSend.put("ceo", mapReceive.get("ceo"));
                        mapToSend.put("room", room);
                        mapToSend.put("cmd", "CMD_MSG_SEND");
                        mapToSend.put("msg", mapReceive.get("ceo") + " : " + mapReceive.get("msg"));

                        String jsonStr = objectMapper.writeValueAsString(mapToSend);
                        sess.sendMessage(new TextMessage(jsonStr));
                    }
                }
                break;
        }
    }

    /* Client가 접속 시 호출되는 메서드 */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {

        System.out.println(session + " 클라이언트 접속");
    }

    /* Client가 접속 해제 시 호출되는 메서드드 */

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);

        ObjectMapper objectMapper = new ObjectMapper();
        String now_bang_id = "";
        String ceo = "";

        // 사용자 세션을 리스트에서 제거
        for (int i = 0; i < sessionList.size(); i++) {
            Map<String, Object> map = sessionList.get(i);
            String room = (String) map.get("room");
            String ceoname = (String) map.get("ceo");
            WebSocketSession sess = (WebSocketSession) map.get("session");

            if(session.equals(sess)) {
                now_bang_id = room;
                ceo = ceoname;
                sessionList.remove(map);
                break;
            }
        }

        // 같은 채팅방에 퇴장 메세지 전송
        for (int i = 0; i < sessionList.size(); i++) {
            Map<String, Object> mapSessionList = sessionList.get(i);
            String bang_id = (String) mapSessionList.get("room");
            WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

            if (bang_id.equals(now_bang_id)) {
                Map<String, String> mapToSend = new HashMap<String, String>();
                mapToSend.put("ceo", ceo);
                mapToSend.put("room", bang_id);
                mapToSend.put("cmd", "CMD_EXIT");
                mapToSend.put("msg", ceo + "님이 퇴장 했습니다.");

                String jsonStr = objectMapper.writeValueAsString(mapToSend);
                sess.sendMessage(new TextMessage(jsonStr));
            }
        }
    }
}
