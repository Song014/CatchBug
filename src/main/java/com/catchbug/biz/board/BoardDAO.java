package com.catchbug.biz.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.BoardVO;
import com.catchbug.biz.vo.Criteria;
import com.catchbug.biz.vo.NotiVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//자유게시판 글쓰기 목록 불러오기
	public List<BoardVO> GetFreeBoard(BoardVO vo) {
		return mybatis.selectList("BoardMapper.getFreeBoard",vo);
	}
	
	//자유게시판 글쓰기 등록
	public void FreeBoardWrite(BoardVO vo) {
		mybatis.insert("BoardMapper.freeBoardWrite",vo);
	}
	
	
	// 공지 리스트
	public List<NotiVO> get_Noti_list(Criteria cri) {
		System.out.println("공지 리스트 디에이오");
		return mybatis.selectList("BoardMapper.gerNotiList", cri);
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
	
	// 페이지 이동을위한 계산메소드
	public int getTotal() {
		return mybatis.selectOne("BoardMapper.getTotal");
	}
	
	// 공지 검색
	public List<NotiVO> SearchNoti(NotiVO vo) {
		System.out.println("공지사항 검색 디에이오");
		return mybatis.selectList("BoardMapper.SearchNoti", vo);
	}
	
	//  검색 페이징 카운트
	public int listSearchCount(NotiVO vo) {
		System.out.println("검색 카운트 디에이오");
		System.out.println(vo.getNoti_title());
		return mybatis.selectOne("BoardMapper.listSearchNoti", vo);
	}
	
	// 페이징
	public int listCount() {
		System.out.println("페이징 디에이오");
		int count = mybatis.selectOne("BoardMapper.listCount");
		return count;
	}
	
}
