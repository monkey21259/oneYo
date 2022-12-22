<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="java.util.Collection" %>    
<%@ page import="org.apache.log4j.LogManager" %>    
<%@ page import="org.apache.log4j.Logger" %>
<%

Logger logger = LogManager.getLogger(this.getClass());
//====================
//전달해야할 변수
//====================
String url = null;
String str = null;


url = request.getParameter("url");
logger.info("url >>> : " + url);

str = request.getParameter("str");
logger.info("str >>> : " + str);

// str에 데이터가 없어서 if문 실행하지 않음
if(str !=null && str.length() > 0){
	str = str + "&";
	logger.info("str + & >>> : " + str);

}
%>

<%
//===========================
//페이지 네비게이션 관련 변수 
//===========================


//한페이지에 보여질 게시물의 수
int pageSize = 0;
//한페이지당보이는 페이지 수 (그룹)
int groupSize = 0;
//전체 게시글수 
int totalCount = 0;
//현재페이지
int curPage = 0;
//현제페이지 게시글 수
int pageCount = 0;

if(request.getParameter("pageSize") != null){
	pageSize = Integer.parseInt(request.getParameter("pageSize"));
}
	logger.info("pageSize >>> : " + pageSize);

if(request.getParameter("groupSize") != null){
	groupSize = Integer.parseInt(request.getParameter("groupSize"));
}

logger.info("groupSize >>> : " + pageSize);

if(request.getParameter("curPage") != null){
	curPage = Integer.parseInt(request.getParameter("curPage"));
	
}
logger.info("curPage >>> : " + curPage);

if(request.getParameter("totalCount") != null){
	totalCount = Integer.parseInt(request.getParameter("totalCount"));
}
logger.info("pageSize >>> : " + pageSize);

logger.info("totalCount >>> : " + totalCount);
//전체 게시물수 / 그룹의 크기 = 전체페이지 수
//소수점에 따라 계산성의 오류가 없도록 한거

pageCount = (int)Math.ceil(totalCount / (groupSize + 0.0));
logger.info("pageCount >>> : " + pageCount);


int curGroup = (curPage - 1) / groupSize;
logger.info("curGroup >>> : " + curGroup);

//0*0
int linkPage = curGroup * groupSize;
logger.info("linkPage >>> : " + linkPage);

%>    
<p align="right">
<%
//첫번째그룹이 아닌경우
if(curGroup > 0){

%>
	<a href="<%=url%>?<%=str%>curPage=1">◁◁</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>">◀</a>&nbsp;&nbsp;&nbsp;
	
<%  
} else {
%>
	◁◁&nbsp;&nbsp;&nbsp;◀&nbsp;&nbsp;&nbsp;
<%
}

//다음링크를 위해 증가
	linkPage++;
	logger.info("linkPage >>> : + " + linkPage);

	int loopCount = groupSize;
	logger.info("loopCount >>> : " + loopCount);
	
	//그룹범위내에서 페이지 링크 만듦
	while((loopCount > 0) && (linkPage <= pageCount)){
		if(linkPage == curPage){
			logger.info("그룹범위내에서 페이지 링크 if");
			//linkPage : 1
%>

<%=linkPage %>

<%
	} else{
		logger.info("그룹범위내에서 페이지 링크 else");
%>
	[<a href="<%=url %>?<%=str %>curPage=<%=linkPage %>"><%=linkPage %></a>]&nbsp;
<%
	}
	linkPage++;
	loopCount--;
}

//다음그룹이 있는 경우
if(linkPage <= pageCount){
	logger.info("다른 그룹이 있는 경우 linkPage" + linkPage);
	logger.info("다른 그룹이 있는 경우 pageCount" + pageCount);
%>
	<a href="<%=url %>?<%=str %>curPage=<%=linkPage %>">▶</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url %>?<%=str %>curPage=<%=pageCount %>">▷▷</a>&nbsp;&nbsp;&nbsp;

<%	
} else {
	logger.info("다음그룹이 있는 경우 linkPage >>> : " + linkPage);
	logger.info("다음그룹이 있는 경우 pageCount >>> : " + pageCount);
	logger.info("다음그룹이 있는 경우_else");
%>	
	▶&nbsp;&nbsp;&nbsp;▷▷&nbsp;&nbsp;&nbsp;
<%	
}
%>