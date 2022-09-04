package com.catchbug.biz.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.BoardReplyVO;
import com.catchbug.biz.vo.BoardVO;
import com.catchbug.biz.vo.NotiVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//자유게시판 글쓰기 목록 불러오기
	public List<BoardVO> GetFreeBoard(BoardVO vo) {
		return mybatis.selectList("BoardMapper.getFreeBoard",vo);
	}
	
	//자유게시판 클릭한 글 정보 불러오기
	public BoardVO GetFreeBoardDetail(BoardVO vo) {
		return mybatis.selectOne("BoardMapper.getFreeBoardDetail",vo);
	}
	
	//자유게시판 클릭한 글 댓글정보 불러오기
	public List<BoardReplyVO> getFreeBoardReply(BoardReplyVO vo) {
		return mybatis.selectList("BoardMapper.getFreeBoardReply",vo);
	}
	
	//자유게시판 글쓰기 등록
	public void FreeBoardWrite(BoardVO vo) {
		mybatis.insert("BoardMapper.freeBoardWrite",vo);
	}
	//자유게시판 글삭제 메소드
	public void DeleteFreeBoard(BoardVO vo) {
		mybatis.delete("BoardMapper.deleteFreeBoard",vo);
	}
	
	//자유게시판 글수정 메소드
	public void UpdateFreeBoard(BoardVO vo) {
		mybatis.update("BoardMapper.updateFreeBoard",vo);
	}	
	
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
	
	// 페이지 이동을위한 계산메소드
	public int getTotal() {
		return mybatis.selectOne("BoardMapper.getTotal");
	}
	
	//자유게시판 조회수 증가
	public void freeBoardCnt(BoardVO vo) {
		mybatis.update("BoardMapper.freeBoardCnt",vo);
	}
	
	//자유게시판 댓글작성
	public void WriteBoardReply(BoardReplyVO vo) {
		mybatis.insert("BoardMapper.writeBoardReply",vo);
	}
	
	//자유게시판 댓글 삭제
	public void DeleteBoardReply(BoardReplyVO vo) {
		mybatis.delete("BoardMapper.deleteBoardReply",vo);
	}
	
	//자유게시판 댓글 수정
	public void UpdateBoardReply(BoardReplyVO vo) {
		mybatis.update("BoardMapper.updateBoardReply",vo);
	}
	

	
}
