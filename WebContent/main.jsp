<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />

<title></title>

<!-- jQuery  -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- bootstrap CSS -->
<link	href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<head>
		<title>Intensify by TEMPLATED</title>
		<meta charset="EUC-KR" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	
	<script language=javascript>	
	function ref() {//현재 페이지를 닫고 수정하기, 삭제하기 버튼을 눌렀을 경우 각각 해당하는 서블릿으로 이동하며 main페이지의 새로고침을 위해 만들어진 함수
		opener.location.href = "/YU235/main.jsp";	//main.jsp를 새로고침한다.

	}
</script>

</head>


<body>

		<!-- Header -->
			<header id="header">
				<nav class="left">
					<a href="#menu"><span>Menu</span></a>
				</nav>
				<a href="index.jsp" class="logo">YU235</a>
			</header>

		<!-- Menu -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="detail.jsp">제품설명서</a></li>
					<li><a href="main.jsp">청소 시작</a></li>
					<li><a href="people.jsp">제작자</a></li>
				</ul>
				<ul class="actions vertical">
					<li><a href="#" class="button fit">Login</a></li>
				</ul>
			</nav>

	<div>
		<br> <br>
		<%-- 줄바꿈 --%>
	</div>
	<div align="right">
			<input  type="button" value="방 등록" 
				<%-- 사원등록 버튼 추가 --%>
				<%-- 사원추가 버튼 선택시 insert.jsp 팝업창 열기 --%>
				onclick="window.open('insert.jsp','사원추가하기','width=400, height=400, menubar=no, status=no, toolbar=no');"><br>
	</div>
	<div>
		<hr><br> <br>
	</div>


	<%--테이블 생성 --%>
	<table id="employee" border="1" width="300"
		class="table table-bordered table-hover text-center">

		<thead>
			<tr>
				<th>방</th>
				<%-- 테이블의 첫 행에 사번  --%>
				<th>방이름</th>
				<%-- 테이블의 첫 행에 이름  --%>
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
				String sql = "select id, name from yu235 order by id"; // sql 쿼리 , id를 오름차순으로 전체 id와 name을 출력한다.
				stmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.
				ResultSet rset = stmt.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

				while (rset.next()) { // 결과를 한 행씩 돌아가면서 가져온다.
					String id = rset.getString("id"); //String형 id를 선언하여 db의 id속성의 값을 가져온다.
					String name = rset.getString("name"); //String형 name을 선언하여 db의 name속성의 값을 가져온다.
		%>
		<tbody>
			<tr>
				<td width="100"><%=id%></td>
				<%--오름차순으로 나온 db데이터의 가장 작은 id부터 행 추가 --%>
				<td width="100"><%=name%></td>
				<%--오름차순으로 나온 db데이터의 가장 작은 id의 name부터 행 추가 --%>
				<td width="10"><input type="submit" value="청소 시작"
					<%-- 전체 데이터 백업 버튼 추가 --%>
				<%-- 사원추가 버튼 선택시 insert.jsp 팝업창 열기 --%>
				onclick="window.open('popup.jsp?id=' + <%=id%>, '알림', 'width=400, height=250, menubar=no, status=no, toolbar=no');">
					<input type="submit" value="청소 예약"
					<%-- 전체 데이터 백업 버튼 추가 --%>
				<%-- 사원추가 버튼 선택시 insert.jsp 팝업창 열기 --%>
				onclick="window.open('reserve.jsp?id=' + <%=id%>, '예약', 'width=400, height=350, menubar=no, status=no, toolbar=no');">
					<input type="submit" value="청소내역보기"
				onclick="window.open('log.jsp?id='+<%=id %>,'청소내역','width=500, height=500, menubar=no, status=no, toolbar=no');">
				</td>
			</tr>
			<%
				}
					conn.close();
				} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
					e.printStackTrace();
					out.println("yu235 테이블 호출에 실패했습니다.");
				}
			%>

		</tbody>
	</table>

	<script>
		// 테이블의 Row 클릭시 값 가져오기
		$("#employee tr").dblclick(
						function() {
							// 현재 클릭된 Row(<tr>)
							var tr = $(this);
							var td = tr.children();
							// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.

							// td.eq(index)를 통해 값을 가져올 수도 있다.
							var userId = td.eq(0).text();
							//var name = td.eq(1).text();

							//더블 클릭시 선택된 행의 id값을 주키로 select.jsp페이지를 호출한다.
							window.open('select.jsp?id=' + userId, '조회', 'width=400, height=400, menubar=no, status=no, toolbar=no');
						});

		
	</script>
	<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<h2>찾아 오는 곳</h2>
					<ul class="actions">
						<li><span class="icon fa-phone"></span> <a href="#">010-1234-5678</a></li>
						<li><span class="icon fa-envelope"></span> <a href="#">하이@gmail.com</a></li>
						<li><span class="icon fa-map-marker"></span> 영남대학교 IT관 235호</li>
					</ul>
				</div>
				<div class="copyright">
					&copy; Untitled. Design <a href="https://templated.co">TEMPLATED</a>. Images <a href="https://unsplash.com">Unsplash</a>.
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			
	
</body>
</html>