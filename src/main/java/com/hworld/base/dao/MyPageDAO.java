package com.hworld.base.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hworld.base.util.Pager;
import com.hworld.base.vo.BillVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.TelephoneVO;

@Mapper
public interface MyPageDAO {
	
	//페이저 처리용 billVO 갯수 구하기
	public Long getTotalBill(Pager pager) throws Exception;
	
	//회원의 모든 billVO 불러오기
	public List<BillVO> getPMDList(Pager pager) throws Exception;
	
	//회원의 청구서가 있는 Telephone 정보 가져오기
	public List<TelephoneVO> getTPList(Pager pager) throws Exception;
	
	//회원의 대표회선 정보 불러오기
	public Map<String, Object> getKingDetail(MemberVO memberVO) throws Exception;
	
	//회원의 비밀번호 업데이트
	public int setPasswordUpdate(MemberVO memberVO) throws Exception;
	
	//회원의 정보 업데이트
	public int setMemberUpdate(MemberVO memberVO) throws Exception;
	
	//세션 업데이트
	public MemberVO getNewSession(MemberVO memberVO) throws Exception;
	
	//미납금 납부 후 billVO 업데이트
	public int setBillUpdate(BillVO billVO) throws Exception;
	
	//checkOurNum - ajax
	public String isChangeableNum(String phoneNum) throws Exception;
	
	//checkOtherTP - 서비스에서 타통신사 번호 체크 실행
	public String isChangeableNumOT(String phoneNum) throws Exception;
	
	//대표회선 변경
	//serialNum 가져오기
	public String getSerialNum(String phoneNum) throws Exception;
	
	//serialNum으로 memberNum 찾기
	public String getMemberNum(String serialNum) throws Exception;
	
	//memberNum으로 kingCheck 초기화 하기
	public int setKingCheckInit(String memberNum) throws Exception;
	
	//serialNum으로 kingCheck 업데이트 하기
	public int setKingCheckUpdate(String serialNum) throws Exception;
	
	//일시정지
	//일시정지 신청 : 일시정지 버튼이 나오고, 버튼을 누르면 일시정지가 시작됨
	//일시정지 해제 : 정지해제 버튼이 나오고, 버튼을 누르면 일시정지가 해제됨
	//일시정지 날짜 입력
//	public String
}
