package com.catchbug.biz.vo;

import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageMaker {
	
	private int totalCount; // 승인요청 토탈 수
	private int displayPageNum = 10; // 페이지당 보여지는 수
	
	private int startPage; // 현재 화면에 보여지는 맨 앞 번호
	private int endPage; // 현재 화면에 보여지는 마지막 번호
	private boolean prev; // 이전버튼
	private boolean next; // 다음 페이지
	
	private Criteria cri; // page 현재페이지, perPageNum = 10개
	
	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
    /* 검색 키워드 인코딩 처리 */
    public String encoding(String keyword) {
      if(keyword == null || keyword.trim().length() == 0) return "";
      try {
        return URLEncoder.encode(keyword, "UTF-8");
      } catch(Exception e) {
        return "";
      }
    }
}
