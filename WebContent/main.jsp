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
	function ref() {//���� �������� �ݰ� �����ϱ�, �����ϱ� ��ư�� ������ ��� ���� �ش��ϴ� �������� �̵��ϸ� main�������� ���ΰ�ħ�� ���� ������� �Լ�
		opener.location.href = "/YU235/main.jsp";	//main.jsp�� ���ΰ�ħ�Ѵ�.

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
					<li><a href="detail.jsp">��ǰ����</a></li>
					<li><a href="main.jsp">û�� ����</a></li>
					<li><a href="people.jsp">������</a></li>
				</ul>
				<ul class="actions vertical">
					<li><a href="#" class="button fit">Login</a></li>
				</ul>
			</nav>

	<div>
		<br> <br>
		<%-- �ٹٲ� --%>
	</div>
	<div align="right">
			<input  type="button" value="�� ���" 
				<%-- ������ ��ư �߰� --%>
				<%-- ����߰� ��ư ���ý� insert.jsp �˾�â ���� --%>
				onclick="window.open('insert.jsp','����߰��ϱ�','width=400, height=400, menubar=no, status=no, toolbar=no');"><br>
	</div>
	<div>
		<hr><br> <br>
	</div>


	<%--���̺� ���� --%>
	<table id="employee" border="1" width="300"
		class="table table-bordered table-hover text-center">

		<thead>
			<tr>
				<th>��</th>
				<%-- ���̺��� ù �࿡ ���  --%>
				<th>���̸�</th>
				<%-- ���̺��� ù �࿡ �̸�  --%>
			</tr>
		</thead>
		<%
			//main�������� pk�� id�� �̸��� �����ϰ� ǥ�����ֱ� ���� DB�� �����Ͽ� employee���̺��� ��� ������ id�� ������������ ����Ѵ�.
			//select id, name from employee order by id;
			Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.

			//main.jsp�� db�� ���� �����ϸ� ������ ������ ����ϱ� ������ ĳ�ÿ� �÷��ΰ� ���� ���� ����.
			//���� statement�� �ƴ� preparedstatement�� ����Ѵ�.
			PreparedStatement stmt = null;

			try {
				String connect = new String("jdbc:oracle:thin:@localhost:1521:TestDB"); //"�ּ�:��Ʈ:DB��"
				String user = "system"; //username
				String passwd = "tiger"; //password

				Class.forName("oracle.jdbc.driver.OracleDriver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
				conn = DriverManager.getConnection(connect, user, passwd); // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
				String sql = "select id, name from yu235 order by id"; // sql ���� , id�� ������������ ��ü id�� name�� ����Ѵ�.
				stmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
				ResultSet rset = stmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.

				while (rset.next()) { // ����� �� �྿ ���ư��鼭 �����´�.
					String id = rset.getString("id"); //String�� id�� �����Ͽ� db�� id�Ӽ��� ���� �����´�.
					String name = rset.getString("name"); //String�� name�� �����Ͽ� db�� name�Ӽ��� ���� �����´�.
		%>
		<tbody>
			<tr>
				<td width="100"><%=id%></td>
				<%--������������ ���� db�������� ���� ���� id���� �� �߰� --%>
				<td width="100"><%=name%></td>
				<%--������������ ���� db�������� ���� ���� id�� name���� �� �߰� --%>
				<td width="10"><input type="submit" value="û�� ����"
					<%-- ��ü ������ ��� ��ư �߰� --%>
				<%-- ����߰� ��ư ���ý� insert.jsp �˾�â ���� --%>
				onclick="window.open('popup.jsp?id=' + <%=id%>, '�˸�', 'width=400, height=250, menubar=no, status=no, toolbar=no');">
					<input type="submit" value="û�� ����"
					<%-- ��ü ������ ��� ��ư �߰� --%>
				<%-- ����߰� ��ư ���ý� insert.jsp �˾�â ���� --%>
				onclick="window.open('reserve.jsp?id=' + <%=id%>, '����', 'width=400, height=350, menubar=no, status=no, toolbar=no');">
					<input type="submit" value="û�ҳ�������"
				onclick="window.open('log.jsp?id='+<%=id %>,'û�ҳ���','width=500, height=500, menubar=no, status=no, toolbar=no');">
				</td>
			</tr>
			<%
				}
					conn.close();
				} catch (Exception e) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
					e.printStackTrace();
					out.println("yu235 ���̺� ȣ�⿡ �����߽��ϴ�.");
				}
			%>

		</tbody>
	</table>

	<script>
		// ���̺��� Row Ŭ���� �� ��������
		$("#employee tr").dblclick(
						function() {
							// ���� Ŭ���� Row(<tr>)
							var tr = $(this);
							var td = tr.children();
							// �ݺ����� �̿��ؼ� �迭�� ���� ��� ����� �� �� �ִ�.

							// td.eq(index)�� ���� ���� ������ ���� �ִ�.
							var userId = td.eq(0).text();
							//var name = td.eq(1).text();

							//���� Ŭ���� ���õ� ���� id���� ��Ű�� select.jsp�������� ȣ���Ѵ�.
							window.open('select.jsp?id=' + userId, '��ȸ', 'width=400, height=400, menubar=no, status=no, toolbar=no');
						});

		
	</script>
	<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<h2>ã�� ���� ��</h2>
					<ul class="actions">
						<li><span class="icon fa-phone"></span> <a href="#">010-1234-5678</a></li>
						<li><span class="icon fa-envelope"></span> <a href="#">����@gmail.com</a></li>
						<li><span class="icon fa-map-marker"></span> �������б� IT�� 235ȣ</li>
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