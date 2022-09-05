package com.catchbug.biz.vo;

import lombok.Data;

@Data
public class Criteria {

    private int page;
    private int perPageNum;

    public Criteria() {
        page = 1;
        perPageNum = 15;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        if(page <= 0)
            page = 1;

        this.page = page;
    }

    public int getPerPageNum() {
        return perPageNum;
    }
    
    public int getPageStart() {
        return (this.page - 1) * this.perPageNum;
    }

    public void setPerPageNum(int perPageNum) {
        if(perPageNum <= 0 || perPageNum > 150) {
            perPageNum = 15;
        }else {
        	this.perPageNum = perPageNum;
        }
        
    }

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", getPage()=" + getPage()
				+ ", getPerPageNum()=" + getPerPageNum() + ", getPageStart()=" + getPageStart() + "]";
	}

//    @Override
//    public String toString() {
//        return "Criteria{" +
//                "page=" + page +
//                ", perPageNum=" + perPageNum +
//                '}';
//    }
    
    
}
