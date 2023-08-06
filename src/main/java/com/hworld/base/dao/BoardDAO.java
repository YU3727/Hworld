package com.hworld.base.dao;

import java.util.List;

import com.hworld.base.util.Pager;
import com.hworld.base.vo.BoardVO;

public interface BoardDAO {

    // 공지사항 갯수
    public Long getTotalCount(Pager pager) throws Exception;
    
    // 공지사항 리스트 조회
    public List<BoardVO> getList(Pager pager) throws Exception;

    // 공지사항 상세 조회
    public BoardVO getDetail(BoardVO boardVO) throws Exception;

    // 공지사항 등록
    public int setAdd(BoardVO boardVO) throws Exception;

    // 공지사항 수정
    public int setUpdate(BoardVO boardVO) throws Exception;

    // 공지사항 삭제
    public int setDelete(BoardVO boardVO) throws Exception;
}
