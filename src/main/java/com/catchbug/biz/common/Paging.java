package com.catchbug.biz.common;

import com.catchbug.biz.vo.PageVO;

public class Paging {

	private int totalPage;
	//총갯수가 300개고 페이지가 10페이지라면
	private int pageCount; //한페이지에 표시할 글 갯수
	private int startPage;
	private int endPage;
	private int startPageNum;
	private int endPageNum;
	private PageVO result;
	
	// 9 * 20 + 1 181번부터 200번까지 표시
	
	public Paging(int pageCount,int totalPage) {
		result = new PageVO();
		this.pageCount = pageCount;
		this.totalPage = totalPage;
	}

	
	public PageVO getPaging(int page) {
		
		startPage = (page - 1) * pageCount + 1; //시작 글번호
		endPage = page * pageCount;	 //마지막으로 불러올 글번호
		startPageNum = page - 5;
		if(startPageNum <=0) {
			startPageNum = 1; //최소페이지는 1페이지부터
		}
		endPageNum = page + 5;
		if((totalPage/pageCount) < endPageNum) { //최대 표시할페이지가 갯수보타 넘치게 될경우 방지.
			if((totalPage%pageCount) == 0) { //나머지가 없을경우
				endPageNum = totalPage/pageCount;
			}else {
				endPageNum = totalPage/pageCount + 1; //나머지가 있을경우
			}
			
		}
		
		if(page == 0) {
			page = 1;
		}
		
		if(totalPage%pageCount == 0) {
			totalPage = totalPage/pageCount;
		}else {
			totalPage = totalPage/pageCount + 1;
		}
		
		result.setTotalPage(totalPage);
		result.setPageCount(pageCount);
		result.setPage(page);
		result.setStartPage(startPage);
		result.setEndPage(endPage);
		result.setStartPageNum(startPageNum);
		result.setEndPageNum(endPageNum);
		
		
		return result;
	}
	

	
	//페이지가 10페이지라면 표시할 페이지번호
			
	
	
	
}
