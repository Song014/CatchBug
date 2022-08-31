package com.catchbug.biz.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.NotiVO;


@Repository
public class BoardDAO {
	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 공지 리스트
	public List<NotiVO> get_Noti_list() {
		System.out.println("공지 리스트 디에이오");
		return mybatis.selectList("BoardMapper.gerNotiList");
	}
	
	// 공지 쓰기
	public void insert_noti(NotiVO vo) {
		System.out.println("공지쓰기 디에이오");
		mybatis.insert("BoardMapper.insertNoti", vo);
	}
	
	//공지 상세보기
	public NotiVO detail_noti(NotiVO vo) {
		System.out.println("공지상세보기 디에이오");
		
		return mybatis.selectOne("BoardMapper.detailNoti", vo);
	}
	
	//공지사항 조회수 증가
	public int noti_cnt_Count(NotiVO vo) {
		System.out.println("공지 조회수 증가 디에이오");
		return mybatis.update("BoardMapper.notiCntCount", vo);
	}
	//공지 업데이트
	public void update_noti(NotiVO vo) {
		System.out.println("공지 업데이트 디에이오");
		System.out.println(vo.getNoti_title());
		System.out.println(vo.getNoti_content());
		mybatis.update("BoardMapper.updateNoti", vo);
	}
	
	public void noti_delete(NotiVO vo) {
		mybatis.delete("BoardMapper.notidelete", vo);
	}
	
	
}
