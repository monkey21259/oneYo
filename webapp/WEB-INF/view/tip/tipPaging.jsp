<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
//-----------------
//전달해야 할 변수
//-----------------
	logger.info("인쿨루드를 통한 paging jsp 도착");	

	String url = null;
	String str = null;
							//boardpaging_1.jsp의 데이터
	url = request.getParameter("url");
	logger.info("Boardpaging.jsp url : " + url);
	
	str = request.getParameter("str");
	logger.info("빈깡통보냄 str : " + str);
	
	if(str != null){
		str = str + "&";
		logger.info("str + & : " + str);
	}

	//서칭 변수
		String searchFilter = null;
		String keyword = null;
		String startDate = null;
		String endDate = null;
		searchFilter = request.getParameter("searchFilter");
		keyword = request.getParameter("keyword");
		startDate = request.getParameter("startDate");
		endDate = request.getParameter("endDate");
		
		//서칭 null 체크
		if(searchFilter == null || searchFilter.length() == 0 || searchFilter.equals("null")){
			searchFilter = "";
		}//end of if
		if(keyword == null || keyword.length() == 0 || keyword.equals("null")){
			keyword = "";
		}//end of if
		if(startDate == null || startDate.length() == 0 || startDate.equals("null")){
			startDate = "";
		}//end of if
		if(endDate == null || endDate.length() == 0 || endDate.equals("null")){
			endDate = "";
		}//end of if
		
		logger.info("searchFilter : " + searchFilter);
		logger.info("keyword : " + keyword);
		logger.info("startDate : " + startDate);
		logger.info("endDate : " + endDate);
		
		if(str != null){
			str = str + "&";
			str = str.concat("searchFilter=").concat(searchFilter).concat("&");
			str = str.concat("keyword=").concat(keyword).concat("&");
			str = str.concat("startDate=").concat(startDate).concat("&");
			str = str.concat("endDate=").concat(endDate).concat("&");
			logger.info("str + & : " + str);
		}
	
%>
<%
	//페이지 네비게이션 관련 변수
	//---------------------
	
	//한 페이지에서 보여질 게시물의 수
	int pageSize = 0;

	//그룹의 크기
	int groupSize = 0;
	
	//전체 게시물의 갯수
	int totalCount = 0;
	
	//현재 페이지
	int curPage = 0;
	
	//전체 페이지의 개수
	int pageCount = 0;
							//페이지로우갯수 7고정      48부터   70까지는 넘어온 데이터 받는 블럭
	if(request.getParameter("pageSize") != null){
		pageSize = Integer.parseInt(request.getParameter("pageSize"));//
		logger.info("한페이지에 보여질 게시물 수 pageSize : " + pageSize);
	}
					//밑에 보이는 넘어가는 페이지 5개 고정
			
	if(request.getParameter("groupSize") != null){
		groupSize = Integer.parseInt(request.getParameter("groupSize"));
		logger.info("밑에 보여지는 목록 groupSize : " + groupSize);
		
	}
				//현재 페이지 6
	if(request.getParameter("curPage") != null){
		curPage = Integer.parseInt(request.getParameter("curPage"));
		logger.info("현재 페이지 curPage : " + curPage);
	}
				//전체 페이지 수
	if(request.getParameter("totalCount") != null){
		totalCount = Integer.parseInt(request.getParameter("totalCount"));
		logger.info("전체 글갯수 totalCount : " + totalCount);
	}
	
	//전체게시물수와 페이지크기를 가지고 전체 페이지 개수를 계산함.
	//소수점에 따라 계산상의 오류가 없도록 한것    나누기 / 한것 totalCount 200 pagesize 7
	
						//200 나누기 한번에 보여줄 로우의 갯수
	pageCount = (int)Math.ceil(totalCount / (pageSize + 0.0));
	logger.info("전체 페이지 갯수 pageCount : " + pageCount);
							// 29
	//현재그룹 설정
	//ex 6-1/5			//  1  /    밑에 고정으로 보이는 페이지수 5개
	int curGroup = (curPage-1) / groupSize;
	logger.info("curGroup : " + curGroup);
					//1
	//0*0             0 * 5
	int linkPage = curGroup * groupSize;
	logger.info("linkPage : " + linkPage);
					// 5
%>

	<p align="right">
	
<%

	if(curGroup > 0){

	//boardSelectList.jsp&curPage=1
	//boardSelectList.jsp&curPage=0		
%>	
	<!-- 쿼리스트링 날릴려고 작성한 곳 -->
	<div align="center">
	<ul id="block">
			<li class="link">
				<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>" class="hi">&lt;</a>
			</li>
<%		
	}else{
%>	
 	<div align="center">
	<ul id="block">
			<li class="link">
				<span class="hi">&lt;</span>
			</li>
<%
	} 
	//다음 링크를 위해 증가시킴
	linkPage++;
	logger.info("증가된 linkPage : " + linkPage);
			//groupSize 5 그래서 5
	int loopCount = groupSize;
	logger.info("loopCount : " + loopCount);
	
	//그룹범위내에서 페이지 링크만듬
	//5>0 && 1<=40
	while((loopCount > 0) && (linkPage <= pageCount)){
				//5            6  <=29
		//6 == 6
	if(linkPage == curPage){
		logger.info("그룹범위내에서 페이지 링크if");

%>	
	<li class="link">
				<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>" class="hello"><%=linkPage%></a>
			</li>
<% 	
	}else{
		logger.info("그룹범위내에서 페이지 링크 else");
		logger.info("linkPage 값 증가 : " + linkPage);
%>
	<li class="link">
				<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>" class="hi"><%=linkPage%></a>
			</li>
	

<% 	
	}
	
	linkPage++;
	loopCount--;
	}
	
	//다음그룹이 있는 경우
	//  6  40
	//중간의 경우 
	if(linkPage <= pageCount) {
		logger.info("다음그룹이 있는경우 linkPage : " + linkPage);
		logger.info("다음그룹이 있는 경우 pageCount : " + pageCount);
		
		//boardSelectList.jsp?&curPage=6
		//boardSelectList.jsp?&curPage=40		
%>	
	<li class="link">
			<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>" class="hi">&gt;</a>
		</li>
		</ul>
		</div>
<% 	
	//마지막 페이지의 경우
	}else{
		logger.info("다음그룹이 있는경우 linkPage : " + linkPage);
		logger.info("다음그룹이 있는경우 pageCount : " + pageCount);
		logger.info("다음그룹이 있는경우 _else");
%>	
	<li class="link">
			<span class="hi">&gt;</span>
		</li>
		</ul>
		</div> 
<% 
	}
	
%>
</p>



