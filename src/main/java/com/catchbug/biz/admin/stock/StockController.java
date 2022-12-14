package com.catchbug.biz.admin.stock;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catchbug.biz.product.ProductService;
import com.catchbug.biz.vo.CategoryVO;
import com.catchbug.biz.vo.ProductVO;
import com.catchbug.biz.vo.SearchVO;

@Controller
public class StockController {
	
	@Autowired
	private StockService ss;
	
	@Autowired
	private ProductService ps;

	// 상품 리스트
	@RequestMapping("/stockList.do")
	public String StockList(Model model, CategoryVO vo, SearchVO sVo, ProductVO pvo) {

		// 처음 들어갔을때 카테고리 불러오기

		// 대분류 카테고리
		model.addAttribute("mainCategory", ss.getMainCategory());
		// 소분류 카테고리
		List<CategoryVO> category = ss.getSubCategory();
		model.addAttribute("subCategory", category);
		// 첫 요청 상품 데이터 최근 등록순
		vo.setSub_category(0);
		List<ProductVO> lpvo =  new ArrayList<ProductVO>();
		for (ProductVO productVO : ps.getProductList(vo)) {
			  String uuid = Normalizer.normalize(productVO.getUuid(), Normalizer.Form.NFC);
			  productVO.setUuid(uuid);
			  lpvo.add(productVO);
		}
		
		if(pvo.getProduct_name()=="") {
			model.addAttribute("product",lpvo);
		} else {
			model.addAttribute("product",ss.searchProductList(pvo));
		}
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
}
