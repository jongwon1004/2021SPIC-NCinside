package com.ecc.ncinside.service;

import com.ecc.ncinside.domain.BoardDto;
import com.ecc.ncinside.domain.SearchCondition;
import com.ecc.ncinside.domain.Type;

import java.util.List;
import java.util.Map;

public interface BoardService {
    int getCount(Integer type_no) throws Exception;

    int getCountAll() throws Exception;

    int remove(Integer bno, String writer) throws Exception;

    int write(BoardDto boardDto) throws Exception;

    List<BoardDto> getList() throws Exception;

    BoardDto read(Integer bno) throws Exception;

    List<BoardDto> getPage(Map map) throws Exception;

    List<BoardDto> mainCurrentGetPage() throws Exception;

    List<BoardDto> best10Page() throws Exception;

    String typeName(Integer typeNo) throws Exception;

    int modify(BoardDto boardDto) throws Exception;

    List<BoardDto> typeSelectPage(Integer type_no) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;

    List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception;

    List<String> mainNameList(String keyword) throws Exception;

    List<BoardDto> mainContentList(String content) throws Exception;

    List<Map<Integer, String>> getMoreList() throws Exception;

    List<Integer> mainTypeNoList(String keyword) throws Exception;

    int addBookMark(String id, BoardDto boardDto) throws Exception;

    List<Integer> usersBookMarkListNo(String id) throws Exception;

    List<BoardDto> bookMarkList(List<Integer> userAddedBkNo) throws Exception;

    int deleteBookMark(Integer bno) throws Exception;
}
