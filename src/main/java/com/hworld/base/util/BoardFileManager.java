package com.hworld.base.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.hworld.base.service.DirectService;
import com.hworld.base.vo.DirectVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class BoardFileManager extends AbstractView {
	
	@Value("${app.upload}")
	private String path;
	
	@Value("${app.upload.base}")
	private String downloadPath;
	
		@Override
		protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			// controller에서 빠져나갈때 같은 이름을 찾는다 
			
			String fileName = (String) model.get("fileName");
			String board = (String) model.get("board");
			
			
			 File file = new File(downloadPath+board, fileName);
			 
			 //한글 처리
			 response.setCharacterEncoding("UTF-8");
			 
			 //총 파일의 크기
			 response.setContentLengthLong(file.length());
			 
			 //다운로드시 파일의 이름을 인코딩
			 String oriName = URLEncoder.encode(fileName, "UTF-8");
			 
			 //header 설정
			 response.setHeader("Content-Disposition", "attachment;filename=\""+oriName+"\"");
			 response.setHeader("Content-Transfer-Encoding", "binary");
			 
			 //HDD에서 파일을 읽고
			 FileInputStream fi = new FileInputStream(file);
			 //Client 로 전송 준비
			 OutputStream os = response.getOutputStream();
			 
			 //전송
			 FileCopyUtils.copy(fi, os);
			 
			 //자원 해제
			 os.close();
			 fi.close();
			
			
		}
		
	
	
	
		//1. HDD에 파일을 저장하고 저장된 파일명을 리턴
		public String saveFile(String path, MultipartFile multipartFile)  throws Exception {
			
				if(multipartFile == null || multipartFile.isEmpty()) {
					return null;
				}
			
		    	//1. 폴더 생성
		    	File folder = new File(path); // 저장할 폴더
		    	if (!folder.exists()) {
		    		folder.mkdirs();
		    	}
		    	
		    	//2. 저장할 파일 이름 생성 : uuid + "." + 확장자
		    	
		    	String fileName = getFileName(multipartFile.getOriginalFilename());
		    	
		    	
		    
		    	
		    	// 파일 저장
		    	// 저장할 파일 경로 생성
	    		File file = new File(folder, fileName); 
	    		
	    		// 파일이 이미 존재하는 경우 건너뛰기
	    		if (!file.exists()) {
	    			multipartFile.transferTo(file);
	    		}
		    		
		    	
		    	return fileName;
		}
		    
		
		public boolean deleteFile(String path, String fileName) throws Exception{
		
		    File file = new File(path, fileName);
		    

		    return file.delete();
			
		}
		
		private String getFileName(String oriName) {
			String uuid = UUID.randomUUID().toString();
			String ext = getExtractExt(oriName);
			return uuid + "." + ext;
		}
		
		private String getExtractExt(String oriName) {
			int pos = oriName.lastIndexOf(".");
			return oriName.substring(pos+1);
		}


}
