package com.ecc.ncinside.dao;

import com.ecc.ncinside.domain.BoardDto;
import com.ecc.ncinside.domain.SearchCondition;
import com.ecc.ncinside.domain.Type;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

public interface BoardDao {
    BoardDto select(Integer bno) throws Exception;
    List<BoardDto> selectAll() throws Exception;
    List<BoardDto> selectPage(Map map) throws Exception;  // BoardService getPage(Map map)
    List<BoardDto> mainCurrentSelectPage() throws Exception;
    List<BoardDto> top10Page() throws Exception;
    String getTypeName(Integer typeNo) throws Exception;
    int insert(BoardDto boardDto) throws Exception;
    int update(BoardDto boardDto) throws Exception;
    int delete(Integer bno, String writer) throws Exception;
    int deleteAll() throws Exception;
    int count(Integer type_no) throws Exception;
    int countAll() throws Exception;
    int increaseViewCnt(Integer bno) throws Exception;
    List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception;
    int searchResultCnt(SearchCondition sc) throws Exception;
    List<BoardDto> typeSelectPage(Integer type_no) throws Exception;

    List<String> mainSearchGalleyNameList(String galley_name) throws Exception;

    List<BoardDto> mainSearchContentList(String content) throws Exception;

    int updateCommentCnt(Integer bno, int cnt);

    List<Map<Integer, String>> moreList() throws Exception;

    List<Integer> mainTypeNoList(String keyword) throws Exception;

    int addUserBookMark(String id, BoardDto boardDto) throws Exception;

    List<Integer> usersBookMarkListNo(String id) throws Exception;

    List<BoardDto> bookMarkList(List<Integer> userAddedBkNo) throws Exception;

    int deletebk(Integer bno) throws Exception;
}
