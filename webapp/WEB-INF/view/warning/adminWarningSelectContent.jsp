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
	String wcategory = (String)request.getAttribute("wcategory");
	String wtnum = (String)request.getAttribute("wtnum");
	String mnick = (String)request.getAttribute("mnick");
	String wcontent = (String)request.getAttribute("wcontent");
	String insertdate = (String)request.getAttribute("insertdate");

// 	model.addAttribute("list", list);
// 	model.addAttribute("wcategory", wcategory);
// 	model.addAttribute("wtnum", wtnum);
// 	model.addAttribute("mnick", mnick);
// 	model.addAttribute("wcontent", wcontent);
// 	model.addAttribute("insertdate", insertdate);

%>
<%
	//	model.addAttribute("list", list);
	Object obj = request.getAttribute("list");
			if(obj == null){return; }
			List<WarningVO> list = (List<WarningVO>)obj;	
			
			int nCnt = list.size();
			
			WarningVO wvo = null;
			
			wvo = list.get(0);
			
			
			
			

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
						<font size="4" style="color:black"><%= CodeUtils.getWcategory(wcategory) %></font>
					</td>
					<td class="td_2"> 작성일자 :<%= insertdate %>
					</td>
					</tr>
					<tr>
						<input type="hidden" name="mnum" value="<%=wvo.getWtmnum()%>">
						<td>신고당한 사람</td>
						<td><%= wvo.getWtmnick() %></td> 
						<td>신고자</td>
						<td><%= mnick%></td>
					</tr>
					<tr>
						<td>
						<span name="wcontent" id="wcontent" rows="5" cols="100"><%= wcontent %></span>
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