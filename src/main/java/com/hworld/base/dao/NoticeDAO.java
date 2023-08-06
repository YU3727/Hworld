package com.hworld.base.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hworld.base.util.Pager;
import com.hworld.base.vo.BoardVO;
import com.hworld.base.vo.NoticeVO;
import com.hworld.base.vo.QnaVO;

@Mapper
public interface NoticeDAO extends BoardDAO{
	
	public int setBoardHitUpdate(NoticeVO noticeVO) throws Exception;
}
