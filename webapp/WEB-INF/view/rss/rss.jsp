<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 식품안전나라 RSS -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<c:import var="foodInfo" url="https://www.foodsafetykorea.go.kr/rss/rss.do?bbs_no=bbs001&menu_no=3120&menu_grp=MENU_NEW01"/>
<x:parse var="foodInfo" xml="${foodInfo}"></x:parse>
<ul>
    <x:forEach select="$foodInfo/rss/channel/item" begin="0" end="10">
        <li>
            <a href="https://www.foodsafetykorea.go.kr/<x:out select="./link"/>" target="_blank">
                <x:out select="./title"/>
            </a>
        </li>
    </x:forEach>
</ul>
</html>