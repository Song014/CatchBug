package com.catchbug.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.NotiVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO boardDAO;
	
	//공지 리스트
	@Override
	public List<NotiVO> get_Noti_list() {
		System.out.println("Noti_list 서비스");
		
		return boardDAO.get_Noti_list();
	}
	
	//공지 쓰기
	@Override
	public void insert_noti(NotiVO vo) {
		System.out.println("Noti_Insert 서비스");
	
		boardDAO.insert_noti(vo);
	}
	
	//공지 상세보기
	@Override
	public NotiVO detail_noti(NotiVO vo) {
		System.out.println("Noti_detail 서비스");
		return boardDAO.detail_noti(vo);
	}
	
	// 조회수 증가
	public void noti_cnt_Count(NotiVO vo) {
		System.out.println("Noti_count 서비스");
		boardDAO.noti_cnt_Count(vo);
	}
	
	//공지사항 업데이트
	@Override
	public void update_noti(NotiVO vo) {
		System.out.println("공지사항 업데이트 서비스 ");
		boardDAO.update_noti(vo);
	}

	@Override
	public void noti_delete(NotiVO vo) {
		
		boardDAO.noti_delete(vo);
	}


}
