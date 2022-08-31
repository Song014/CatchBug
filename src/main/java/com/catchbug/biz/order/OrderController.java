package com.catchbug.biz.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catchbug.biz.cart.CartService;
import com.catchbug.biz.product.ProductService;
import com.catchbug.biz.vo.CartVO;
import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.MemberVO;
import com.catchbug.biz.vo.OrderItemVO;
import com.catchbug.biz.vo.OrderVO;
import com.catchbug.biz.vo.ProductVO;

@Controller
public class OrderController {

	@Autowired
	private ProductService ps;

	@Autowired
	private CartService cs;
	
	@Autowired
	private OrderService os;

	// 본사 발주서 작성
	@RequestMapping("/productForOrder.do")
	public String factoryOrder(Model model, CategoryVO vo, HttpSession session) {

		// 처음 들어갔을때 카테고리 불러오기
		MemberVO member = (MemberVO) session.getAttribute("memberId");
		List<CartVO> cartList = new ArrayList<CartVO>();
		for (CartVO cartVO : cs.getCart(member)) {
			cartVO.initTotal();
			cartList.add(cartVO);
		}
		model.addAttribute("cartList", cartList);

		// 카테고리
		model.addAttribute("mainCategory", ps.getMainCategory());
		model.addAttribute("subCategory", ps.getSubCategory());
		// 첫 요청 상품 데이터 최근 등록순
		vo.setSub_category(0);

		List<ProductVO> productList = ps.getProductList(vo);
		model.addAttribute("product", productList);

		return "order/factory_order";
	}

	// 주문하기 눌렀을때
	@RequestMapping(value = "/orderPage.do")
	public String orderPage(CartVO vo, HttpSession session, Model model) {
		
		
		// 처음 보여줄 장바구니에 담긴 데이터
		MemberVO member = (MemberVO) session.getAttribute("memberId");
		List<CartVO> cartList = new ArrayList<CartVO>();
		for (CartVO cartVO : cs.getCart(member)) {
			cartVO.initTotal();
			cartList.add(cartVO);
		}
		model.addAttribute("cartList", cartList);

		return "order/order_confirm";
	}
	
	// 주문하기 눌렀을때
		@RequestMapping(value = "/submitOrder.do")
		@Transactional(rollbackFor = Exception.class)
		public String submitOrder(OrderVO oi) {
			System.out.println(oi);
			List<OrderItemVO> list = new ArrayList<OrderItemVO>();
			// 선택한 상품에 대한 정보 초기화
			for (OrderItemVO oiv : oi.getOrders()) {
				OrderItemVO orderItem = ps.getProduct(oiv.getProduct_no());
				oiv.setProduct_name(orderItem.getProduct_name());
				oiv.setProduct_no(orderItem.getProduct_no());
				oiv.setPrice(orderItem.getPrice());
				oiv.initTotal();
				list.add(oiv);
			}
			oi.setOrders(list);
			
			// 주문서 정보 초기화
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmmss");
			String orderId = oi.getId() + format.format(date);
			oi.setOrder_no(orderId);
			oi.initTotal();
			System.out.println(oi);
			
			os.insertOrder(oi);
			for (OrderItemVO oiv : oi.getOrders()) {
				oiv.setOrder_no(oi.getOrder_no());
				os.insertOrderItemList(oiv);
				System.out.println(oiv);
			}
			
			
			// 장바구니 삭제
			for(OrderItemVO oiv : oi.getOrders()) {
				CartVO vo = new CartVO();
				vo.setId(oi.getId());
				vo.setProduct_no(oiv.getProduct_no());
				
				cs.deleteCart(vo);
			}
			
			
			return "order/order_confirm";
		}
	
	/* 결제모듈 */

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
