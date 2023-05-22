package com.ecc.ncinside.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition {
    private Integer page = 1;
    private Integer pageSize = 10;
//    private Integer offset = 0;
    private String keyword = "";
    private String option = "";
    private Integer typeNo;

    public SearchCondition() {}

    public SearchCondition(Integer page, Integer pageSize, Integer typeNo) {
        this(page, pageSize, "", "", typeNo);
    }

    public SearchCondition(Integer page, Integer pageSize, String keyword, String option, Integer typeNo) {
        this.page = page;
        this.pageSize = pageSize;
        this.keyword = keyword;
        this.option = option;
        this.typeNo = typeNo;
    }

    public String getQueryString() {
        return getQueryString(this.getPage());
    }

    public String getQueryString(Integer page) {
        // ?page=10&pageSize=10&option=A&keyword=title&typeNo=

        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", getPageSize())
                .queryParam("option", getOption())
                .queryParam("keyword", getKeyword())
                .queryParam("typeNo", getTypeNo())
                .build().toString();
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getOffset() {
        return (page - 1) * pageSize;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public Integer getTypeNo() {
        return typeNo;
    }

    public void setTypeNo(Integer typeNo) {
        this.typeNo = typeNo;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", offset=" + getOffset() +
                ", keyword='" + keyword + '\'' +
                ", option='" + option + '\'' +
                ", typeNo=" + typeNo +
                '}';
    }
}
