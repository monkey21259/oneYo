package main.ict.levelup.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import main.ict.common.ChabunUtils;
import main.ict.common.ConstPack;
import main.ict.common.FileUpload;
import main.ict.common.O_Session;
import main.ict.common.chabun.service.ChabunService;
import main.ict.levelup.service.LevelupService;
import main.ict.mem.vo.MemVO;
import main.ict.tip.vo.TipVO;
import main.ict.levelup.vo.LevelupVO;

@Controller
public class LevelupController {
	private Logger logger = LogManager.getLogger(LevelupController.class);
	
	@Autowired(required=false)
	private LevelupService levelupService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	@GetMapping(value="levelupSelectAll")
	public String levelupSelectAll(HttpServletRequest req, MemVO mvo, Model m) {
		logger.info("levelupSelectAll() 함수 진입");
		
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
		mvo.setMnum(mnum);		
		
		List<LevelupVO> list = levelupService.levelupSelectAll(mvo);
		LevelupVO lvo = null;
		
		if(list !=null && list.size() > 0) {
			for(int i=0; i < list.size(); i++) {
				lvo = list.get(i);
				logger.info(lvo.getLvnum());
				logger.info(lvo.getLvsubject());
				logger.info(lvo.getLvcontent());
				logger.info(lvo.getLvphoto());
				logger.info(lvo.getMnum());
			}
			m.addAttribute("list", list);
		}
		
		return "levelup/levelupSelectAll";
	}
	
	@GetMapping(value="levelupInsertForm")
	public String levelupInsertForm(MemVO mvo, Model m) {
		logger.info("levelupInsertForm() 함수 진입");
		
		logger.info("mvo.getMnum() : " + mvo.getMnum());
		m.addAttribute("mvo", mvo);
		
		return "levelup/levelupInsertForm";
	}
	
	@PostMapping(value="levelupInsert")
	public String levelupInsert(HttpServletRequest req, Model m) {
		logger.info("levelupInsert() 함수 진입");
		
		LevelupVO lvvo = null;
		lvvo = new LevelupVO();
		
		String lvnum = ChabunUtils.getLevelupChabun("D", chabunService.getLevelupChabun().getLvnum());
		logger.info("채번 결과 tnum : " + lvnum);
		
		FileUpload fu = new FileUpload( ConstPack.LEVELUP_IMG_PATH
				,ConstPack.LEVELUP_IMG_SIZE
				,ConstPack.LEVELUP_ENC_TYPE);
	
		boolean bool = fu.imgFileUpload(req);
		logger.info("tipInsert() bool : " + bool);
		
		lvvo.setLvnum(lvnum);
		lvvo.setLvsubject(fu.getParameter("lvsubject"));
		lvvo.setLvcontent(fu.getParameter("lvcontent"));
		lvvo.setLvphoto(fu.getFileName("lvphoto"));
	
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
		lvvo.setMnum(mnum);
		
		logger.info(lvvo.getLvnum());
		logger.info(lvvo.getLvsubject());
		logger.info(lvvo.getLvcontent());
		logger.info(lvvo.getLvphoto());
		logger.info(lvvo.getMnum());	
		
		// 파일 업로드 체크
		if(lvvo.getLvphoto() == null)
			lvvo.setLvphoto("no_img.jpg");
		
		int nCnt = levelupService.levelupInsert(lvvo);
		
		return "levelup/levelupInsert";
	}
	
}
