package main.ict.entertainment.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.ict.common.CodeUtils;

@Controller
public class EntertainmentController {
	Logger logger = LogManager.getLogger(EntertainmentController.class);
	
	@GetMapping(value="entertainment")
	public String entertainment() {
		logger.info("cont 진입");
		
		return "entertainment/entertainment";
	}
	
	@GetMapping(value="chart")
	public String chart() {
		logger.info("chart() 함수 진입");
		return "entertainment/chart";
	}
	
	@GetMapping(value="pieChartData", produces="text/json; charset=UTF-8")
	@ResponseBody
	public String pieChartData() {
		logger.info("piChartData() 함수 진입");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		JSONObject col1 = null;
		JSONObject col2 = null;
		JSONObject category = null;
		JSONObject totalCount = null;
		JSONObject jsonData = null;
		JSONArray body = null;
		JSONArray jsonArrayTitle = null;
		String sql = null;
		StringBuffer sb = null;
		
		col1 = new JSONObject();
		col2 = new JSONObject();
		jsonArrayTitle = new JSONArray();
		
		col1.put("label", "Category");
		col1.put("type", "string");
		col2.put("label", "TotalCount");
		col2.put("type", "number");
		jsonArrayTitle.add(col1);
		jsonArrayTitle.add(col2);
		
		jsonData = new JSONObject();
		jsonData.put("cols", jsonArrayTitle);
		logger.info("컬럼 : " + jsonData);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost/ict", "root", "admin1234");
			logger.info("conn : " + conn);
			
			sb = new StringBuffer();
			sb.append("select rcategory 			category");
			sb.append("		 ,count(rcategory) 	    cnt		");
			sb.append("from   (select rnum					");
			sb.append("				 ,rcategory				");
			sb.append("				 ,deleteyn				");
			sb.append("		   from   ict_recipe)	a		");
			sb.append("where   deleteyn = 'Y'				");
			sb.append("group by a.RCATEGORY					");
			
			sql = sb.toString();
//			sql = "select 	rcategory				 category\r\n" + 
//					"	   ,count(rcategory)		 cnt\r\n" + 
//					"from	(select rnum, rcategory, deleteyn\r\n" + 
//					"		 from 	ict_recipe)	as   a\r\n" + 
//					"where   deleteyn = 'Y'\r\n" + 
//					"group by a.RCATEGORY";
			
			pstmt = conn.prepareStatement(sql);
			
			logger.info(pstmt);
			
			rsRs = pstmt.executeQuery();
			
			logger.info(rsRs);
			
			if(rsRs !=null) {
				body = new JSONArray();
			}
			
			while (rsRs.next()) {
				logger.info("카테고리 : " + rsRs.getString(1));
				logger.info("카운트 : " + rsRs.getString(2));
				category = new JSONObject();
				totalCount = new JSONObject();
				category.put("v", CodeUtils.getRcategory(rsRs.getString(1)));
				totalCount.put("v", Integer.parseInt(rsRs.getString(2)));
				
				JSONArray row = new JSONArray();
				row.add(category);
				row.add(totalCount);
				
				JSONObject c = new JSONObject();
				c.put("c", row);
				
				body.add(c);
				
			}
			jsonData.put("rows", body);
			
			rsRs.close();
			pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.info("예외 처리 발생 : " + e.getMessage());
		}
		
		return jsonData.toJSONString();
	}
	
	@GetMapping(value="barChartData", produces="text/json; charset=UTF-8")
	@ResponseBody
	public String barChartData() {
		logger.info("piChartData() 함수 진입");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		JSONObject col1 = null;
		JSONObject col2 = null;
		JSONObject col3 = null;
		JSONObject category = null;
		JSONObject totalCount = null;
		JSONObject hitAverage = null;
		JSONObject jsonData = null;
		JSONArray body = null;
		JSONArray jsonArrayTitle = null;
		String sql = null;
		StringBuffer sb = null;
		
		col1 = new JSONObject();
		col2 = new JSONObject();
		col3 = new JSONObject();
		jsonArrayTitle = new JSONArray();
		
		col1.put("label", "카테고리");
		col1.put("type", "string");
		col2.put("label", "총 조회수");
		col2.put("type", "number");
		col3.put("label", "평균 조회수");
		col3.put("type", "number");
		
		jsonArrayTitle.add(col1);
		jsonArrayTitle.add(col2);
		jsonArrayTitle.add(col3);
		
		jsonData = new JSONObject();
		jsonData.put("cols", jsonArrayTitle);
		logger.info("컬럼 : " + jsonData);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost/ict", "root", "admin1234");
			logger.info("conn : " + conn);
			
			sb = new StringBuffer();
			sb.append("select  rcategory			category		");
			sb.append("	   	  ,sum(rhit)			rhit			");
			sb.append("		  ,round(sum(rhit) / count(rcategory), 0)");
			sb.append("from   (select rcategory						");
			sb.append("				 ,rhit							");
			sb.append("				 ,deleteyn						");
			sb.append("		   from   ict_recipe)	a				");
			sb.append("where   deleteyn = 'Y'						");
			sb.append("group by a.RCATEGORY							");
			
			sql = sb.toString();
//			sql = "select 	rcategory				 category\r\n" + 
//					"	   ,count(rcategory)		 cnt\r\n" + 
//					"from	(select rnum, rcategory, deleteyn\r\n" + 
//					"		 from 	ict_recipe)	as   a\r\n" + 
//					"where   deleteyn = 'Y'\r\n" + 
//					"group by a.RCATEGORY";
			
			pstmt = conn.prepareStatement(sql);
			
			logger.info(pstmt);
			
			rsRs = pstmt.executeQuery();
			
			logger.info(rsRs);
			
			if(rsRs !=null) {
				body = new JSONArray();
			}
			
			while (rsRs.next()) {
				logger.info("카테고리 : " + rsRs.getString(1));
				logger.info("카운트 : " + rsRs.getString(2));
				category = new JSONObject();
				totalCount = new JSONObject();
				hitAverage = new JSONObject();
				
				category.put("v", CodeUtils.getRcategory(rsRs.getString(1)));
				totalCount.put("v", Integer.parseInt(rsRs.getString(2)));
				hitAverage.put("v", Integer.parseInt(rsRs.getString(3)));
				
				JSONArray row = new JSONArray();
				row.add(category);
				row.add(totalCount);
				row.add(hitAverage);
				
				JSONObject c = new JSONObject();
				c.put("c", row);
				
				body.add(c);
				
			}
			jsonData.put("rows", body);
			
			rsRs.close();
			pstmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.info("예외 처리 발생 : " + e.getMessage());
		}
		
		return jsonData.toJSONString();
	}
	
}
