package com.ecc.ncinside.service;

import com.ecc.ncinside.dao.BoardDao;
import com.ecc.ncinside.dao.CommentDao;
import com.ecc.ncinside.domain.BoardDto;
import com.ecc.ncinside.domain.CommentDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CommentServiceImplTest {
    @Autowired
    CommentService commentService;
    @Autowired
    CommentDao commentDao;
    @Autowired
    BoardDao boardDao;

    @Test
    public void remove() throws Exception {
//        boardDao.deleteAll();

        BoardDto boardDto = new BoardDto("hello", "hello", "asdf",1);
        assertTrue(boardDao.insert(boardDto) == 1);
        Integer bno = boardDao.selectAll().get(0).getBno();
        System.out.println("bno = " + bno);

        commentDao.deleteAll(bno);
        CommentDto commentDto = new CommentDto(bno,0,"hi","qwer");

        assertTrue(boardDao.select(bno).getComment_cnt() == 0);
        assertTrue(commentService.write(commentDto)==1);
        assertTrue(boardDao.select(bno).getComment_cnt() == 1);

        Integer cno = commentDao.selectAll(bno).get(0).getCno();

        // 일부러 예외를 발생시키고 Tx가 취소되는지 확인해야.
        int rowCnt = commentService.remove(cno, bno, commentDto.getCommenter());
        assertTrue(rowCnt==1);
        assertTrue(boardDao.select(bno).getComment_cnt() == 0);
    }

    @Test
    public void write() throws  Exception {
//        boardDao.deleteAll();

//        BoardDto boardDto = new BoardDto("hello", "hello", "asdf",1);
//        assertTrue(boardDao.insert(boardDto) == 1);
        Integer bno = 1711;

//        commentDao.deleteAll(bno);
        for (int i = 0; i < 10; i++) {
            CommentDto commentDto = new CommentDto(bno,0,"コメント残したよ"+i,"qwer");
            assertTrue(commentService.write(commentDto)==1);
        }

//        assertTrue(boardDao.select(bno).getComment_cnt() == 0);


//        Integer cno = commentDao.selectAll(bno).get(0).getCno();
//        assertTrue(boardDao.select(bno).getComment_cnt() == 1);
    }
}