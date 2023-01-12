<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.apache.log4j.LogManager" %>

<%@ page import="java.util.List" %>

<%@ page import="main.ict.recipe.vo.RecipeVO" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.common.O_Session" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("[recipeSelectContent.jsp] .jsp 진입");
%>
<%
	//세션부여
	O_Session mSession = O_Session.getInstance();
	String mnum = mSession.getSession(request);
	String mid = (String)mSession.getAttribute(request, "mid");
	String mnick = (String)mSession.getAttribute(request, "mnick");
	
	logger.info("mnum >>> : " + mnum);
	logger.info("mid: " + mid);
%>
<%
	Object recipeObj = request.getAttribute("recipeList");
	if (recipeObj == null) {
		logger.info("[FAIL] getAttribute -> recipeObj is null");
	}
	
	List<RecipeVO> recipeList = (List<RecipeVO>)recipeObj;
	logger.info("recipeList: " + recipeList);
	if (recipeList.size() != 1) {
		logger.info("[FAIL] recipeList.size() != 1");
	}
	logger.info(recipeList.toString());
	
	RecipeVO recipevo = recipeList.get(0);
	logger.info(" recipevo.getMnum()>>>:" + recipevo.getMnum());
%>
<!DOCTYPE html>
<html lang='ko'>
	<head>
		<meta charset="UTF-8">
		<title>recipeSelectContent.jsp</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0
							maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<!-- jQuery -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- recipeSelectContent.jsp 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/recipe/recipeSelectContent.css">
<!-- 검색바 넣었다 다시 생기게하는 스크립트 (외부파일) -->
		<script type="text/javascript" src="/oneYo/resource/js/all.js" charset="UTF-8"></script>
<!-- 칸 나눈 css -->
		<link rel="stylesheet" href="/oneYo/resource/css/all.css">
<!-- 댓글 기능 전용 -->
		<link rel="stylesheet" href="/oneYo/resource/css/common/commentForm.css">
<!-- vue cdn -->
		<script type="text/javascript" src="https://unpkg.com/vue@2.3.3"></script>
