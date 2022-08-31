package com.catchbug.biz.admin.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ProductVO;

@Controller
public class StockController {

	@Autowired
	private StockService ss;

	// 상품 리스트
	@RequestMapping("/stockList.do")
	public String StockList(Model model, CategoryVO vo) {

		// 처음 들어갔을때 카테고리 불러오기

		// 대분류 카테고리
		model.addAttribute("mainCategory", ss.getMainCategory());
		// 소분류 카테고리
		List<CategoryVO> category = ss.getSubCategory();
		model.addAttribute("subCategory", category);
		// 첫 요청 상품 데이터 최근 등록순
		vo.setSub_category(0);
		model.addAttribute("product", ss.getProductList(vo));
		return "admin/stock_list";
	}

	// 상품 리스트 검색
	@GetMapping("/searchAjax.do")
	@ResponseBody
	public List<ProductVO> SearchStockList(ProductVO vo) {
		return ss.searchProductList(vo);
	}

	// 선택 상품 모달창 처리를위한 Ajax처리
	@GetMapping("/modalAjax.do")
	@ResponseBody
	public List<ProductVO> getProductListO(ProductVO vo) {
		return ss.getProductListO(vo);
	}

	// 본사 재고현황
	@RequestMapping("/factoryStockList.do")
	public String FactoryStockList() {
		return "admin/factory_stock_list";
	}

	// 본사 발주서 작성
	@RequestMapping("/factoryOrder.do")
	public String factoryOrder(Model model, CategoryVO vo) {

		// 처음 들어갔을때 카테고리 불러오기

		// 대분류 카테고리
		model.addAttribute("mainCategory", ss.getMainCategory());
		// 소분류 카테고리
		List<CategoryVO> category = ss.getSubCategory();
		model.addAttribute("subCategory", category);
		// 첫 요청 상품 데이터 최근 등록순
		vo.setSub_category(0);
		model.addAttribute("product", ss.getProductList(vo));

		return "admin/factory_order";
	}

	// 임시
//	@RequestMapping("/francOrder.do")
//	public String FrancOrder(Model model) {
//		List<ProductVO> productList = ss.getProductList();
//		for (ProductVO list : productList) {
//			System.out.println(list);
//		}
//		model.addAttribute("product", productList);
//
//		return "franc/franc_order";
//	}

	// 하위 카테고리 클릭시 상품 비동기처리
	@RequestMapping("/orderAjax.do")
	@ResponseBody
	public List<ProductVO> orderAjax(CategoryVO vo) {
		return ss.getProductList(vo);
	}

	// 상품 추가시 디비 삽입
	@RequestMapping("/orderInsertAjax.do")
	@ResponseBody
	public String orderInsertAjax(ProductVO vo) {

		// 아이디값은 세션에서 받아오기
		ss.insertCart(vo);
		return "insertCart";
	}

	// 상품 삭제시 디비 삭제
	@RequestMapping("/orderDeleteAjax.do")
	@ResponseBody
	public String orderDeleteAjax(ProductVO vo) {

		// 아이디값은 세션에서 받아오기

		ss.deleteCart(vo);
		return "deleteCart";
	}

	// 본사 발주 내역
	@RequestMapping("/factory_Order_History.do")
	public String FactoryOrderHistory() {
		return "admin/factory_order_history";
	}
}
