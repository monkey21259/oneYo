<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<%= request.getAttribute("mnum") %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		alert("chefIntroduce.jsp 페이지 jQuery ready() 함수 진입");
		console.log("chefIntroduce.jsp 페이지 jQuery ready() 함수 진입");

			$.ajax({
				type:'GET',
				url: '/oneYo/mem/<%= request.getParameter("mnum") %>.ict',
				dataType : 'text',
				success : function(result) {
					console.log(result);
					alert(result);
				}
			}); //$.ajax()
		
	});

</script>
</head>
<body>

</body>
</html>