package main.ict.common;

import java.io.File;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileRename implements FileRenamePolicy {

	Logger logger = LogManager.getLogger(FileRename.class);
	
	public FileRename() {}  // Default Constructors
	
	@Override
	public File rename(File f) {
		
		String	fileFullName = f.getName();
		if (fileFullName.equals("")) {  // 유효하지 않은 경우 empty string 반환.
			logger.info("fileName is invalid.");
			
			return null;
		}
		
		int		fExtNameIdx = fileFullName.lastIndexOf(".");
		if (fExtNameIdx == -1) {  // 파일확장자 명을 찾을 수 없을 때
			logger.info("fileExtendName is invalid.");
			
			return null;
		}
		
		String	fileName = fileFullName.substring(0, fExtNameIdx);
		String	fExtName = fileFullName.substring(fExtNameIdx);
		
		try {
			for (int i=1; f.exists(); i++) {
				StringBuffer sb = new StringBuffer();
				
				sb.append(fileName);
				sb.append(" (" + i + ")");
				sb.append(fExtName);
				
				f = new File(f.getParent(), sb.toString());
				
				logger.info(f.getParent());
				logger.info(f.getName());
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		
		return f;
	}

}
