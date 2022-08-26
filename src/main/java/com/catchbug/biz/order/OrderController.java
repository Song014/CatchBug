package com.catchbug.biz.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	// 본사 발주서 작성
	@RequestMapping("/factoryOrder.do")
	public String factoryOrder(Model model, CategoryVO vo) {

		// 처음 들어갔을때 카테고리 불러오기

		// 대분류 카테고리
		model.addAttribute("mainCategory", ps.getMainCategory());
		// 소분류 카테고리
		model.addAttribute("subCategory", ps.getSubCategory());
		// 첫 요청 상품 데이터 최근 등록순
		vo.setSub_category(0);
		model.addAttribute("product", ps.getProductList(vo));

		return "admin/factory_order";
	}

	// 하위 카테고리 클릭시 상품 비동기처리
	@RequestMapping("/orderAjax.do")
	@ResponseBody
	public List<ProductVO> orderAjax(CategoryVO vo) {
		System.out.println(vo.getSub_category());

		return ps.getProductList(vo);
	}

	// 상품 추가시 디비 삽입
	@RequestMapping("/orderInsertAjax.do")
	@ResponseBody
	public String orderInsertAjax(CartVO vo,HttpSession session) {

		// 아이디값은 세션에서 받아오기
		MemberVO member = (MemberVO) session.getAttribute("memberId");
		vo.setId(member.getId());
		System.out.println(vo);
		
		cs.insertCart(vo);
		return "insertCart";
	}

	// 상품 삭제시 디비 삭제
	@RequestMapping("/orderDeleteAjax.do")
	@ResponseBody
	public String orderDeleteAjax(CartVO vo,HttpSession session) {

		// 아이디값은 세션에서 받아오기
		MemberVO member = (MemberVO) session.getAttribute("memberId");
		vo.setId(member.getId());
		
		cs.deleteCart(vo);
		return "deleteCart";
	}
}
