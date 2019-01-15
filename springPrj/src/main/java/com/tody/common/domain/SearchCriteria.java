package com.tody.common.domain;

public class SearchCriteria extends Criteria {
	
	private String searchType; //검색 조건
	private String keyword; //검색 키워드
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
