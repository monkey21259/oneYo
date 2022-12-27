<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>oneYo(오내요)</title>
<script type="text/javascript">

	function levelupSelect(lvnum) {
		
		alert("levelupSelect() 함수 진입");
		console.log(lvnum);
		
		if(confirm("등업글을 확인하시겠습니까?")){
			location.href="#";
		}
	}

</script>
</head>
<body>
<div id="container" style="text-align:center;">
	<div id="levelup" style="display:inline-block;">
		<table style="border:1px solid black;">
			<thead style="border:1px solid black;">
				<tr>
					<th>
						글번호
					</th>
					<th>
						제목
					</th>
					<th>
						내용
					</th>
					<th>
						사진 대충
					</th>
					<th>
						등록일
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="lvvo">
					<tr>	
						<td>
							${lvvo.lvnum}
						</td>
						<td onclick="levelupSelect('${lvvo.lvnum}')">
							${lvvo.lvsubject}
						</td>
						<td onclick="levelupSelect('${lvvo.lvnum}')">
							${lvvo.lvcontent}
						</td>
						<td>
							<img src="/oneYo/img/levelup/${lvvo.lvphoto}" style="width:50px; height:50px;">
						</td>
						<td>
							${lvvo.insertdate}
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>