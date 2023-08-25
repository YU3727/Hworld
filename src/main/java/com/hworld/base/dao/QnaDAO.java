package com.hworld.base.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hworld.base.util.Pager;
import com.hworld.base.vo.QnaVO;
import com.hworld.base.vo.TelephoneVO;

@Mapper
public interface QnaDAO extends BbsDAO{
	
//    // Q&A 갯수
//    public Long getTotalCount(Pager pager) throws Exception;
//    
//    // Q&A 리스트 조회
//    public List<QnaVO> getList() throws Exception;
//
//    // Q&A 상세 조회
//    public QnaVO getDetail(QnaVO qnaVO) throws Exception;
//    
//
//    // Q&A 등록
//    public int setAdd(QnaVO qnaVO) throws Exception;
//
//    // Q&A 수정
//    public int setUpdate(QnaVO qnaVO) throws Exception;
//
//    // Q&A 삭제
//    public int setDelete(QnaVO qnaVO) throws Exception;
    
    // 회선 조회
    public List<TelephoneVO> getTelephoneList(TelephoneVO telephoneVO) throws Exception;
}
