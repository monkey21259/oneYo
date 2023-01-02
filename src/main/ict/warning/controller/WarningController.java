package main.ict.warning.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.common.ChabunUtils;
import main.ict.common.O_Session;
import main.ict.common.chabun.service.ChabunService;
import main.ict.warning.service.WarningService;
import main.ict.warning.vo.WarningVO;

@Controller
public class WarningController {
	Logger logger = LogManager.getLogger(WarningController.class);
	
	@Autowired(required=false)
	private WarningService warningService;
	
	@Autowired(required=false)
	private ChabunService chabunService;
	
	@GetMapping(value="warningForm")
	public String warningPage() {
		logger.info("warningPage.jsh 진입");
		
		return "warning/warningPage";
	}
	
	@GetMapping(value="wcSelect", produces="application/text; charset=UTF-8")
	@ResponseBody
	public Object wcSelect(HttpServletRequest req, WarningVO wvo) {
		logger.info("ajax 컨트롤러 진입");
		
		logger.info("ajax 데이터 값 : " + wvo.getValue());
		
		String number = wvo.getValue();
		String listStr = "";
		String ss = "";
		
		if(number.equals("00")) {
			List<WarningVO> list = warningService.recipeSelect();
			
			for(int i=0; i < list.size(); i++) {
			
			WarningVO _wvo = list.get(i);
			System.out.println("wvo.getallnum : " + _wvo.getAllnum());
			System.out.println("wvo.getallsubject : " + _wvo.getAllsubject());
				
				String s0 = _wvo.getAllnum();
				String s1 = _wvo.getAllsubject();
				ss = s1 + "/" + s0;
				listStr += ss + "&";

			}
			
			return listStr;
		}else if(number.equals("01")) {
			List<WarningVO> list = warningService.tipSelect();
			for(int i=0; i < list.size(); i++) {
				
				WarningVO _wvo = list.get(i);
				System.out.println("wvo.getallnum : " + _wvo.getAllnum());
				System.out.println("wvo.getallsubject : " + _wvo.getAllsubject());
					
					String s0 = _wvo.getAllnum();
					String s1 = _wvo.getAllsubject();
					ss = s1 + "/" + s0;
					listStr += ss + "&";

				}
				
				return listStr;
		}else if(number.equals("02")) {
			List<WarningVO> list = warningService.comSelect();
		
			for(int i=0; i < list.size(); i++) {
				
				WarningVO _wvo = list.get(i);
				System.out.println("wvo.getallnum : " + _wvo.getAllnum());
				System.out.println("wvo.getallsubject : " + _wvo.getAllsubject());
					
					String s0 = _wvo.getAllnum();
					String s1 = _wvo.getAllsubject();
					ss = s1 + "/" + s0;
					listStr += ss + "&";

				}
				
				return listStr;
		}
		
		return null;
	}
	
	@GetMapping(value="warningInsert")
	public String warningInsert(HttpServletRequest req, WarningVO wvo, Model m) {
		
		
		String wnum = ChabunUtils.getWarningChabun("D", chabunService.getWarningChabun().getWnum());
		System.out.println("wnum : " + wnum);
		wvo.setWnum(wnum);
			
		String wtnum = req.getParameter("wtnum");
		wvo.setWtnum(wtnum);
		
		String wcategory = req.getParameter("wcategory");
		wvo.setWcategory(wcategory);

		String wcontent = req.getParameter("wcontent");
		wvo.setWcontent(wcontent);
		
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
		wvo.setMnum(mnum);
		
		int nCnt = warningService.warningInsert(wvo);
		
		if(nCnt > 0 ) {
			
		
			return "warning/warningInsert";
		}
		
		
		return "";
	}
	
}	