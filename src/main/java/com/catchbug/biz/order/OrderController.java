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
	public String factoryOrder(Model model, CategoryVO vo, HttpSession session) {

		// 처음 들어갔을때 카테고리 불러오기
		MemberVO member = (MemberVO) session.getAttribute("memberId");
		List<CartVO> cartList = cs.getCart(member);
		model.addAttribute("cartList", cartList);

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
	public String submitOrder(CartVO vo, HttpSession session, Model model) {

		/*
		 * ok cart테이블의 정보를 활용해서 폼을 만들어줌
		 * 
		 */
		MemberVO member = (MemberVO) session.getAttribute("memberId");
		List<CartVO> cartList = cs.getCart(member);
		model.addAttribute("cartList", cartList);

		// 결제창으로 이동

		// 결제창 리턴?
		return "admin/order_result";
	}

	/* 비동기 처리 */

	// 하위 카테고리 클릭시 상품 비동기처리
	@RequestMapping("/getProductAjax.do")
	@ResponseBody
	public List<ProductVO> orderAjax(CategoryVO vo) {

		return ps.getProductList(vo);
	}

	// 상품 추가시 디비 삽입
	@RequestMapping("/insertCartAjax.do")
	@ResponseBody
	public String orderInsertAjax(CartVO vo, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("memberId");
		vo.setId(member.getId());

		;
		String sys = cs.insertCart(vo);
		System.out.println(sys);
		return sys;
	}

	@RequestMapping(value = "/updateCartAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateCart(CartVO vo, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("memberId");
		vo.setId(member.getId());
		System.out.println(vo + "=====");

		cs.updateCart(vo);

	}

	// 상품 삭제시 디비 삭제
	@RequestMapping(value = "/deleteCartAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public String orderDeleteAjax(CartVO vo, HttpSession session) {

		// 아이디값은 세션에서 받아오기
		MemberVO member = (MemberVO) session.getAttribute("memberId");
		vo.setId(member.getId());

		cs.deleteCart(vo);
		return "ok";
	}
}
