package com.hworld.base.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {

	public Map<String, ?> paymentDetailUpdate (Map<?, ?> map) throws Exception;
	
	public Map<String, ?> billInsert (Map<?, ?> map) throws Exception;
	
	public Map<String, ?> billCheckUpdate (Map<?, ?> map) throws Exception;
}
