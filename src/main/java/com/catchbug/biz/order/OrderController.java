package com.catchbug.biz.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catchbug.biz.cart.CartService;
import com.catchbug.biz.product.ProductService;
import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.ProductVO;

@Controller
public class OrderController {

	@Autowired
	private ProductService ps;

	@Autowired
	private CartService cs;

	/*
	 * @Autowired private OrderService os;
	 */
	// 본사 발주서 작성
	@RequestMapping("/factoryOrder.do")
	public String factoryOrder(Model model, CategoryVO vo) {

		// 처음 들어갔을때 카테고리 불러오기

		// 카테고리
		model.addAttribute("mainCategory", ps.getMainCategory());
		model.addAttribute("subCategory", ps.getSubCategory());
		// 첫 요청 상품 데이터 최근 등록순
		vo.setSub_category(0);
		List<ProductVO> productList = ps.getProductList(vo);
		model.addAttribute("product", productList);

		return "admin/factory_order";
	}
	
	// 주문하기 눌렀을때
	@RequestMapping(value = "/submitOrder.do")
	public String submitOrder(CartVO vo) {
		
		// 장바구니번호 -> 주문서로 보내서 주문서 생성
		
		// 결제창으로 이동
		
		
		// 결제창 리턴?
		return"order_result";
	}

	// 하위 카테고리 클릭시 상품 비동기처리
	@RequestMapping("/orderAjax.do")
	@ResponseBody
	public List<ProductVO> orderAjax(CategoryVO vo) {

		return ps.getProductList(vo);
	}

	// 상품 추가시 디비 삽입
	@RequestMapping("/orderInsertAjax.do")
	@ResponseBody
	public String orderInsertAjax(CartVO vo, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("memberId");
		vo.setId(member.getId());

		cs.insertCart(vo);
		return "ok";
	}

	@RequestMapping(value = "/updateCartAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateCart(CartVO vo, HttpSession session) {

		
		MemberVO member = (MemberVO) session.getAttribute("memberId");
		vo.setId(member.getId());
		System.out.println(vo+"=====");
		
		cs.updateCart(vo);

	}

	// 상품 삭제시 디비 삭제
	@RequestMapping(value = "/orderDeleteAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public String orderDeleteAjax(CartVO vo, HttpSession session) {

		// 아이디값은 세션에서 받아오기
		MemberVO member = (MemberVO) session.getAttribute("memberId");
		vo.setId(member.getId());
		
		cs.deleteCart(vo);
		return "ok";
	}
}
