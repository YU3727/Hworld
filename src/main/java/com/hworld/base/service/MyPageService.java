package com.hworld.base.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.hworld.base.dao.MyPageDAO;
import com.hworld.base.util.Pager;
import com.hworld.base.vo.BillVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.TelephoneVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class MyPageService {
	
	@Autowired
	private MyPageDAO myPageDAO;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//납부, 미납내역 출력하기
	public List<TelephoneVO> getPMDList(Pager pager, HttpSession session) throws Exception{
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		pager.setMemberNum(memberVO.getMemberNum());
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberNum", memberVO.getMemberNum());
		map.put("flag", null);
		
		Long totalCount = myPageDAO.getTotalCount(map);
		
		log.error("====================================> PAYMENTDETAILS TOTALCOUNT : {}", totalCount);
		
		pager.makeNum(totalCount);
		pager.makeStartRow();
		
		
		return myPageDAO.getPMDList(pager);
	}
	
	//회선 리스트 출력하기
	public List<TelephoneVO> getTPList(Pager pager, HttpSession session) throws Exception{
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		pager.setMemberNum(memberVO.getMemberNum());
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberNum", memberVO.getMemberNum());
		map.put("flag", true);
		
		Long totalCount = myPageDAO.getTotalCount(map);
		
		log.error("====================================> TELEPHONE TOTALCOUNT : {}", totalCount);
		
		pager.makeNum(totalCount);
		pager.makeStartRow();
		
		return myPageDAO.getTPList(pager);
	}
	
	
	//회원의 대표 회선 정보 가져오기
	public Map<String, Object> getKingDetail(HttpSession session) throws Exception{
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		
		return myPageDAO.getKingDetail(memberVO);
	}
	
	
	//회원 비밀번호 변경
	public int setPasswordUpdate(MemberVO memberVO, HttpSession session) throws Exception{
		
		//세션으로부터 memberNum 받아서 memberVO에 저장
		MemberVO mem = (MemberVO)session.getAttribute("memberVO");
		//memberVO에 memberNum 입력
		memberVO.setMemberNum(mem.getMemberNum());
		
		//비밀번호 암호화 후 memberVO에 저장
		String rawNpw = memberVO.getPw();
		String encodeNpw = pwEncoder.encode(rawNpw);
		memberVO.setPw(encodeNpw);
		
		//저장된 memberVO로 업데이트 실행
		int result = myPageDAO.setPasswordUpdate(memberVO);
		
		return result;
	}
	
	
	//회원 정보 변경
	public int setMemberUpdate(MemberVO memberVO, HttpSession session) throws Exception{
		
		//세션으로부터 memberNum 받아서 memberVO에 저장
		MemberVO mem = (MemberVO)session.getAttribute("memberVO");
		//memberVO에 memberNum 입력
		memberVO.setMemberNum(mem.getMemberNum());
		
		//저장된 memberVO로 업데이트 실행
		int result = myPageDAO.setMemberUpdate(memberVO);
		
		//업데이트 된 정보로 세션 업데이트
		memberVO = myPageDAO.getNewSession(memberVO);
		session.setAttribute("memberVO", memberVO);
		
		return result;
	}
	
	
	//미납금 납부 후 bill 업데이트
	public int setBillUpdate(@RequestParam("billNum") String[] billNums) throws Exception{
		
//		for (String string : billNums) {
//			log.error(" :::::::::::::::::::: billnum : {}", string);
//		}
		
		int result = 0;
		
		//billNum 숫자만큼 업데이트
		for (String stringbillNum : billNums) {
			BillVO billVO = new BillVO();
			Integer billNum = Integer.parseInt(stringbillNum);
			billVO.setBillNum(billNum);
			result = myPageDAO.setBillUpdate(billVO);
		}
		
		return result;
	}
	
	
	//isChangeableNum
	public boolean isChangeableNum(String phoneNum) throws Exception{
		//자회사 검증때 조회됨 : 자회사에 회선있음
		//자회사 검증때 조회x + 타회사 검증때 조회됨 : 타회사에 회선 있음
		//자, 타회사 검증때 조회x : 모두 회선 없음
		
		boolean check = false;
		
		//자회사 검증
		String result = myPageDAO.isChangeableNum(phoneNum);
		if(result != null) {
			//자회사 회선있음
			check = true;
			return check;
		}
		log.info(" :::::::::::::::::::: service check value 자회사 : {} ", check);
		
		//타회사 검증
		result = myPageDAO.isChangeableNumOT(phoneNum);
		if(result != null) {
			//타회사 회선있음
			check = true;
			return check;
		}
		log.info(" :::::::::::::::::::: service check value 타회사 : {} ", check);
		
		
		return check;
	}
	
	
	//대표 회선 변경 작업
	public int setKingNumUpdate(String phoneNum) throws Exception{
		
		//받아온 phoneNum으로 serialNum조회
		String serialNum = myPageDAO.getSerialNum(phoneNum);
		
		//해당 serialNum을 가진 memberNum 찾기
		String memberNum = myPageDAO.getMemberNum(serialNum);
		
		//memberNum이 일치하는 모든 회선 kingCheck값을 0으로 업데이트
		int result = myPageDAO.setKingCheckInit(memberNum);
		
		//저장해둔 serialNum의 kingCheck값을 1로 업데이트
		result = myPageDAO.setKingCheckUpdate(serialNum);
		
		//리턴
		return result;
	}
	
	
	//일시정지 작업
	public int setStopTelephoneUpdate(String phoneNum) throws Exception{
		
		//받아온 phoneNum으로 serialNum 조회
		String serialNum = myPageDAO.getSerialNum(phoneNum);
		
		//해당 serialNum에 일시정지 날짜 입력하기(확인 버튼을 누른 당일로)
		
		
		return 0;
	}
	
}
