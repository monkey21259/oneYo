<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.mem.vo.MemVO" %>
<%@ page import="main.ict.tip.vo.TipVO" %>
<%@ page import="main.ict.community.vo.CommunityVO" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("mypageHome.jsp 페이지 진입");
	
	List<MemVO> mList = null;
	List<TipVO> tList = null;
	List<CommunityVO> cList = null;
	List<RecipeVO> rList = null;
	
	if(request.getAttribute("mList") !=null) {
		mList = (List<MemVO>)request.getAttribute("mList");
		for(int i=0; i < mList.size(); i++){
			MemVO mvo = mList.get(i);
			logger.info("mnum : " + mvo.getMnum());
		}
	}
	
	if(request.getAttribute("tList") !=null) {
		tList = (List<TipVO>)request.getAttribute("tList");
		for(int i=0; i < tList.size(); i++){
			TipVO tvo = tList.get(i);
			logger.info("tnum : " + tvo.getTnum());
		}
	}
	
	if(request.getAttribute("cList") !=null) {
		cList = (List<CommunityVO>)request.getAttribute("cList");
		for (int i=0; i < cList.size(); i++){
			CommunityVO cvo = cList.get(i);
			logger.info("cnum : " + cvo.getCnum());
		}
	}
	
	if(request.getAttribute("rList") !=null) {
		rList = (List<RecipeVO>)request.getAttribute("rList");
		for (int i=0; i < cList.size(); i++){
			RecipeVO rvo = rList.get(i);
			logger.info("rnum : " + rvo.getRnum());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
</head>
<body>
my page
</body>
</html>