package com.hworld.base.dao;

import java.util.List;

import com.hworld.base.util.Pager;
import com.hworld.base.vo.BoardVO;

public interface BoardDAO extends BbsDAO {



    // 공지사항 수정
    public int setUpdate(BoardVO boardVO) throws Exception;

    // 공지사항 삭제
    public int setDelete(BoardVO boardVO) throws Exception;
}
