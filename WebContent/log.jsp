<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
<%
		String userId = request.getParameter("id");	//main.jsp로 부터 온 id값을 읽는다.
%>
		<!-- Header -->
			<header id="header">
				<a href="index.jsp" class="logo">YU235</a>
			</header>

		
	<%--테이블 생성 --%>
	<table id="employee" border="1" width="300"
		class="table table-bordered table-hover text-center">

		<thead>
			<tr>
				<th>회차</th>
				<%-- 테이블의 첫 행에 사번  --%>
				<th>방넘버</th>
				<%-- 테이블의 첫 행에 이름  --%>
				<th>시작시간</th>
				<th>종료시간</th>
			</tr>
		</thead>

		<%
			//main페이지에 pk인 id와 이름을 간략하게 표시해주기 위해 DB에 접근하여 employee테이블의 모든 정보를 id의 오름차순으로 출력한다.
			//select id, name from employee order by id;
			Connection conn = null; // null로 초기화 한다.

			//main.jsp는 db를 자주 접근하며 동일한 쿼리를 사용하기 때문에 캐시에 올려두고 쓰는 것이 좋다.
			//따라서 statement가 아닌 preparedstatement를 사용한다.
			PreparedStatement stmt = null;

			try {
				String connect = new String("jdbc:oracle:thin:@localhost:1521:TestDB"); //"주소:포트:DB명"
				String user = "system"; //username
				String passwd = "tiger"; //password

				Class.forName("oracle.jdbc.driver.OracleDriver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
				conn = DriverManager.getConnection(connect, user, passwd); // DriverManager 객체로부터 Connection 객체를 얻어온다.
				String sql = "select * from list where id="+userId; // sql 쿼리 , id를 오름차순으로 전체 id와 name을 출력한다.
				stmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.
				ResultSet rset = stmt.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
				
				if(!rset.next()){%>
				<h3 align=center><%=userId%>번 방은 청소한 내역이 없습니다.</h3><br>
				<%}
				else{%>
				<h3 align=center><%=userId%>번 방의 청소 내역 입니다.</h3><br>
				<%}
				
				while (rset.next()) { // 결과를 한 행씩 돌아가면서 가져온다.
					String seq = rset.getString("seq"); //String형 id를 선언하여 db의 id속성의 값을 가져온다.
					String id = rset.getString("id"); //String형 name을 선언하여 db의 name속성의 값을 가져온다.
					String start = rset.getString("start_time"); //String형 name을 선언하여 db의 name속성의 값을 가져온다.
					String end = rset.getString("end_time"); //String형 name을 선언하여 db의 name속성의 값을 가져온다.

		%>
		<tbody>
			<tr>
				<td width="100"><%=seq%></td>
				<%--오름차순으로 나온 db데이터의 가장 작은 id부터 행 추가 --%>
				<td width="100"><%=id%></td>
				<%--오름차순으로 나온 db데이터의 가장 작은 id의 name부터 행 추가 --%>
				<td width="100"><%=start%></td>
				<td width="100"><%=end%></td>
			</tr>
			<%
				}
					conn.close();
				} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
					e.printStackTrace();
					out.println("yu235_2 테이블 호출에 실패했습니다.");
				}
			%>

		</tbody>
	</table>
	<div align="center">
			<input type="submit" value="확인"	 onClick="window.close();">							<%-- 확인 버튼 추가 --%>
	</div>
	

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>
</html>