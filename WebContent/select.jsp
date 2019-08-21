<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script language=javascript>	
	function btn_click(n) {//현재 페이지를 닫고 수정하기, 삭제하기 버튼을 눌렀을 경우 각각 해당하는 서블릿으로 이동하며 main페이지의 새로고침을 위해 만들어진 함수
		if (n == "modify") {	//수정하기 버튼이 선택되었을 경우
			frm1.action = "/YU235/update";	//수정하기 서블릿으로 이동하며
			setTimeout(function(){
			window.self.close();	//현재의 창을 닫고
				opener.location.href = "/YU235/main.jsp";	//main.jsp를 새로고침한다.
				 },10);
			
			
		} else {	//삭제하기 버튼이 선택되었을 경우
			frm1.action = "/YU235/delete";	//삭제하기 서블릿으로 이동하며
			setTimeout(function(){
			window.self.close();	//현재의 창을 닫고
				opener.location.href = "/YU235/main.jsp";	//main.jsp를 새로고침한다.
				 },10);
			
		}
	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />

</head>


<body>
		<!-- Header -->
			<header id="header">
				<a href="index.html" class="logo">YU235</a>
			</header>

	<%
		String userId = request.getParameter("id");	//main.jsp로 부터 온 id값을 읽는다.
		//값을 저장하기 위해서 name, sex, position, dept, sal을 선언 및 초기화한다.
		String name=null;
		String hori=null;
		String vert=null;
		
		//main페이지에 온 pk인 id를 기반으로 db에 접근하여 해당하는 id의 상세정보를 출력한다.
		//select name, sex, position,dept,sal from employee where id=" + userId;
		Connection conn = null; // null로 초기화 한다.

		//select.jsp는 db를 접근할 때 동일한 쿼리를 사용할 확률이 높기 때문에 캐시에 올려두고 쓰는 것이 좋다.
		//따라서 statement가 아닌 preparedstatement를 사용한다.
		PreparedStatement stmt = null;
		try {
			String connect = new String("jdbc:oracle:thin:@localhost:1521:TestDB");		//"주소:포트:DB명"
			String user = "system";														//username
			String passwd = "tiger";													//password
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			conn = DriverManager.getConnection(connect, user, passwd); // DriverManager 객체로부터 Connection 객체를 얻어온다.
			String sql = "select name, hori, vert from cleaning where id=" + userId; // sql 쿼리
			stmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.
			ResultSet rset = stmt.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
			
			while (rset.next()) { // 결과를 한 행씩 돌아가면서 가져온다.
			name=rset.getString("name");//String형 name에  db의 name속성의 값을 가져온다.
			hori=rset.getString("hori");//String형 name에  db의 name속성의 값을 가져온다.
			vert=rset.getString("vert");//String형 name에  db의 name속성의 값을 가져온다.
			}
			conn.close();
		} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
			e.printStackTrace();
			out.println("yu235 테이블 호출에 실패했습니다.");
		}
	%>
	<form name="frm1" method="POST"> 												<%--form을 선언, post 메소드를 사용 --%>
		<table border="1" width="300" height="150" align="center">
			<tr>
				<input type="hidden" name="userId" value=<%=userId %>>
				<td>id</td>															<%-- 1행 1열에 사번 --%>
				<td><%=userId%></td>		<%-- 1행 2열에 입력 받아온 userid를 표시 --%>
			</tr>
			<tr>
				<td>방이름</td>															<%-- 2행 1열에 이름 --%>
				<td><input type="text" name="name" value="<%=name%>"></td>			<%-- 2행 2열에 입력 받아온 name을 표시 --%>
			</tr>
			<tr>
				<td>가로</td>															<%-- 2행 1열에 이름 --%>
				<td><input type="text" name="hori" value="<%=hori%>"></td>			<%-- 2행 2열에 입력 받아온 name을 표시 --%>
			</tr>
			<tr>
				<td>세로</td>															<%-- 2행 1열에 이름 --%>
				<td><input type="text" name="vert" value="<%=vert%>"></td>			<%-- 2행 2열에 입력 받아온 name을 표시 --%>
			</tr>
		</table>
		<p align="right">
		<input type="submit" value="삭제하기" onClick='btn_click("delete");'>			<%--삭제하기 submit생성, 선택시 btn_click("delete")함수가 호출된다. --%>
		<input type="submit" value="수정하기" onClick='btn_click("modify");'>			<%--수정하기 submit생성, 선택시 btn_click("modify")함수가 호출된다. --%>
		</p>
			</form>
	<br>
	<br>
</body>
</html>