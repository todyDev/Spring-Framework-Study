package com.tody.common.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class MoreMaker {
	
	private int articleNo; //댓글 번호
	private int page; //페이지 번호
	private int pageNum; //화면에 보여줄 페이지 개수
	private int pageTotal; //총 게시글 수
	private int limitEnd; //마지막 범위
	private boolean next; //다음 버튼 생성 여부
	
    public MoreMaker() {
        this.page = 1;
        this.pageNum = 5;
    }

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
		calcData();
	}

	
	private void calcData() {
		
		limitEnd = page * pageNum;
		if( limitEnd > pageTotal ) {
			limitEnd = pageTotal;
		}
		
		next = limitEnd < pageTotal ? true : false;
		
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public int getLimitEnd() {
		return limitEnd;
	}

	public void setLimitEnd(int limitEnd) {
		this.limitEnd = limitEnd;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public String makeMore(int page) {
		UriComponents uri = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("articleNo", articleNo)
				.build();
		return uri.toUriString();
	}

}
