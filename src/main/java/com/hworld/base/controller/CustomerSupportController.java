package com.hworld.base.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hworld.base.service.CustomerSupportService;
import com.hworld.base.util.Pager;
import com.hworld.base.vo.BoardVO;
import com.hworld.base.vo.NoticeVO;
import com.hworld.base.vo.QnaVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/cs/*")
@Slf4j
public class CustomerSupportController {
	
	@Autowired
	private CustomerSupportService csService;
	
	// 고객지원
	@GetMapping("home")
	public ModelAndView c1() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/customerSupport");
		return modelAndView;
	}
	
	// ----------------------------------------------------------------------------------------------------
	// 공지사항
	// 리스트
	@GetMapping("notice")
	public ModelAndView getNoticeList(Pager pager) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		List<BoardVO> list = csService.getNoticeList(pager);
		modelAndView.setViewName("hworld/notice");
		modelAndView.addObject("list", list);
		modelAndView.addObject("board", "notice");
		return modelAndView;
	}
	
	
	//글 상세
	@GetMapping("noticeDetail")
	public ModelAndView getNoticeDetail(NoticeVO noticeVO, String board, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Cookie [] Cookies = request.getCookies();
		
		Cookie newCookie = null;
		
		if(Cookies != null && Cookies.length > 0) {
			for (Cookie cookie : Cookies) {
				
				if(cookie.getName().equals("notice"+noticeVO.getNum())) {
					newCookie = cookie;
				}
			}
		}
		
		if(newCookie == null) {
			newCookie = new Cookie("notice"+noticeVO.getNum(), "|" + noticeVO.getNum() + "|");
			newCookie.setMaxAge(60*60*24);
			newCookie.setPath("/");
			csService.setBoardHitUpdate(noticeVO);
			response.addCookie(newCookie);
		}

		mv.addObject("vo", csService.getDetail(noticeVO));
		mv.addObject("board", board);
		mv.setViewName("hworld/noticeDetail");
		return mv;
	}
	
	// 글 작성
	@GetMapping("noticeAdd")
	public ModelAndView setNoticeAdd(String board) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("board", board);
		mv.setViewName("hworld/noticeAdd");
		return mv;
	}
	
	// 글 작성
	@PostMapping("noticeAdd")
	public ModelAndView setAdd(NoticeVO noticeVO, String board, HttpSession session, MultipartFile file) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String msg = "공지사항 등록 실패";
		
		int result = csService.setAdd(noticeVO, board, session, file);
		
		if(result > 0) {
			msg = "공지사항 등록 성공";
		}
		
		mv.addObject("result", msg);
		mv.addObject("url", "./notice");
		
		mv.setViewName("common/result");
		return mv;
	}
	
	// 글 수정
	@GetMapping("noticeUpdate")
	public ModelAndView setBoardUpdate(NoticeVO noticeVO, String board) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", csService.getDetail(noticeVO));
		mv.addObject("board", board);
		mv.setViewName("hworld/noticeUpdate");
		return mv;
	}
	
	//글 수정
	@PostMapping("noticeUpdate")
	public ModelAndView setBoardUpdate(NoticeVO noticeVO, String board, MultipartFile file) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String msg = "수정 실패";
		
		int result = csService.setUpdate(noticeVO, board, file);
		
		if(result > 0) {
			msg = "수정 성공";
		}
		
		mv.addObject("result", msg);
		mv.addObject("url", "./noticeDetail?num="+noticeVO.getNum()+"&board="+board);
		mv.setViewName("common/result");
		
		
		return mv;
	}
	
	@PostMapping("noticeDelete")
	public ModelAndView setBoardDelete(NoticeVO noticeVO, String board) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("result", csService.setDelete(noticeVO, board));
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	//첨부파일 삭제
	@PostMapping("noticeFileDelete")
	public ModelAndView setBoardFileDelete(NoticeVO noticeVO, String board) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("result", csService.setFileDelete(noticeVO, board));
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	// ----------------------------------------------------------------------------------------------------
	// 1:1 문의
	@GetMapping("qna")
	public ModelAndView setQnaAdd(HttpSession session) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/qna");
		modelAndView.addObject("board", "qna");
		modelAndView.addObject("list", csService.getTelephoneList(session));
		return modelAndView;
	}
	
	@PostMapping("qna")
	public ModelAndView setQnaAdd(QnaVO qnaVO, String board, HttpSession session, MultipartFile [] files) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		String msg = "문의 등록 실패";
		
		int result = csService.setAdd(qnaVO, board, session, files);
		
		if(result > 0)  {
			msg = "문의 등록 성공";
		}
		
		mv.addObject("result", msg);
		mv.addObject("url", "./qna");
			
		
		mv.setViewName("common/result");
		
		return mv;
		
	}
	
	
	// ----------------------------------------------------------------------------------------------------
	// 신청서/자료실
	@GetMapping("archive")
	public ModelAndView getArchive() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("board", "archive");
		modelAndView.setViewName("hworld/archive");
		return modelAndView;
	}
	
	
	// ----------------------------------------------------------------------------------------------------
	// 파일다운
	@GetMapping("fileDown")
	public ModelAndView getFileDown(String fileName, String board) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("fileName", fileName);
		mv.addObject("board", board);
		mv.setViewName("boardFileManager");
		
		return mv;
	
	}
	

	

	

}
