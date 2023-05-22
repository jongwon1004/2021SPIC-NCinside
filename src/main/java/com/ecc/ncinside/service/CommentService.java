package com.ecc.ncinside.service;

import com.ecc.ncinside.domain.CommentDto;

import java.util.List;

public interface CommentService {
    int getCount(Integer bno) throws Exception;
    int remove(Integer cno, Integer bno, String commenter) throws Exception;
    int write(CommentDto commentDto) throws Exception;
    List<CommentDto> getList(Integer bno) throws Exception;
    CommentDto read(Integer cno) throws Exception;
    int modify(CommentDto commentDto) throws Exception;
}
