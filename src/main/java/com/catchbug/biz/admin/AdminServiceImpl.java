package com.catchbug.biz.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;
import com.catchbug.biz.vo.SearchVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	
	//가맹점 전체 리스트
	@Override
	public List<MemberVO> getMemberList() {
		System.out.println("AdminServiceIm --> getMemberList");
		return adminDAO.getMemberList();
	}
	
	//가맹점 승인요청 리스트
	@Override
	public List<MemberVO> getMemberWaitList() {
		System.out.println("AdminServiceIm --> getMemberList");
		return adminDAO.getMemberWaitList();
	}
	
	//가맹점 승인처리
	@Override
	public void memberLevelUpdate(MemberVO vo) {
		System.out.println("가입 승인 서비스 회원아이디 : " + vo.getId());
		adminDAO.memberLevelUpdate(vo);
	}
	
	//가맹점 반려처리
	@Override
	public void memberrefuse(MemberVO vo) {
		System.out.println("가입 반려 서비스 회원아이디 : " + vo.getId());
		adminDAO.memberrefuse(vo);
	}
	// 미출고 내역
	@Override
	public List<HashMap<String,Object>> getunOrderHistory() {

		System.out.println("미출고 내역 서비스");
		
		return adminDAO.getunOrderHistory();
	}
	
	// 미출고내역 회원정보 모달
	@Override
	public MemberVO getMemberM(MemberVO vo) {
		System.out.println("회원정보 모달 서비스");
		return adminDAO.getMemberM(vo);
	}
	
	// 미출고 주문 상세보기 모달
	@Override
	public List<OrderVO> getOrder(OrderVO vo) {
		System.out.println("주문 상세보기 모달 서비스");
		return adminDAO.getOrder(vo);
	}
	
	// 미출고  검색리스트
	@Override
	public List<MemberVO> franc_SearchList(SearchVO vo) {
		System.out.println("미출고 검색 리스트 서비스");
		return adminDAO.franc_SearchList(vo);
	}
	
	// 상품코드 / 주문수 리스트
	@Override
	public List<OrderItemVO> getOrder_detail(OrderVO vo) {
		System.out.println("상품코드/주문수 리스트 서비스");
		return adminDAO.getOrder_detail(vo);
	}
	
	// 현재 재고수 조회
	@Override
	public int getProduct_Quantily(int productNo) {
		// TODO Auto-generated method stub
		return adminDAO.getProduct_Quantily(productNo);
	}
	// 재고수 차감
	@Override
	public int update_Quantily(OrderItemVO list) {
		
		return adminDAO.update_Quantily(list);
	}
	
	// 주문상태 배송중으로 변경
	@Override
	public void update_order_status(OrderVO vo) {
		adminDAO.update_order_status(vo);
		
	}
	
	// 주문상태 배송중으로 변경
		@Override
		public void update_order_refuse(OrderVO vo) {
			adminDAO.update_order_refuse(vo);
			
		}
	
	
	
	
	

	
	
	
	

}
