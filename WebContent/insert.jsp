<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language=javascript>	//현재 페이지를 닫고 새로고침을 위해 만든 함수
function refresh() {									//새로고침을 위한 스크립트
window.close();											//현재 페이지를 닫음
opener.location.href = "/YU235/main.jsp";			//main페이지를 새로고침한다.
}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />

</head>


<body>
	<!-- Header -->
			<header id="header">
				<a href="index.jsp" class="logo">YU235</a>
			</header>

	<form action="/YU235/insert" method="post">					<%--insertServlet으로 action form, post 메소드를 사용 --%>
		<table border="1" width="300" height="150" align="center">		<%--테이블 특징 값 주기 --%>
			
			<tr>
				<td>이름</td>												<%--테이블 2행 1열 --%>
				<td><input type="text" name="name"></td>				<%--테이블 2행 2열에 name값 받기 --%>
			</tr>
			<tr>
				<td>가로</td>												<%--테이블 2행 1열 --%>
				<td><input type="text" name="hori"></td>				<%--테이블 2행 2열에 name값 받기 --%>
			</tr>
			<tr>
				<td>세로</td>												<%--테이블 2행 1열 --%>
				<td><input type="text" name="vert"></td>				<%--테이블 2행 2열에 name값 받기 --%>
			</tr>
		</table>
		<br> <br>														<%-- 줄바꿈 --%>


		<div align="center">											<%-- 중간에 위치 --%>

			<input type="submit" value="추가하기" onClick='refresh();'>	<%-- 추가하기 버튼 클릭시 refresh()함수를 호출한다. --%>

		</div>
	</form>
</body>


</html>