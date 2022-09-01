package com.catchbug.biz.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.PagedDataList;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class OrderController {

	@Autowired
	private ProductService ps;

	@Autowired
	private CartService cs;

	@Autowired
	private OrderService os;

	private IamportClient client;
	public OrderController() {
		client = new IamportClient("4531801211644015",
				"FwlsbR1eS5ipldOSWyK9K23UfoV0pnvo4GT3Q0SryW6txJ9B9ZDhLdVxVlweIUsrsNGAYAaIjRHBhoyu");
	}

	// 결제시 검증
	@ResponseBody
	@RequestMapping(value = "/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session,
			@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		return client.paymentByImpUid(imp_uid);
	}
	
	// 결제 완료후 결제 내역
	@ResponseBody
	@RequestMapping(value = "/payments/status/{status}")
	public IamportResponse<PagedDataList<Payment>> paymentByImpStatus(Model model, Locale locale, HttpSession session,
			@PathVariable(value = "status") String status) throws IamportResponseException, IOException {
		return client.paymentsByStatus(status);
	}
	

	// 본사 발주서 작성
	@RequestMapping("/productForOrder.do")
	public String factoryOrder(Model model, CategoryVO vo, HttpSession session) {

		// 처음 들어갔을때 카테고리 불러오기
		MemberVO member = (MemberVO) session.getAttribute("member");
		List<CartVO> cartList = new ArrayList<CartVO>();
		if (cs.getCart(member) != null) {
			for (CartVO cartVO : cs.getCart(member)) {
				cartVO.initTotal();
				cartList.add(cartVO);
			}
			model.addAttribute("cartList", cartList);
		}

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
		MemberVO member = (MemberVO) session.getAttribute("member");
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
	public String submitOrder(OrderVO ov) {
		System.out.println(ov);
		List<OrderItemVO> list = new ArrayList<OrderItemVO>();
		// 선택한 상품에 대한 정보 초기화
		for (OrderItemVO oiv : ov.getOrders()) {
			OrderItemVO orderItem = ps.getProductItem(oiv.getProduct_no());
			oiv.setProduct_name(orderItem.getProduct_name());
			oiv.setProduct_no(orderItem.getProduct_no());
			oiv.setPrice(orderItem.getPrice());
			oiv.initTotal();
			list.add(oiv);
		}
		ov.setOrders(list);

		/*
		 * // 주문번호 생성 아이디_날짜초까지 Date date = new Date(); SimpleDateFormat format = new
		 * SimpleDateFormat("_yyyyMMddmmss"); String orderId = ov.getId() +
		 * format.format(date);
		 */
		System.out.println(ov.getOrder_no());
		ov.setOrder_no(ov.getOrder_no());
		ov.initTotal();
		System.out.println(ov);

		// 주문서 생성
		os.insertOrder(ov);
		// 주문한 상품리스트 생성
		for (OrderItemVO oiv : ov.getOrders()) {
			oiv.setOrder_no(ov.getOrder_no());
			os.insertOrderItemList(oiv);
			System.out.println(oiv);
		}

		// 장바구니 삭제
		for (OrderItemVO oiv : ov.getOrders()) {
			CartVO vo = new CartVO();
			vo.setId(ov.getId());
			vo.setProduct_no(oiv.getProduct_no());

			cs.deleteCart(vo);
		}

		return "redirect:factory_Order_History.do";
	}

	/* 결제모듈 */

	@RequestMapping(value = "/iamport")
	public void iamport() {

	}

	/* 비동기 처리 */

	// 하위 카테고리 클릭시 상품 비동기처리
	@RequestMapping("/getProductAjax.do")
	@ResponseBody
	public List<ProductVO> orderAjax(CategoryVO vo) {

		return ps.getProductList(vo);
	}

	// 상품 추가시 디비 삽입
	@RequestMapping(value = "/insertCartAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public String orderInsertAjax(CartVO vo, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setId(member.getId());

		// 성공 ok 실패 false 
		String result = cs.insertCart(vo);
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/updateCartAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateCart(CartVO vo, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setId(member.getId());
		System.out.println(vo + "=====");

		cs.updateCart(vo);

	}

	// 상품 삭제시 디비 삭제
	@RequestMapping(value = "/deleteCartAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public String orderDeleteAjax(CartVO vo, HttpSession session) {

		// 아이디값은 세션에서 받아오기
		MemberVO member = (MemberVO) session.getAttribute("member");
		vo.setId(member.getId());

		cs.deleteCart(vo);
		return "ok";
	}
}
