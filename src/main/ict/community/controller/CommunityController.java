package main.ict.community.controller;

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
import main.ict.community.service.CommunityService;
import main.ict.community.vo.CommunityVO;
import main.ict.levelup.vo.LevelupVO;
import main.ict.warning.vo.WarningVO;

@Controller
public class CommunityController {

	Logger logger = LogManager.getLogger(CommunityController.class);

//서비스호출	
	@Autowired(required = false)  
	private CommunityService communityService;

//채번서비스호출	
	@Autowired(required = false)  
	private ChabunService chabunService;
			
//커뮤니티 게시글 등록폼(insertform)
	@GetMapping("communityInsertForm")
	public String communityInsertForm() { 
		
		logger.info("communityInsertForm 함수 진입 >>> " );
	
		return "community/communityInsertForm";
	}
	
//게시글등록(insert)
	@PostMapping("communityInsert")
	public String communityInsert(HttpServletRequest req) {
		
		logger.info("communityInsert 함수 진입>>> : ");
		
		//채번
		String cnum = ChabunUtils.getCommunityChabun("D", chabunService.getCommunityChabun().getCnum());
		
		//파일
		FileUpload fu = new FileUpload(	  ConstPack.COMMUNITY_IMG_PATH
										, ConstPack.COMMUNITY_IMG_SIZE
										, ConstPack.COMMUNITY_ENC_TYPE);
		
		logger.info("fu >>> : " + fu);
		
		//이미지 원본사이즈
		boolean bool = fu.imgFileUpload(req);
		logger.info("imgFileUpload >>> : " + bool);
//		//vo 인스턴스
		CommunityVO cvo = null;
		cvo = new CommunityVO();
		
		cvo.setCnum(cnum);
		logger.info("cnum >>> : " +cvo.getCnum());
		
		String csubject = fu.getParameter("csubject"); 
		cvo.setCsubject(csubject);
		logger.info("csubject >>> : " + cvo.getCsubject());
		
		String ccontent = fu.getParameter("ccontent");
		cvo.setCcontent(ccontent);
		logger.info("ccontent >>> : " + cvo.getCcontent());
		
		String cphoto = fu.getFileName("cphoto");
		cvo.setCphoto(cphoto);
		logger.info("cphoto >>> : " +  cvo.getCphoto());
	
		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);
		cvo.setMnum(mnum);
		logger.info("mnum >>> : " + cvo.getMnum());

		//insert
		int nCnt = communityService.communityInsert(cvo);
		logger.info("nCnt >>> : " + nCnt);
		if(nCnt < 1) {
			return "community/communityInsertForm";
		}
		return "community/communityInsert";
		
	} //communityInsert
	
	
	
//커뮤니티 게시글 전체조회(selectAll)
	@GetMapping("communitySelectAll")
	public String communitySelectAll(CommunityVO cvo, Model model) {
		
		logger.info("communitySelectAll 함수 진입 >>> : ");
		
	//페이징처리 =========================	
		int pageSize = ConstPack.COMMUNITY_PAGE_SIZE; //20
		int groupSize = ConstPack.COMMUNITY_GROUP_SIZE; //5
		int curPage = ConstPack.COMMUNITY_CUR_PAGE; //1
		int totalCount = ConstPack.COMMUNITY_TOTAL_COUNT; //0
		
		
		if(cvo.getCurPage() != null) {
			curPage = Integer.parseInt(cvo.getCurPage());
		} 
		cvo.setPageSize(String.valueOf(pageSize));
		cvo.setGroupSize(String.valueOf(groupSize));
		//cvo.setTotalCount(String.valueOf(totalCount)); 
		cvo.setCurPage(String.valueOf(curPage));
		
		logger.info("cvo.getPageSize() >>> : " + cvo.getPageSize());
		logger.info("cvo.getGroupSize() >>> : " + cvo.getGroupSize());
		logger.info("cvo.getCurPage() >>> : " + cvo.getCurPage());
		logger.info("cvo.getTotalCount() >>> : " + cvo.getTotalCount());
		
	//페이징처리  =========================		
	
		//searching 프로퍼티 null값 방지
		if(cvo.getKeyword() == null || cvo.getKeyword() == "null") {
			cvo.setKeyword("");
		}//end of if
		if(cvo.getStartDate() == null || cvo.getStartDate() == "null") {
			cvo.setStartDate("");
		}//end of if
		if(cvo.getEndDate() == null || cvo.getEndDate() == "null") {
			cvo.setEndDate("");
		}//end of if
		
		List<CommunityVO> list = communityService.communitySelectAll(cvo);
		int nCnt = list.size();
		logger.info("커뮤니티 전체조회 nCnt >>> : " + nCnt);
		
		//if(nCnt > 0) {
			model.addAttribute("pagingCVO", cvo);
			model.addAttribute("listAll", list);
		//}		
		
		return "community/communitySelectAll";
	}
	
	
