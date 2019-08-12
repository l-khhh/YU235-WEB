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
		String userId = request.getParameter("id");	//main.jsp�� ���� �� id���� �д´�.
%>
		<!-- Header -->
			<header id="header">
				<a href="index.jsp" class="logo">YU235</a>
			</header>

		
	<%--���̺� ���� --%>
	<table id="employee" border="1" width="300"
		class="table table-bordered table-hover text-center">

		<thead>
			<tr>
				<th>ȸ��</th>
				<%-- ���̺��� ù �࿡ ���  --%>
				<th>��ѹ�</th>
				<%-- ���̺��� ù �࿡ �̸�  --%>
				<th>���۽ð�</th>
				<th>����ð�</th>
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
				String sql = "select * from list where id="+userId; // sql ���� , id�� ������������ ��ü id�� name�� ����Ѵ�.
				stmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
				ResultSet rset = stmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
				
				if(!rset.next()){%>
				<h3 align=center><%=userId%>�� ���� û���� ������ �����ϴ�.</h3><br>
				<%}
				else{%>
				<h3 align=center><%=userId%>�� ���� û�� ���� �Դϴ�.</h3><br>
				<%}
				
				while (rset.next()) { // ����� �� �྿ ���ư��鼭 �����´�.
					String seq = rset.getString("seq"); //String�� id�� �����Ͽ� db�� id�Ӽ��� ���� �����´�.
					String id = rset.getString("id"); //String�� name�� �����Ͽ� db�� name�Ӽ��� ���� �����´�.
					String start = rset.getString("start_time"); //String�� name�� �����Ͽ� db�� name�Ӽ��� ���� �����´�.
					String end = rset.getString("end_time"); //String�� name�� �����Ͽ� db�� name�Ӽ��� ���� �����´�.

		%>
		<tbody>
			<tr>
				<td width="100"><%=seq%></td>
				<%--������������ ���� db�������� ���� ���� id���� �� �߰� --%>
				<td width="100"><%=id%></td>
				<%--������������ ���� db�������� ���� ���� id�� name���� �� �߰� --%>
				<td width="100"><%=start%></td>
				<td width="100"><%=end%></td>
			</tr>
			<%
				}
					conn.close();
				} catch (Exception e) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
					e.printStackTrace();
					out.println("yu235_2 ���̺� ȣ�⿡ �����߽��ϴ�.");
				}
			%>

		</tbody>
	</table>
	<div align="center">
			<input type="submit" value="Ȯ��"	 onClick="window.close();">							<%-- Ȯ�� ��ư �߰� --%>
	</div>
	

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

</body>
</html>