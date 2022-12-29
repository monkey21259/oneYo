<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="main.ict.common.CodeUtils" %>
<%@ page import="main.ict.warning.vo.WarningVO" %>
<%@ page import="main.ict.recipe.vo.RecipeVO" %>

<%
	request.setCharacterEncoding("UTF-8");
 
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("adminWarningSelectAll 진입 >>> : "); 
%>
<%
	//	model.addAttribute("list", list);
	Object obj = request.getAttribute("list");
			if(obj == null){return; }
			List<WarningVO> list = (List<WarningVO>)obj;	
			
			int nCnt = list.size();
			
			WarningVO wvo = null;
			RecipeVO rvo = null;
			
// 			if(nCnt == 1){
// 				wvo = list.get(0);
// 				rvo = list.get(0);
		//	}
			
			
			

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>신고</title>
		<style type="text/css">
			@font-face{
				src:url(/jshSpring/font/EF_Diary.ttf);
				font-family: "EF_Diary";
			}
		
			body{
		   background-color:#e6e6e6;
		   color: #0c186d;
		   font-family:EF_Diary;
		   }
		   #hi{
		   	  border:20px solid white;
		      border-radius: 20px;
		      background-color:white;
		      box-shadow: 2px 2px 10px black;
		      width:900px;
		  
		 }
		 
		 #rbwritediv{
		 		border-radius: 20px;
		 		background-color:white;
		 		font-family:EF_Diary;		 
		 		color: #0c186d;
				margin: 0 auto; 		
				border:10px solid white;
				box-shadow: 2px 2px 10px black;
				width:900px;
			}	
			
			 .btns{
		      border: 2px solid #0c186d;
		      border-radius: 5px;
		      background-color: white;
		      color: #0c186d;
		      font-weight: bold;
		      padding:0px 10px;
		   }
		</style>
	</head>
	<body>
	<br>
		<h1 align="center">신고</h1>
		
		<form name="levelupForm" id="levelupForm">
			<table id="hi" align="center">
				<tr>
					<td>신고분야</td>
					<td colspan="4" style="text-align:left; width:400;">
						<font size="4" style="color:black"><%= wvo.getWcategory() %></font>
					</td>
					<td class="td_2"> 작성일자 :<%= wvo.getInsertdate() %>
					</td>
					</tr>
					<tr>
						<td>작성자</td>
<%-- 						<td><%= wvo.get %></td> --%>
						<td>신고자</td>
						<td><%= wvo.getMnick()%></td>
					</tr>
					<tr>
						<td>
						<span name="wcontent" id="wcontent" rows="5" cols="100"><%= wvo.getWcontent() %></span>
						</td>
					</tr>		
				<tr>
					<td colspan="6" align="center">
					<br><br>
					<button type="button" class="btns" id="warningBtn">경고</button>
					<button type="button" class="btns" id="deleteBtn">삭제</button>
					</td>				
				</tr>
			</table>
		</form>
	</body>
</html>