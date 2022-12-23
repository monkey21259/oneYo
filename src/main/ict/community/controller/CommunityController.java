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
import main.ict.common.chabun.service.ChabunService;
import main.ict.community.service.CommunityService;
import main.ict.community.vo.CommunityVO;

@Controller
public class CommunityController {

	Logger logger = LogManager.getLogger(CommunityController.class);

	@Autowired(required = false)  
	private CommunityService communityService;
	
	@Autowired(required = false)  
	private ChabunService chabunService;
			
//커뮤니티 게시글 등록(INSERT)
	@GetMapping("communityInsertForm")
	public String communityInsertForm() { 
		
		logger.info("communityInsertForm 함수 진입 >>> " );
	
		return "community/communityInsertForm";
	}
	
//게시글등록
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
		logger.info("cphoto >>> : " +  cphoto);
	
//		String mnum = req.getParameter("mnum");
		String mnum = "M202212200008";
		cvo.setMnum(mnum);
		logger.info("mnum >>> : " + cvo.getMnum());

		String mnick = "오징어";
		cvo.setMnick(mnick);
//		String mnick = req.getParameter("mnick");
		logger.info("mnick >>> : " + cvo.getMnick());
	
		//insert
		int nCnt = communityService.communityInsert(cvo);
		logger.info("nCnt >>> : " + nCnt);
		if(nCnt > 0) {
			return "community/communitySelectAll";
		}
		
		return "community/communityInsertForm";
	} //communityInsert
	
	
//커뮤니티 게시글 전체조회(selectAll)
	@GetMapping("communitySelectAll")
	public String communitySelectAll(CommunityVO cvo, Model model) {
		
		logger.info("communitySelectAll 함수 진입 >>> : ");
		
	//페이징처리 =========================	
		int pageSize = ConstPack.COMMUNITY_PAGE_SIZE; //3
		int groupSize = ConstPack.COMMUNITY_GROUP_SIZE; //3
		int curPage = ConstPack.COMMUNITY_CUR_PAGE; //1
		int totalCount = ConstPack.COMMUNITY_TOTAL_COUNT; //0
		
		
		if(cvo.getCurPage() != null) {
			curPage = Integer.parseInt(cvo.getCurPage());
			logger.info("curPage >>> : " + curPage);
		} 
		cvo.setPageSize(String.valueOf(pageSize));
		cvo.setGroupSize(String.valueOf(groupSize));
		cvo.setCurPage(String.valueOf(curPage));
		cvo.setTotalCount(String.valueOf(totalCount)); //string
		
	
		logger.info("cvo.getPageSize() >>> : " + cvo.getPageSize());
		logger.info("cvo.getGroupSize() >>> : " + cvo.getGroupSize());
		logger.info("cvo.getCurPage() >>> : " + cvo.getCurPage());
		logger.info("cvo.getTotalCount() >>> : " + cvo.getTotalCount());
		
	//페이징처리  =========================		
	
		List<CommunityVO> list = communityService.communitySelcetAll(cvo);
		int nCnt = list.size();
		logger.info("커뮤니티 전체조회 nCnt >>> : " + nCnt);
		
		if(nCnt > 0) {
			model.addAttribute("pagingCVO", cvo);
			model.addAttribute("listAll", list);
			return "community/communitySelectAll";
		}		
		
		return "community/communitySelectAll";
	}
	
}//class