//커뮤니티 글조회(content)
		@GetMapping("communitySelectContent")
		public String communitySelectContent(CommunityVO cvo, Model model) {
			logger.info("communitySelectContent 함수 진입 >>> : ");
			
			List<CommunityVO> listS = communityService.communitySelect(cvo);
			logger.info("cvo.getCnum() >>> : " + cvo.getCnum());
			
			logger.info("listS.size() >>> : " + listS.size());
			
			if(listS.size() ==  1 ) {
				model.addAttribute("listS", listS);
			}
			return "community/communitySelectContent";
			
		} //SelectContent

//커뮤니티 글 수정폼(updateform)
		@GetMapping("communityUpdateForm")
		public String communityUpdateForm(CommunityVO cvo, Model model) {
			logger.info("communityUpdateForm 함수 진입>>> : ");
			
			List<CommunityVO> listU = communityService.communitySelect(cvo);
			logger.info("cvo.getCnum() >>> : " + cvo.getCnum());
			logger.info("cvo.getCphoto() >>>>>>>>>> : " + cvo.getCphoto());
			
			logger.info("listS.size() >>> : " + listU.size());
			
			if(listU.size() == 1) {
				model.addAttribute("listU", listU);
				
			}
			
			return"community/communityUpdateForm";
		} //updateForm
		
//커뮤니티 글수정(update)	
	@PostMapping("communityUpdate")
	public String communityUpdate(HttpServletRequest req, Model model) {
		logger.info("communityUpdate 함수 진입>>> : ");
		
		//파일
		FileUpload fu = new FileUpload(	  ConstPack.COMMUNITY_IMG_PATH
										, ConstPack.COMMUNITY_IMG_SIZE
										, ConstPack.COMMUNITY_ENC_TYPE);
		
		logger.info("fu >>> : " + fu);
		
		//이미지 원본사이즈
		boolean bool = fu.imgFileUpload(req);
		logger.info("imgFileUpload >>> : " + bool);
		
//		//vo 인스턴스
		CommunityVO cvo = null;
		cvo = new CommunityVO();
	
		String cnum = fu.getParameter("cnum");
		cvo.setCnum(cnum);
		logger.info("cnum >>> : " + cvo.getCnum());
		
		String csubject = fu.getParameter("csubject"); 
		cvo.setCsubject(csubject);
		logger.info("csubject >>> : " + cvo.getCsubject());
		
		String ccontent = fu.getParameter("ccontent");
		cvo.setCcontent(ccontent);
		logger.info("ccontent >>> : " + cvo.getCcontent());

		
		String cphoto = fu.getFileName("cphoto");
		if(cphoto == null) {
			cphoto =" ";
		}
		cvo.setCphoto(cphoto);
		logger.info("cphoto >>> : " +  cvo.getCphoto());
		
		//update
		int nCnt = communityService.communityUpdate(cvo);
		logger.info("nCnt >>> : " + nCnt);
		
		if(nCnt > 0) {
			model.addAttribute("communityUpdate", cvo);
			return "community/communityUpdate";
		}
		return "community/communitySelectContent";
		

	}//communityUpdateForm 
	
	
//커뮤니티 글삭제(delete)
	@GetMapping("communityDelete")
	public String communityDelete(CommunityVO cvo) {
		logger.info("communityDelete >>> : ");
		
		//delete
		int nCnt = communityService.communityDelete(cvo);
		logger.info("nCnt >>> : " + nCnt);
		if(nCnt == 1) {
			return "community/communityDelete";
		}
		return "community/communitySelectContent";
	} //communityDelete
	
	@GetMapping(value="communityWarningForm")
	public String communityWarningForm(HttpServletRequest req, CommunityVO cvo, Model m) {
		System.out.println("cvo.getCnum : " + cvo.getCnum());
		System.out.println("cvo.getCsubject : " + cvo.getCsubject());
		
		String cnum = cvo.getCnum();
		String csubject = cvo.getCsubject();

		O_Session mSession = O_Session.getInstance();
		String mnum = mSession.getSession(req);

		m.addAttribute("mnum", mnum);
		m.addAttribute("cnum", cnum);
		m.addAttribute("csubject", csubject);
		return "community/communityWarningForm";
	
	}
	
	@GetMapping(value="communityWarningInsert")
	public String warningInsert(WarningVO wvo, Model m) {
	
		System.out.println("wvo.getWtnum : " + wvo.getWtnum());
		System.out.println("wvo.getWcategory : " + wvo.getWcategory());
		System.out.println("wvo.getWcontent : " + wvo.getWcontent());
		
		String wnum = ChabunUtils.getWarningChabun("D", chabunService.getWarningChabun().getWnum());
		System.out.println("wnum : " + wnum);
		wvo.setWnum(wnum);
		
		int nCnt = communityService.communityWarningInsert(wvo);
		
		if(nCnt > 0) {
			
			return "community/communityWarningInsert";
		}
		
		return "";
		
	}
	
	
}//class
