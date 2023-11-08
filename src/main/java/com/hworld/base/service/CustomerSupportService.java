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
import com.hworld.base.vo.FileVO;
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

	
	//공지사항
	public List<BoardVO> getNoticeList(Pager pager) throws Exception {
		Long totalCount = noticeDAO.getTotalCount(pager);
		pager.makeNum(totalCount);
		pager.makeStartRow();
		return noticeDAO.getList(pager);
		
	}
	
	public BoardVO getDetail(NoticeVO noticeVO) throws Exception {
		return noticeDAO.getDetail(noticeVO);
	}
	
	public int setBoardHitUpdate(NoticeVO noticeVO) throws Exception {
		return noticeDAO.setBoardHitUpdate(noticeVO);
	}
	
	public int setAdd(NoticeVO noticeVO, String board, HttpSession session, MultipartFile file) throws Exception {
		noticeVO.setMemberNum(((MemberVO)(session.getAttribute("memberVO"))).getMemberNum());
		noticeVO.setFileName(boardFileManager.saveFile(path + board + "/", file));
		noticeVO.setOriName(file.getOriginalFilename());
		return noticeDAO.setAdd(noticeVO);
	}
	
	public int setFileDelete(NoticeVO noticeVO, String board) throws Exception {
		noticeVO = (NoticeVO) noticeDAO.getDetail(noticeVO);
		int result = noticeDAO.setFileDelete(noticeVO);

		if(result < 0) {
			return result;
		}

		boolean fileResult = boardFileManager.deleteFile(path + board + "/", noticeVO.getFileName());
		
//		if(!fileResult) {
//			throw new Exception();
//		}
		

		
		return result;
			
	}
	
	public int setUpdate(NoticeVO noticeVO, String board, MultipartFile file) throws Exception {
		
		if(file.isEmpty()) {
			NoticeVO noticeFile= (NoticeVO) noticeDAO.getDetail(noticeVO);
			noticeVO.setFileName(noticeFile.getFileName());
			noticeVO.setOriName(noticeFile.getOriName());
		}
		else {
			noticeVO.setFileName(boardFileManager.saveFile(path + board + "/", file));
			noticeVO.setOriName(file.getOriginalFilename());
		}
		
		return noticeDAO.setUpdate(noticeVO);
	}
	
	public int setDelete(NoticeVO noticeVO, String board) throws Exception {
		noticeVO = (NoticeVO) noticeDAO.getDetail(noticeVO);
		int result = noticeDAO.setDelete(noticeVO);

		if(result < 0) {
			return result;
		}

		if(noticeVO.getFileName() != null) {
			boolean fileResult = boardFileManager.deleteFile(path + board + "/", noticeVO.getFileName());
			
//			if(!fileResult) {
//				throw new Exception();
//			}
		}
		
		return result;
	}
	
	//---------------------------------------------------------------------------------
	//Qna
	public List<TelephoneVO> getTelephoneList(HttpSession session) throws Exception {
		TelephoneVO telephoneVO = new TelephoneVO();
		
		// 회원번호를 세션에서 가져와 회선VO에 대입
		telephoneVO.setMemberNum(((MemberVO)session.getAttribute("memberVO")).getMemberNum());

		return qnaDAO.getTelephoneList(telephoneVO); 
	}
	
	public int setAdd(QnaVO qnaVO, String board, HttpSession session, MultipartFile [] multipartFiles) throws Exception {
		qnaVO.setMemberNum(((MemberVO)(session.getAttribute("memberVO"))).getMemberNum());
		int result = qnaDAO.setAdd(qnaVO);
		
		if(result == 0) {
			throw new Exception();
		}
		
		
		
		
		if(multipartFiles == null) {
			return result;
		}
		
		for (MultipartFile multipartFile : multipartFiles) {
			
			
			FileVO fileVO = new FileVO();
			fileVO.setFileName(boardFileManager.saveFile(path + board + "/", multipartFile));
			fileVO.setNum(qnaVO.getNum());
			fileVO.setOriName(multipartFile.getOriginalFilename());

			result = qnaDAO.setFileAdd(fileVO);
			
			log.info("Result : {}", result);
			
			if(result == 0) {
				throw new Exception();
			}
		}
		
		return result;
	}
	

	

}
