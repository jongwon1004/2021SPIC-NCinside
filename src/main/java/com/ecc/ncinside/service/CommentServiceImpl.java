package com.ecc.ncinside.service;

import com.ecc.ncinside.dao.BoardDao;
import com.ecc.ncinside.dao.CommentDao;
import com.ecc.ncinside.domain.CommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
//    @Autowired
    BoardDao boardDao;
//    @Autowired
    CommentDao commentDao;
    // 위처럼 하는것은 인스턴스 변수에 주입을 받는것인데 별로 추천하진 않음
    // 왜냐면 지금은 2개밖에 주입을 받지 않는데 여러개 주입받을때 @Autowired를 빼먹거나 할 가능성이 있기떄문에 생성자 주입을 추천함

//    @Autowired  생성자 주입받을때 @Autowired 안적어줘도 생성자의 매개변수에 맞게 주입을 해줌 생성자가 1개일때만 가능
    public CommentServiceImpl(CommentDao commentDao, BoardDao boardDao) {
        this.commentDao = commentDao;
        this.boardDao = boardDao;
    }

    @Override
    public int getCount(Integer bno) throws Exception {
        return commentDao.count(bno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer cno, Integer bno, String commenter) throws Exception {
        int rowCnt = boardDao.updateCommentCnt(bno, -1);
        System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
//        throw new Exception("test");
        rowCnt = commentDao.delete(cno, commenter);
        System.out.println("rowCnt = " + rowCnt);
        return rowCnt;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(CommentDto commentDto) throws Exception {
        boardDao.updateCommentCnt(commentDto.getBno(), 1);
//                throw new Exception("test");
        return commentDao.insert(commentDto);
    }

    @Override
    public List<CommentDto> getList(Integer bno) throws Exception {
//        throw new Exception("test");
        return commentDao.selectAll(bno);
    }

    @Override
    public CommentDto read(Integer cno) throws Exception {
        return commentDao.select(cno);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return commentDao.update(commentDto);
    }
}
