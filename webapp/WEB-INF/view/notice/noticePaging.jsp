<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Collection" %>

<%
	//*******************************************
	//전달해야 할 변수
	//str url 값 가져오기 블럭	

	String url = null;
	String str = null;
	
	url = request.getParameter("url");
	System.out.println("넘어온 url의 값 : " + url);
	
	str = request.getParameter("str");
	System.out.println("넘어온 str의 값 빈문자열 : " + str);

	if(str != null&& str.length()>0) {
		str = str + "&";
		System.out.println("str : " + str);
	}
	//*******************************************

%>

<% 
	//*******************************************
	//페이지 구성 
	//한페이지에 보여질 게시물의 수

	//한페이지에 보여질 게시물 row의 수
	int pageSize = 0;
	// 밑에 넘어갈 수 있는 페이지 이동 갯수
	int groupSize = 0;
	// 현재 페이지
	int curPage = 0;
	// 전체 페이지의 개수
	int pageCount = 0;
	//전체 게시물의 수
	int totalCount = 0;

	//include를 통해 넘어온 데이턴데 commonutil에 있는 상수값이 vo에 set되서 넘어오는거 controller를 봐라
	if(request.getParameter("pageSize") != null){
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
	}
	
	//controller에서 상수가 vo에 세팅되어 넘어온 값
		if(request.getParameter("groupSize")!=null){
			groupSize = Integer.parseInt(request.getParameter("groupSize"));
			System.out.println("controller에서 vo에 세팅되어 넘어온 groupSize : " + groupSize); 
		}

		//controller에서 상수가 vo에 세팅되어 넘어온 값
		if(request.getParameter("curPage")!=null){
			curPage = Integer.parseInt(request.getParameter("curPage"));
			System.out.println("controller에서 vo에 세팅되어 넘어온 curPage : " + curPage);
		}

		//얘는 반대로 controller에서 상수가 세팅된게아니라 db를 훑고 list에 있는 totalCount 결과값을 받아온거
		if(request.getParameter("totalCount")!=null){
			totalCount = Integer.parseInt(request.getParameter("totalCount"));
			System.out.println("db훑고 와서 list에 담긴 totalCount : " + totalCount);
		}

		//*******************************************

		//*******************************************
		//로직 짜기 현재 그룹 설정
	pageCount = (int)Math.ceil(totalCount / (groupSize + 0.0));
	System.out.println("pageCount : " + pageCount);
	
	int curGroup = (curPage-1) / groupSize;
	System.out.println("curGroup의 값 : " + curGroup);

	int linkPage = curGroup * groupSize;
	System.out.println("linkPage의 값 : " + linkPage);
				
%>
<p align="right">
<%
	//*******************************************
	//세팅하기
if(curGroup > 0){

	//KosSpringFileUploadSelectAll.jy&curpage=1
	//KosSpringFileUploadSelectAll.jy&curpage=curpage		
%>		
	<ul class="pagination pagination-sm justify-content-center">
			<li class="page-item">
				<a class="page-link" href="<%=url%>?curPage=1">First</a>
			</li>
			<li>
				<a class="page-link" href="<%=url%>?curPage=<%=linkPage%>">Previous</a>
			</li>
<% 
	}else{

%>
	<ul class="pagination pagination-sm justify-content-center">
			<li>
				<a class="page-link" href="<%=url%>?curPage=1">First</a>
			</li>
			<li>
				<a class="page-link" href="<%=url%>?curPage=1">Previous</a>
			</li>

<%
	}

	//다음 페이지를 위해 증가
	linkPage++;
	System.out.println("증가된 linkPage : " + linkPage);
	
	int loopCount = groupSize;
	System.out.println("groupSize를 대입한 loopCount : " + loopCount);

	while((loopCount > 0)&&(linkPage <= pageCount)){
		
		if(linkPage == curPage){
			System.out.println("그룹범위내에서 페이지 링크if");
			
%>
	
			<li class="page-item">
				<a class="page-link" 
				href="<%=url%>?curPage=<%=linkPage%>"><%=linkPage%></a>
			</li>
<% 
		}else{
			System.out.println("그룹이동없이 페이지 세팅");
	
%>
	<li class="page-item">
				<a class="page-link"
					href="<%=url%>?curPage=<%=linkPage%>"><%=linkPage%></a>
			</li>
<% 		
		}
		linkPage++;
		System.out.println("루프가 돌면서 linkPage가 증가하는 값 : " + linkPage);
		loopCount--;
		System.out.println("루프가 돌면서 loopCount가 감소하는 값 : " + loopCount);
	}

	if(linkPage <= pageCount){
		System.out.println("다음구릅이 있을떄 돔 : " + linkPage);	
		System.out.println("다음구릅이 있을떄 돔 : " + pageCount);

		
%>
	<li class="page-item">
			<a class="page-link" href="<%=url%>?curPage=<%=linkPage%>">Next</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="<%=url%>?curPage=<%=pageCount%>">Last</a>
		</li>
		</ul>
<% 		
	//끝 페이지일 경우
	}else{
		System.out.println("끝페이지일때 도는 로직 linkPage : " + linkPage);
		System.out.println("끝페이지일때 도는 로직 pageCount : " + pageCount);
		System.out.println("끝페이지일때 도는 로직 else가 돈다");
		
%>
 		<li class="page-item">
			<a class="page-link" href="<%=url%>?curPage=<%=pageCount%>">Next</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="<%=url%>?curPage=<%=pageCount%>">Last</a>
		</li>
		</ul>
		<div id="btndiv" align="right">
			전체 <%=pageCount%>페이지 중 <%=curPage%>페이지<br>
		</div>
<%
	}
%>

</p>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

</body>
</html>