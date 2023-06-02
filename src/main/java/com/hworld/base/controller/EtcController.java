package com.hworld.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/etc/*")
public class EtcController {
	// 작업 규모가 커지면 controller 따로 분리
	
	// 대리점 찾기
	@GetMapping("findShop")
	public ModelAndView d1() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hworld/findShop");
		return modelAndView;
	}
	
	
}
