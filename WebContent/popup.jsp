<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />

<title>Insert title here</title>
<script language=javascript>	//현재 페이지를 닫고 새로고침을 위해 만든 함수
function refresh() {									//새로고침을 위한 스크립트
window.close();											//현재 페이지를 닫음
opener.location.href = "/YU235/main.jsp?id="+userId;			//main페이지를 새로고침한다.
}
</script>
</head>


<body>
<%
		String userId = request.getParameter("id");	//main.jsp로 부터 온 id값을 읽는다.
%>
<!-- Header -->
			<header id="header">
				<a href="inde.html" class="logo">YU235</a>
			</header>

<div>
<table>
<tr><td>
<h3 align="center"><%=userId%>번 방의 청소를 진행하시겠습니까?</h3>
</td></tr>
</table>
</div>
 <div>
 <form action="/YU235/start" method="post" align=center> 		
 				<input type="hidden" name="userId" value="<%=userId%>">
 							<%--form을 선언, post 메소드를 사용 --%>
				<input type="submit" value="확인"	 onClick="refresh();">							<%-- 확인 버튼 추가 --%>
</form>
</div>

<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>
</html>