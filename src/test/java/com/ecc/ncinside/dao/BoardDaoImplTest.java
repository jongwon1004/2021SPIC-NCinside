package com.ecc.ncinside.dao;

import com.ecc.ncinside.domain.BoardDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class BoardDaoImplTest {

    @Autowired
    BoardDao boardDao;

    @Test
    public void select() throws Exception {
        assertTrue(boardDao != null);
        System.out.println("boardDao = " + boardDao);
        BoardDto boardDto = boardDao.select(30);
        System.out.println("boardDto = " + boardDto);
        assertTrue(boardDto.getBno() == 30);
    }

    @Test
    public void insertOne() throws Exception {
//        BoardDto boardDto = new BoardDto("コンストラクタのthisがわからないです", "こんにちは", "admin", 1);
//        boardDao.insert(boardDto);
        for(int i = 0; i < 300; i ++) {
            BoardDto boardDto = new BoardDto("コーヒーテストです"+ i, "コーヒーおいしいですね。", "whddnjs3340", 8);
            boardDao.insert(boardDto);
        }

    }

    @Test
    public void insert() throws Exception {
        for(int i = 0; i < 10; i++) {
            BoardDto boardDto = new BoardDto("title"+i, "content", "jongwon", 1);
            boardDao.insert(boardDto);
        }
        assertTrue(boardDao.countAll() == 10);
    }


}