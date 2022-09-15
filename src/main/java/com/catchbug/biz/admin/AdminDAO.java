package com.catchbug.biz.admin;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.catchbug.biz.vo.Criteria;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;
import com.catchbug.biz.vo.SearchVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 가맹점 전체 리스트
	public List<MemberVO> getMemberList(Criteria cri) {
		System.out.println("AdminDAO --> getMemberList");
		return mybatis.selectList("AdminMapper.getMemberList", cri);
	}

	// 가맹점 승인요청 리스트
	public List<MemberVO> getMemberWaitList() {
		System.out.println("AdminDAO --> getMemberList");
		return mybatis.selectList("AdminMapper.getMemberWaitList");
	}

	// 승인 처리
	public void memberLevelUpdate(MemberVO vo) {
		System.out.println("가입 승인 DAO 회원아이디 : " + vo.getId());
		mybatis.update("AdminMapper.memberLevelUpdate", vo);
	}

	// 반려 처리
	public void memberrefuse(MemberVO vo) {
		System.out.println("가입 반려 DAO 회원아이디 : " + vo.getId());
		mybatis.delete("AdminMapper.memberrefuse", vo);
	}

	// 미출고 리스트
	public List<HashMap<String, Object>> getunOrderHistory(Criteria cri) {
		System.out.println("미출고 리스트 출력");
		return mybatis.selectList("AdminMapper.unOrderHistory", cri);
	}

	// 회원정보 모달
	public MemberVO getMemberM(MemberVO vo) {
		System.out.println("회원정보 모달 디에이오");
		return mybatis.selectOne("AdminMapper.getMemberM", vo);
	}

	// 오더 상세보기 모달
	public List<OrderVO> getOrder(OrderVO vo) {
		System.out.println("오더상세보기 모달 디에이오");
		System.out.println(mybatis.selectList("AdminMapper.getOrderM", vo));
		return mybatis.selectList("AdminMapper.getOrderM", vo);
	}

	// 미출고 검색 리스트
	public List<MemberVO> franc_SearchList(SearchVO vo) {
		return mybatis.selectList("AdminMapper.SearchList", vo);
	}

	// 상품코드 / 주문수 리스트
	public List<OrderItemVO> getOrder_detail(OrderVO vo) {
		return mybatis.selectList("AdminMapper.getOrderList", vo);
	}

	// 상품코드 -> 현재고 조회
	public int getProduct_Quantily(int productNo) {
		return mybatis.selectOne("AdminMapper.getProductQuantily", productNo);
	}

	// 재고수 차감
	public int update_Quantily(OrderItemVO list) {
		return mybatis.update("AdminMapper.updateQuantily", list);
	}

	// 주문상태 배송중으로 변경
	public void update_order_status(OrderVO vo) {
		mybatis.update("AdminMapper.update_order_status", vo);
	}

	// 주문상태 반려로 변경
	public void update_order_refuse(OrderVO vo) {
		mybatis.update("AdminMapper.update_order_refuse", vo);
	}

	public List<OrderVO> franc_SearchList2(SearchVO vo) {
		return mybatis.selectList("AdminMapper.SearchList2", vo);
	}

	public List<OrderVO> factory_SearchList2(SearchVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("AdminMapper.SearchList2", vo);
	}

	public List<MemberVO> factory_SearchList(SearchVO sv) {
		// TODO Auto-generated method stub
		return mybatis.selectList("AdminMapper.SearchList", sv);
	}

	// 페이징
	public int listCount(Criteria cri) {
		System.out.println("페이징 디에이오");

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("searchType", cri.getSearchType());
		data.put("searchName", cri.getSearchName());

		int count = mybatis.selectOne("AdminMapper.count", data);
		return count;
	}

}
