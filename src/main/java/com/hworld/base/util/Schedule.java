package com.hworld.base.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hworld.base.dao.ScheduleDAO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class Schedule {
	
	@Autowired
	private ScheduleDAO scheduleDAO;

	@Scheduled (cron = "0 0 0 1 * *")
	public void paymentDetailUpdate () throws Exception {
		Map<String, ?> map = new HashMap<>();
		scheduleDAO.paymentDetailUpdate(map);
		int result = (int)map.get("result");
		if(result < 0) {
			log.error("result : {}", result);
			log.error((String)map.get("msg"));
		}
		else {
			log.info("result : {}", result);
			log.info((String)map.get("msg"));
		}

	}
	
	@Scheduled (cron = "0 0 0 1 * *")
	public void billInsert () throws Exception {
		Map<String, ?> map = new HashMap<>();
		scheduleDAO.billInsert(map);
		int result = (int)map.get("result");
		if(result < 0) {
			log.error("result : {}", result);
			log.error((String)map.get("msg"));
		}
		else if(result > 0) {
			log.info("result : {}", result);
			log.info((String)map.get("msg"));
		}

	}
	
	@Scheduled (cron = "0 0 0 15 * *")
	public void billCheckUpdate () throws Exception {
		Map<String, ?> map = new HashMap<>();
		scheduleDAO.billCheckUpdate(map);
		int result = (int)map.get("result");
		if(result < 0) {
			log.error("result : {}", result);
			log.error((String)map.get("msg"));
		}
		else if(result > 0) {
			log.info("result : {}", result);
			log.info((String)map.get("msg"));
		}
	}
}
