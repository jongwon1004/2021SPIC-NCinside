package com.ecc.ncinside.service;

import com.ecc.ncinside.dao.BoardDao;
import com.ecc.ncinside.domain.BoardDto;
import com.ecc.ncinside.domain.SearchCondition;
import com.ecc.ncinside.domain.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDao boardDao;

    @Override
    public int getCountAll() throws Exception {
        return boardDao.countAll();
    }

    @Override
    public int getCount(Integer type_no) throws Exception {
        return boardDao.count(type_no);
    }

    @Override
    public int remove(Integer bno, String writer) throws Exception {
        return boardDao.delete(bno, writer);
    }

    @Override
    public int write(BoardDto boardDto) throws Exception {
        return boardDao.insert(boardDto);
    }

    @Override
    public List<BoardDto> getList() throws Exception{
        return boardDao.selectAll();
    }

    @Override
    public BoardDto read(Integer bno) throws Exception{
        BoardDto boardDto = boardDao.select(bno);
        boardDao.increaseViewCnt(bno);
        return boardDto;
    }

    @Override
    public List<BoardDto> getPage(Map map) throws Exception {
        return boardDao.selectPage(map);
    }

    @Override
    public List<BoardDto> mainCurrentGetPage() throws Exception {
        return boardDao.mainCurrentSelectPage();
    }

    @Override
    public List<BoardDto> best10Page() throws Exception {
        return boardDao.top10Page();
    }

    @Override
    public int modify(BoardDto boardDto) throws Exception {
        return boardDao.update(boardDto);
    }

    @Override
    public List<BoardDto> typeSelectPage(Integer type_no) throws Exception {
        return boardDao.typeSelectPage(type_no);
    }

    @Override
    public String typeName(Integer typeNo) throws Exception {
        return boardDao.getTypeName(typeNo);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return boardDao.searchResultCnt(sc);
    }

    @Override
    public List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return boardDao.searchSelectPage(sc);
    }

    @Override
    public List<String> mainNameList(String keyword) throws Exception {
        return boardDao.mainSearchGalleyNameList(keyword);
    }

    @Override
    public List<BoardDto> mainContentList(String content) throws Exception {
        return boardDao.mainSearchContentList(content);
    }

    @Override
    public List<Map<Integer, String>> getMoreList() throws Exception {
        return boardDao.moreList();
    }

    @Override
    public List<Integer> mainTypeNoList(String keyword) throws Exception {
        return boardDao.mainTypeNoList(keyword);
    }

    @Override
    public int addBookMark(String id, BoardDto boardDto) throws Exception {
        return boardDao.addUserBookMark(id,boardDto);
    }

    @Override
    public List<Integer> usersBookMarkListNo(String id) throws Exception {
        return boardDao.usersBookMarkListNo(id);
    }

    @Override
    public List<BoardDto> bookMarkList(List<Integer> userAddedBkNo) throws Exception {
        return boardDao.bookMarkList(userAddedBkNo);
    }

    @Override
    public int deleteBookMark(Integer bno) throws Exception {
        return boardDao.deletebk(bno);
    }
}