<!-- 페이지 로드시 회원,게시판 카운트 ajax로 처리하는 파일 -->
		<script type="text/javascript" src="/oneYo/resource/js/common/common_count.js"></script>
		<script type="text/javascript">
			
			console.log("[recipeSelectContent.jsp] JS");
			$(document).ready(function() {
				
				console.log("[recipeSelectContent.jsp] jQuery");
				
				// UpdateForm, Delete
				$("#recipeUpdateFormBtn").on("click", function() {
					
					console.log("[Click] UpdateForm Button");
					$("#recipeSelectForm").attr({
						"action": "/oneYo/recipeUpdateForm.ict",
						"method": "POST",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				$("#recipeDeleteBtn").on("click", function() {
					
					console.log("[Click] Delete Button");
					$("#recipeSelectForm").attr({
						"action": "/oneYo/recipeDelete.ict",
						"method": "POST",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				$("#warningBtn").click(function(){
					
					$("#recipeSelectForm").attr({
						"action": "recipeWarningForm.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
					
				});
				
				//경고 : 관리자
				$(document).on("click", "#cautionBtn", function(){
					
					//mid
					let mnum = $("#mnum").val();
					console.log("mnum(신고당한사람 회원번호) >>> : " + mnum);
					
					//mnick
					let mnick = $("#mnick").val();
					console.log("mnick(신고당한사람 닉네임) >>> : " + mnick);
					
					let result = confirm(mnick + '님을 경고 하시겠습니까?');
					
					if(result == true){
						let url = "adminCaution.ict";
						let reqType = "GET";
						let dataParam = {
								mnum :$("#mnum").val(),
							};
					
					console.log("url : " + url);
					console.log("reqType : " + reqType);
					console.log("dataParam : " + dataParam);
					
					$.ajax({
						url:url,
						type:reqType,
						data:dataParam,
						success:whenSuccess,
						error:whenError
					}); //ajax
					
					}else{
						alert("취소되었습니다");
						location.href="#";
					} //if else
					
					//성공했을때
					function whenSuccess(resData){
						if(resData == 'updateOK'){
							alert("경고 처리 되었습니다.");
							$('#cautionBtn').prop('disabled', true);
						} 
					}
					
					//실패했을때
					function whenError(e){
						console("경고 처리 되지 않았습니다(error) : "  + e.responseText);
					} //whenError	
				
				});//cautionBtn버튼클릭
				
				//로그아웃
				$("#logoutBtn").on("click", function() {
					$("#logoutForm").attr({
						"action": "logout.ict",
						"method": "GET",
						"enctype": "application/x-www-form-urlencoded"
					}).submit();
				});
				
				//	all.js 함수 전부 불러오기
				allJavaScript();
			}); 
		
		</script>
		<style type="text/css">
		
			.recipeTable tr, .recipeTable td {
				border: 1px solid black;			
			}
		
		</style>

	</head>
	<body>
<!-- Section -->
		<section>
			<div id="realAll">
<div id="backMenu"></div>
	<input type="checkbox" id="sideMenu" name="sideMenu" hidden>
	<label for="sideMenu" id="sideLabel">&lt;&lt;&nbsp;&nbsp;&nbsp;</label>
	<div class="sidebar">
		<ul>
			<li class="item">
				<div class="homeLink">
				<span>
				홈으로
				</span>
				</div>
			</li>
			<li class="item">
				<div class="searchBarBtn">
				<span>
				검색
				</span>
				</div>
			</li>
	<!-- 		<li class="item"> -->
	<!-- 			<div id="warningForm"> -->
	<!-- 			<span> -->
	<!-- 			신고 -->
	<!-- 			</span> -->
	<!-- 			</div> -->
	<!-- 		</li> -->
			<li class="item">
				<div class="warningForm">
				<span>
				신고<br>팝업
				</span>
				</div>
			</li>
			
			<li class="item">
		<%
			if(mid == null || !mid.equals("admin")){
		%>
				<div class="mypageHome">
				<span>
				마이<br>페이지 
				</span>
				</div>
				<%
			} else if(mid.equals("admin")){
				%>
				<div class="adminHome">
				<span>
				관리자<br>페이지 
				</span>
				</div>
				<%
			}
			%>
			</li>
	
			<li class="item">
				<a href="javascript:window.scrollTo(0,0);">
				<div id="go_top">
				<span>
				TOP▲
				</span>
				</div>
				</a>
			</li>
		</ul>
	</div>

<div id="searchBar" class="hidden_X">
<!-- <div id="searchBar" class="hidden_O"> -->
	<div class="searchBarBtn">
		X
	</div>
	<div>
		<jsp:include page="/WEB-INF/view/recipe/recipePage.jsp" flush="true">
				<jsp:param value="" name=""/>
		</jsp:include>	
	</div>
</div>

<div id="singo" class="hidden_X">
	<div class="warningForm">
		X
	</div>
	<jsp:include page="/WEB-INF/view/warning/warningPage.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>	
</div>

<div id="shadow" class="hidden_X"></div>

<div id="all_div">

<div id="header">
	<div id="logoLeft" class="logoSide">
<!-- 	로고 옆공간 좌측 -->
	</div>
	<div id="logo" class="homeLink">
		<img alt="오내요" src="/oneYo/resource/img/oneYo_logo.png">
		<!-- 379 X 186 -->
	</div>
	<div id="logoRight" class="logoSide">
<!-- 	로고 옆공간 우측 -->
	 	<div id="loginDiv">
<%
		if (mid == null || mid.equals("")) {
%>
			<div class="loginBtnDiv">
				<span class="Choonsik" id="newMemBtn">회원가입</span>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="loginBtn">로그인</span>
	 		</div>
<%
		} else {
%>
			<div class="loginBtnDiv">
<%
			if(mid.equals("admin")){
%>
				<span class="Choonsik adminHome">관리자페이지</span>
<%
			}else{
%>
				<span class="Choonsik mypageHome">마이페이지</span>
<%
			}
%>
				<span class="Choonsik">|</span>
		 		<span class="Choonsik" id="logoutBtn">로그아웃</span>
<%
			String mSNSid = mid;  // M22...
			if (mid != null && !(mid.equals(""))) {
				if (mid.length() > 5) {
					String checkSNS = mid.substring(0, 6);
					if (checkSNS.equals("naver_")) {
						mSNSid = "naver"; 
					}
					if (checkSNS.equals("kakao_")) {
						mSNSid = "kakao";
					}
				}
			}
%>
				<p><%= mSNSid %> <span>님 환영합니다.</span></p>
	 		</div>
	 		<p></p>
	 		
<% 		
		}
%>
	 	</div>
	</div>
	
	<div class="nav">
	<!-- 상단 메뉴바 -->
		<nav>
		<ul>
			<li>
				<div class="menu">
					<a href="recipeSelectAll.ict" class="menu_link">
						<div>
							레시피
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="tipSelectAll.ict" class="menu_link">
						<div>
							Tip
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="communitySelectAll.ict" class="menu_link">
						<div>
							커뮤니티
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="menu">
					<a href="noticeSelectAll.ict" class="menu_link">
						<div>
							공지사항
						</div>
					</a>
				</div>
			</li>
			<li>
				<div class="pulsMenu">
					<div class="menu">
						<a href="#" class="menu_link">
							<div>
								더보기
							</div>
						</a>
					</div>
					<div class="sub-menu">
					<ul>
						<li>
							<a href="entertainment.ict" class="menu_link">
							<div>
							엔터테이먼트
							</div>
							</a>
						</li>
						<li>
							<a href="chart.ict" class="menu_link">
							<div>
							차트
							</div>
							</a>
						</li>
						<li>
							<a href="goCalendar.ict" class="menu_link">
							<div>
							일정 관리
							</div>
							</a>
						</li>
					</ul>
					</div>
				</div>
			</li>
		</ul>
		</nav>
	</div>
	
</div>

<div id="center">
<!-- -------------------------------페이지 전용 center------------------------------- -->
<!-- 			<div class="recipeSectionHeader"> -->
<!-- 				<span class="t">레시피(Recipe) 글보기</span> -->
<!-- 			</div> -->
			<form id="recipeSelectForm">
				<input id="tnum" name="tnum" type="hidden" value="<%= recipevo.getRnum() %>">
				<input id="tsubject" name="tsubject" type="hidden" value="<%= recipevo.getRsubject() %>">
				<div id="viewTable">
				<table id="selectContent">
					<!-- 좋아요 -->
					<tr>
						<td colspan="2">
							<%
								Object likeObj = request.getAttribute("likeList");
								String likeyn = "Y";
								if(likeObj == null) likeyn = "N";
							%>
							<jsp:include page="/WEB-INF/view/like/likeForm.jsp" flush="true">
								<jsp:param name="mnum" value="<%=mnum %>"/>
								<jsp:param name="likethis" value="<%=recipevo.getRnum() %>"/>
								<jsp:param name="likeyn" value="<%=likeyn %>"/>
							</jsp:include>
						</td>
					</tr>
					<!-- 수정삭제경고신고 -->
					<tr>
						<td colspan="3" style="text-align:right;">
					<% 
						if(mnum.equals(recipevo.getMnum())){
					%>
							<span class="btn" id="recipeUpdateFormBtn">수정</span>
							<span class="btn" id="recipeDeleteBtn">삭제</span>
					<%
						} else if (!mnum.equals(recipevo.getMnum()) && mnum.equals("M000000000000")) {
					%>
							<span class="btn" id="cautionBtn">경고</span>
					<%
						} else if (mnum.length() > 0) {
					%>
							<span class="btn" id="warningBtn">신고</span>
					<%
						}
					%>
						</td>
					</tr>
					<!-- 글 이미지 + 카테고리 -->
					<tr>
						<td rowspan="3">
							<div class="imgSelect">
								<img src="/oneYo/img/recipe/<%= recipevo.getRphoto() %>" id="recipeImg" name="recipeImg"/>
								<input type="hidden" id="rphoto" name="rphoto" value="<%= recipevo.getRphoto() %>"/>
							</div>
						</td>
						<td id="recipe" class="selectTd cateTd">
							<span>레시피</span>
						</td>
<!-- 						<td rowspan="3"> -->
<!-- 							<div id="imgWriter" class="imgWriter"> -->
<%-- 								<img src="/oneYo/img/mem/<%=recipevo.getMprofile() %>" onerror="/oneYo/img/recipe/noimg.png" width="85" height="85"/> --%>
<!-- 							</div> -->
<!-- 						</td> -->
					</tr>
					<!-- 글 제목 + 글 작성자 -->
					<tr class="subjectTr"> <%  // 글 제목 %>
						<td class="selectTd subjectTd">
							<p><%= recipevo.getRsubject() %></p>
							<div id="hrDiv"></div>
							<div class="writerDiv">
								<%=recipevo.getMnick() %>
							</div>
						</td>
					</tr>
					<!-- 글 내용 (분야 시간 인원 난이도 재료) -->
					<tr> <%  // 요리 분야 %>
						<td class="selectTd infoTd">
<!-- 						<td class="selectTd" colspan="2"> -->
						<!-- 요리분야 -->
							<div class="oneTd">
								<table>
									<tr>
										<td class="nameTd">
										요리분야
										</td>
									</tr>
									<tr>
										<td class="valTd">
											<%= CodeUtils.getRcategory(recipevo.getRcategory()) %>
										</td>
									</tr>
								</table>
							</div>
							<!-- 조리시간 -->
							<div class="oneTd">
								<table>
									<tr>
										<td class="nameTd">
										조리시간
										</td>
									</tr>
									<tr>
										<td class="valTd">
											<%= recipevo.getRtime() %>
										</td>
									</tr>
								</table>
							</div>
							<!-- 인분 -->
							<div class="oneTd">
								<table>
									<tr>
										<td class="nameTd">
										식사인원
										</td>
									</tr>
									<tr>
										<td class="valTd">
											<%= CodeUtils.getRperson(recipevo.getRperson()) %>
										</td>
									</tr>
								</table>
							</div>
							<!-- 난이도 -->
							<div class="oneTd">
								<table>
									<tr>
										<td class="nameTd">
										난이도
										</td>
									</tr>
									<tr>
										<td class="valTd">
											<%= CodeUtils.getRdiff(recipevo.getRdiff()) %>
										</td>
									</tr>
								</table>
							</div>
							<!-- 재료 -->
							<div class="twoTd">
								<table>
									<tr>
										<td class="nameTd">
											재료
										</td>
									</tr>
									<tr>
										<td class="valTd">
											<%= recipevo.getRjeryo() %>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<!-- 본문 -->
					<tr>
						<td colspan="3">
							<div class="neyong">
								<!-- <%= recipevo.getRcontent() %> -->
								<table>
									<%
										String s = recipevo.getRcontent();
										String[] ss = s.split("#");
										for(int i=1; i<ss.length; i++){
									%>
									<tr>
										<td colspan="3"><br></td>
									</tr>
									<tr>
										<td style="width: 50px; height: 50px; text-align: center; vertical-align:middle;">
											<img src="/oneYo/img/numbering/number<%=i %>.png" width="45" height="45">
										</td>
										<td>&nbsp;&nbsp;</td>
										<td style="text-align: left; vertical-align:middle;">
											<%=ss[i] %>
										</td>
									</tr>
									
									<%
										}
									%>
								</table>
							</div>
						</td>
					</tr>
					
				</table>
				</div>
				<input type="hidden" id="rnum" name="rnum" value="<%= recipevo.getRnum() %>" />
				<input type="hidden" id="mnum" name="mnum" value="<%= recipevo.getMnum() %>" />
				<input type="hidden" id="mnick" name="mnick" value="<%=recipevo.getMnick() %>"/>
	<!-- 데이터 사용여부 검토 필요 -->
				<input type="hidden" id="rhit" name="rhit" value="<%= recipevo.getRhit() %>" />	<!-- 조회수 -->
				<!-- <input type="hidden" id="warning" name="warning" value="" /> -->	<!-- 경고 -->
				<!-- deleteyn 삭제 -->
				<!-- <input type="hidden" id="insertdate" name="insertdate" value="<%= recipevo.getInsertdate() %>" /> -->	<!-- 일간/주간/월간 -->
				<input type="hidden" id="updatedate" name="updatedate" value="<%= recipevo.getUpdatedate() %>" />	<!-- 작성(수정) 시간 -->
				
				</form>
				
				<jsp:include page="/WEB-INF/view/comment/commentForm.jsp" flush="true">
					<jsp:param name="cotnum" value="<%=recipevo.getRnum() %>"/>
					<jsp:param name="clientMnick" value="<%=mnick %>"/>
				</jsp:include>
				
	<!-- -------------------------------페이지 전용 center 위가 편집 후 아래가 편집 전 ------------------------------- -->			
				
				<%-- <table class="recipeTable">
					<tr>
						<td colspan="2" style="text-align:center;">
							<span>레시피 글쓰기</span>
						</td>
					</tr>
					<tr> <%  // 글 제목 %>
						<td>글 제목</td>
						<td>
							<input type="text" id="rsubject" name="rsubject"
								   value="<%= recipevo.getRsubject() %>" readonly />
						</td>
					</tr>
					<tr> <%  // 요리 분야 %>
						<td>요리 분야</td>
						<td>
							<input type="text" id="rcategory" name="rcategory"
								   value="<%= CodeUtils.getRcategory(recipevo.getRcategory()) %>" readonly />
						</td>
					</tr>
					<tr> <%  // 음식 재료 %>
						<td id="rjeryo">재료</td>
						<td>
							<!-- input_text => 값을 담는 방식과 재료 종류를 설정해야함. -->
							<input type="text" id="rjeryo" name="rjeryo"
								   value="<%= recipevo.getRjeryo() %>" readonly />
						</td>
					</tr>
					<tr> <%  // 조리 시간 %>
						<td>시간</td>
						<td>
							<input type="text" id="rtime" name="rtime" 
								   value="<%= recipevo.getRtime() %>" readonly />
						</td>
					</tr>
					<tr> <%  // 인분 %>
						<td>인분</td>
						<td>
							<input type="text" id="rperson" name="rperson" 
								   value="<%= CodeUtils.getRperson(recipevo.getRperson()) %>" readonly />
						</td>
					</tr>
					<tr> <%  // 난이도: 쉬움(0), 보통(1), 어려움(2) %>
						<td>난이도</td>
						<td>
							<input type="text" id="rdiff" name="rdiff"
								   value="<%= CodeUtils.getRdiff(recipevo.getRdiff()) %>" readonly />
						</td>
					</tr>
<%  // 글 내용 %>
					<tr>
						<td>글 내용</td>
						<td>
							<textarea id="rcontent" name="rcontent" cols="10" rows="5" readonly><%= recipevo.getRcontent() %></textarea><br />
<%  // 음식 사진 %>
							<img src="/oneYo/img/recipe/<%= recipevo.getRphoto() %>" id="recipeImg" name="recipeImg"  />
							<input type="hidden" id="rphoto" name="rphoto" value="<%= recipevo.getRphoto() %>" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<%
// 								Object likeObj = request.getAttribute("likeList");
// 								String likeyn = "Y";
// 								if(likeObj == null) likeyn = "N";
							%>
							<jsp:include page="/WEB-INF/view/like/likeForm.jsp" flush="true">
								<jsp:param name="mnum" value="<%=mnum %>"/>
								<jsp:param name="likethis" value="<%=recipevo.getRnum() %>"/>
								<jsp:param name="likeyn" value="<%=likeyn %>"/>
							</jsp:include>
						</td>
					</tr>
<%  // 글쓰기 버튼 %>
					<tr>
						<td colspan="2" style="text-align:right;">
							<input type="button" id="warningBtn" value="신고">
							<% 
							if(mnum.equals(recipevo.getMnum())){
							%>
							
							<a class="btn" id="recipeUpdateFormBtn">수정</a>
							<a class="btn" id="recipeDeleteBtn">삭제</a>
							
							<%
							}else if(mnum.equals("M000000000000")){
							%>
								<button type="button" id="cautionBtn">경고</button>
							<%
							}
							 %>
						</td>
					</tr>
				</table>
				!!! <%= recipevo.getLikecnt() %> !!! --%>
				<!-- -------------------------------페이지 전용 center 위가 편집 전 아래가 편집 후 ------------------------------- -->
<% // rnum, rhit, mnum, warning, deleteyn, insertdate, updatedate %>
				
			
				<!-- -------------------------------페이지 전용 center------------------------------- -->
</div>

<!-- common_count.js 자바스크립트 임포트하면 span태그에 값이 바인딩 됨. -->
<div id="footer">
	<div>
		<span>사이트 개발자: ICT(I am Chef, Today)</span><br />
	</div>
	<div>
		<span></span> / <span></span><br />
		<span></span> / <span></span><br />
	</div>
</div>

</div>
</div>
		</section>
		<form id="logoutForm">
	 			<input type="hidden" id="mid" name="mid" value="<%= mid %>" />
	 		</form>
	</body>
</html>