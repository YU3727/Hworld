package com.hworld.base.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hworld.base.dao.CartDAO;
import com.hworld.base.dao.DirectDAO;
import com.hworld.base.dao.OrderDAO;
import com.hworld.base.util.FileManager;
import com.hworld.base.util.Pager;
import com.hworld.base.vo.CartVO;
import com.hworld.base.vo.DirectVO;
import com.hworld.base.vo.MemberVO;
import com.hworld.base.vo.PlanVO;
import com.hworld.base.vo.ReviewVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartService {

	@Autowired
	private DirectDAO directDAO;
	@Autowired
	private CartDAO cartDAO;


	
	//장바구니 정보 리스트
	public List<CartVO> getList(MemberVO memberVO) throws Exception{
		
		return cartDAO.getList(memberVO);
	}
	

		
	//장바구니에 상품 추가 
	public int setInsert(CartVO cartVO, MultipartFile[] multipartFiles)throws Exception{
		
		int result = cartDAO.setInsert(cartVO);
		
		return result;
	}


	//상품 수정 
	public int setUpdate(CartVO cartVO, MultipartFile[] multipartFiles) throws Exception{
		
		return cartDAO.setUpdate(cartVO);
	}

	
	//상품 삭제 
	public int setDelete(CartVO cartVO) throws Exception{
		
		return cartDAO.setDelete(cartVO);
	}

		
	
}