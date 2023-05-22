package com.ecc.ncinside;

import com.ecc.ncinside.dao.BoardDao;
import com.ecc.ncinside.domain.BoardDto;
import com.ecc.ncinside.domain.SearchCondition;
import com.ecc.ncinside.service.BoardService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class PageHandlerTest {

    @Autowired
    BoardDao boardDao;

    @Autowired
    BoardService boardService;

//    @Test
//    public void PageHandlerTest() throws Exception {
//        SearchCondition sc = new SearchCondition(1, 10);
//        PageHandlerSc ph = new PageHandlerSc(130, sc);
//
//
//    }

//    @Test
//    public void searchSelectPagetest() throws Exception {
//        SearchCondition sc = new SearchCondition(1, 10, "title", "T");
//        List<BoardDto> list = boardDao.searchSelectPage(sc);
//        System.out.println("list = " + list);
//    }

//    @Test
//    public void searchResultCntTest() throws Exception {
//        SearchCondition sc = new SearchCondition(1, 10, "title", "T");
//        int cnt = boardDao.searchResultCnt(sc);
//        System.out.println("cnt = " + cnt);
//    }

    @Test
    public void main1() {
        PageHandler ph = new PageHandler(138, 10, 10);
        System.out.println("ph = " + ph);
        assertTrue(ph.getBeginPage() == 1);
        assertTrue(ph.getEndPage() == 10);
    }

    @Test
    public void main2() {
        PageHandler ph = new PageHandler(310, 10, 29);
        ph.print();
        assertTrue(ph.getBeginPage() == 21);
        assertTrue(ph.getEndPage() == 30);
    }

    @Test
    public void main3() {
        PageHandler ph = new PageHandler(99, 10, 10);
        ph.print();
        assertTrue(ph.getBeginPage() == 1);
        assertTrue(ph.getEndPage() == 10);
    }

    @Test
    public void main4() throws Exception {
        BoardDto boardDto = boardDao.select(1);
        System.out.println("boardDto = " + boardDto);
    }

}