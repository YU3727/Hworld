package com.hworld.base.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hworld.base.dao.MemberDAO;
import com.hworld.base.dao.NoticeDAO;
import com.hworld.base.dao.QnaDAO;
import com.hworld.base.util.BoardFileManager;
import com.hworld.base.util.Pager;
import com.hworld.base.vo.BoardVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.NoticeVO;
import com.hworld.base.vo.QnaVO;
import com.hworld.base.vo.TelephoneVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class CustomerSupportService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private BoardFileManager boardFileManager;
	
	@Value("${app.upload}")
	private String path;

	
	
	public List<BoardVO> getNoticeList(Pager pager) throws Exception {
		Long totalCount = noticeDAO.getTotalCount(pager);
		pager.makeNum(totalCount);
		pager.makeStartRow();
		return noticeDAO.getList(pager);
		
	}
	
	public BoardVO getNoticeDetail(BoardVO boardVO) throws Exception {
		return noticeDAO.getDetail(boardVO);
	}
	
	public int setBoardHitUpdate(NoticeVO noticeVO) throws Exception {
		return noticeDAO.setBoardHitUpdate(noticeVO);
	}
	
	
	public List<TelephoneVO> setAdd(HttpSession session) throws Exception {
		TelephoneVO telephoneVO = new TelephoneVO();
		//
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		telephoneVO.setMemberNum(memberVO.getMemberNum());

		return qnaDAO.getTelephoneList(telephoneVO); 
	}
	
	public int setAdd(QnaVO qnaVO, HttpSession session, MultipartFile multipartFile) throws Exception {
		qnaVO.setMemberNum(((MemberVO)(session.getAttribute("memberVO"))).getMemberNum());
		return qnaDAO.setAdd(qnaVO);
	}
	
	public int setAdd(NoticeVO noticeVO, String board, HttpSession session, MultipartFile multipartFile) throws Exception {
		noticeVO.setMemberNum(((MemberVO)(session.getAttribute("memberVO"))).getMemberNum());
		path = path + board + "/";
		noticeVO.setFilePath(boardFileManager.saveFile(multipartFile, path));
		return noticeDAO.setAdd(noticeVO);
	}
	

}
