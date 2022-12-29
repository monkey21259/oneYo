<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
</head>
<body>
	<div id="container" style="text-align:center;">
		<div id="temp" style="display:inline-block;">
			<table>
				<c:forEach items="${list}" var="rvo">
					<tr>
						<td>
							${rvo.rnum}
						</td>
						<td>
							${rvo.rsubject}
						</td>
						<td>
							<img src="/oneYo/img/recipe/${rvo.rphoto}">
						</td>
						<td>
							${rvo.mnum}
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>