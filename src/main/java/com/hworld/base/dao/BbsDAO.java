package com.hworld.base.dao;

import java.util.List;

import com.hworld.base.util.Pager;
import com.hworld.base.vo.BoardVO;
import com.hworld.base.vo.FileVO;

public interface BbsDAO {

    // 게시물 갯수
    public Long getTotalCount(Pager pager) throws Exception;
    
    // 게시물 리스트 조회
    public List<BoardVO> getList(Pager pager) throws Exception;

    // 게시물 상세 조회
    public BoardVO getDetail(BoardVO boardVO) throws Exception;

    // 게시물 등록
    public int setAdd(BoardVO boardVO) throws Exception;
    
    // 파일 등록
    public int setFileAdd(FileVO fileVO) throws Exception;
}
