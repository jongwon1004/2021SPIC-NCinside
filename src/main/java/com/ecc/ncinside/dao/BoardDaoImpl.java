package com.ecc.ncinside.dao;

import com.ecc.ncinside.domain.BoardDto;
import com.ecc.ncinside.domain.SearchCondition;
import com.ecc.ncinside.domain.Type;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Repository
public class BoardDaoImpl implements BoardDao {

    @Autowired
    SqlSession session;

    private static String namespace = "com.ecc.ncinside.dao.BoardMapper.";  // 마지막에 .  붙혀줘야함

    @Override
    public BoardDto select(Integer bno) throws Exception {  // session.selectOne 에서 발생하는 예외를 Service계층으로 넘겨줌
        return session.selectOne(namespace+"select", bno);
    }

    @Override
    public List<BoardDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectALL");
    }

    @Override
    public List<BoardDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace + "selectPage", map);
    }

    @Override
    public List<BoardDto> mainCurrentSelectPage() throws Exception {
        return session.selectList(namespace + "mainCurrentSelectPage");
    }

    @Override
    public int insert(BoardDto boardDto) throws Exception {
        return session.insert(namespace + "insert", boardDto);
    }

    @Override
    public int update(BoardDto boardDto) throws Exception {
        return session.update(namespace + "update", boardDto);
    }

    @Override
    public int delete(Integer bno, String writer) throws Exception {
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);
        return session.delete(namespace + "delete", map);
    }

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public int countAll() throws Exception {
        return session.selectOne(namespace + "countAll");
    }

    @Override
    public int count(Integer type_no) throws Exception {
        return session.selectOne(namespace + "count", type_no);
    }

    @Override
    public List<BoardDto> typeSelectPage(Integer type_no) throws Exception {
        return session.selectList(namespace + "typeSelectPage", type_no);
    }

    @Override
    public int increaseViewCnt(Integer bno) throws Exception {
        return session.update(namespace + "increaseViewCnt", bno);
    }

    @Override
    public List<BoardDto> top10Page() throws Exception {
        return session.selectList(namespace + "bestPage");
    }

    @Override
    public String getTypeName(Integer typeNo) throws Exception {
        return session.selectOne(namespace+"typeName", typeNo);
    }

    @Override
    public List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "searchSelectPage", sc);
    }

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "searchResultCnt", sc);
    }

    @Override
    public List<String> mainSearchGalleyNameList(String keyword) throws Exception {
        return session.selectList(namespace + "mainSearchGalleyNameList", keyword);
    }

    @Override
    public List<BoardDto> mainSearchContentList(String content) throws Exception {
        return session.selectList(namespace + "mainSearchContentList", content);
    }

    @Override
    public int updateCommentCnt(Integer bno, int cnt) {
        Map map = new HashMap();
        map.put("cnt", cnt);
        map.put("bno", bno);
        return session.update(namespace + "updateCommentCnt", map);
    }

    @Override
    public List<Map<Integer, String>> moreList() throws Exception {
        return session.selectList(namespace + "moreList");
    }

    @Override
    public List<Integer> mainTypeNoList(String keyword) throws Exception {
        return session.selectList(namespace + "mainSearchGalleyNoList", keyword);
    }

    @Override
    public int addUserBookMark(String id,BoardDto boardDto) throws Exception {
        Map map = new HashMap();
        map.put("id", id);
        map.put("bno", boardDto.getBno());
        return session.insert(namespace + "addBookMark", map);
    }

    @Override
    public List<Integer> usersBookMarkListNo(String id) throws Exception {
        return session.selectList(namespace + "usersBookMarkListNo", id);
    }

    @Override
    public List<BoardDto> bookMarkList(List<Integer> userAddedBkNo) throws Exception {
        return session.selectList(namespace + "bookMarkList", userAddedBkNo);
    }

    @Override
    public int deletebk(Integer bno) throws Exception {
        return session.delete(namespace + "bookMarkDelete", bno);
    }
}
