package main.ict.common;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;

public class FileUpload {
	
	Logger logger = LogManager.getLogger(FileUpload.class);

	private String				fuPath;		// 파일 업로드 경로
	private int					fuImgSize;	// 이미지 파일 사이즈
	private String				fuEncType;	// 인코딩 타입
	private MultipartRequest	mr;			// [POST] Request Object
	
	public FileUpload() {}

	public FileUpload(String fuPath, int fuImgSize, String fuEncType) {
		this.fuPath = fuPath;
		this.fuImgSize = fuImgSize;
		this.fuEncType = fuEncType;
	}

	// __imgFileUpload(HttpServletRequest req)에만 의존성이 있음__
	public boolean imgFileUpload(HttpServletRequest req, String path) {
		
		boolean bool = false;
		
		try {
			this.mr = new MultipartRequest( req,
											path,
											this.fuImgSize,
											this.fuEncType,
											new FileRename() );
			logger.info("mr: " + mr);
			bool = true;
		} catch (Exception e) {  // IOException
			logger.info(e.getMessage());
		}
		
		return bool;
	}
	
	public boolean imgFileUpload(HttpServletRequest req) {
	
		if (this.fuPath == null || this.fuPath.equals("")) {
			logger.info("FilePath is invalid.");
			
			return false;  // 객체에 경로가 유효하지 않은 경우
		}
		
		return imgFileUpload(req, this.fuPath);
	}
	
	public String getParameter(String s) {
		if (s == null) {
			logger.info("FileUpload - getParameter()'s argument is invalid.");
			
			return null;
		}
		return this.mr.getParameter(s);
	}
	
	public String[] getParameterValues(String s) {
		if (s == null) {
			logger.info("FileUpload - getParameterValues()'s argument is invalid.");
			
			return null;
		}
		return this.mr.getParameterValues(s);
	}
	
	
	//	230112 사진 null처리
	public String getFileName(String f) {

		String fileName = "";
		fileName = mr.getFilesystemName(f);
		
		if (fileName == null) {
			fileName = "noimg.png";
		}
		return fileName;
	}
	
	//	230112 업뎃시 비교 널처리
	public String getUpdateFileName(String fNew, String fOld) {
		
		logger.info("getUpdateFileName(fNew,fOld) >>> : " + fNew + "\nbool >>> : " + fOld);
		
		String newFileName = "";
		newFileName = this.getFileName(fNew);
		logger.info("this.getFileName(fNew) >>> : " + newFileName);
		
		String oldFileName = "";
		oldFileName = mr.getParameter(fOld);
		logger.info("mr.getParameter(fOld) >>> : " + oldFileName);
		
		String fileName = "";
		
		if (!(newFileName.equals("noimg.png")) && !(newFileName.equals(oldFileName))) {
			fileName = newFileName;
		} else {
			fileName = oldFileName;
		}
		logger.info("if (newFileName == null && !(newFileName.equals(oldFileName))) >>> : " + fileName);
		
		return fileName;
	}
	
	public List<String> getFileNames() {
		@SuppressWarnings("unchecked")
		Enumeration<String>	_enum = this.mr.getFileNames();
		List<String>		fNameList = new ArrayList<String>();
		
		while (_enum.hasMoreElements()) {
			String fName = _enum.nextElement().toString();
			fNameList.add(fName);
		}
		
		return fNameList;
	}
	
}
