<%-- 백업의 진행 여부를 팝업창으로 알림 --%>


<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script language=javascript>	//현재 페이지를 닫고 새로고침을 위해 만든 함수
function refresh() {									//새로고침을 위한 스크립트
window.close();											//현재 페이지를 닫음
opener.location.href = "/YU235/main.jsp?id="+userId;			//main페이지를 새로고침한다.
}
</script>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>


<body>
<%
		String userId = request.getParameter("id");	//main.jsp로 부터 온 id값을 읽는다.
%>
<!-- Header -->
			<header id="header">
				<a href="index.html" class="logo">YU235</a>
			</header>

<div>
</div>
<div>
<h3 align=center><%=userId%>번 방의 청소예약를 진행하시겠습니까?</h3>
</div>
 <div>
 <form action="/YU235/reserve" method="post" align=center> 	
 	<table>	
				<tr><td>
				
				<select name="time">
				<option value="5m" selected="5m">5분 후</optiona>
				<option value="10m" >10분 후</option>
				<option value="15m" >15분 후</option>
				</select>
								
				</td></tr>		<%--테이블 3행 2열에 radio 두고 남자를 디폴트로 둔다. --%>

 				<input type="hidden" name="userId" value="<%=userId%>">
 							<%--form을 선언, post 메소드를 사용 --%><br><br><br><br>
	</table>
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