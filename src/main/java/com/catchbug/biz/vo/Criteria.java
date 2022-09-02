package com.catchbug.biz.vo;

import lombok.Data;

@Data
public class Criteria {
	
	private Integer page; // 현재 페이지 번호
	private Integer perPageNum; // 페이지당 출력할 게시글 갯수
	
    // page와 perPageNum을 default로 각각 1, 10으로 정해준다
    public Criteria() {
     
        this.page = 1;
        this.perPageNum = 10;
    }
    
    public void setPage(Integer page) {
        // page를 1보다 작은 수로 입력되면 1로 고정
        this.page = (page < 1) ? 1 :  page; 
    }
    
    public void setPerPageNum(Integer perPageNum) {
        // perPageNum을 10 미만 또는 100이상일 경우 10으로 고정
        this.perPageNum = (perPageNum <10 || perPageNum >=100) ? 15 : perPageNum;
    }
     
    //MyBatis
    public int getPageStart(){
 
        return (this.page-1) * perPageNum ;
    }
}
