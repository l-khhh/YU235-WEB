<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language=javascript>	
	function btn_click(n) {//���� �������� �ݰ� �����ϱ�, �����ϱ� ��ư�� ������ ��� ���� �ش��ϴ� �������� �̵��ϸ� main�������� ���ΰ�ħ�� ���� ������� �Լ�
		if (n == "modify") {	//�����ϱ� ��ư�� ���õǾ��� ���
			frm1.action = "/YU235/update";	//�����ϱ� �������� �̵��ϸ�
			window.self.close();	//������ â�� �ݰ�
			opener.location.href = "/YU235/main.jsp";	//main.jsp�� ���ΰ�ħ�Ѵ�.
		} else {	//�����ϱ� ��ư�� ���õǾ��� ���
			frm1.action = "/YU235/delete";	//�����ϱ� �������� �̵��ϸ�
			window.self.close();	//������ â�� �ݰ�
			opener.location.href = "/YU235/main.jsp";	//main.jsp�� ���ΰ�ħ�Ѵ�.
		}
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

	<%
		String userId = request.getParameter("id");	//main.jsp�� ���� �� id���� �д´�.
		//���� �����ϱ� ���ؼ� name, sex, position, dept, sal�� ���� �� �ʱ�ȭ�Ѵ�.
		String name=null;
		String hori=null;
		String vert=null;
		
		//main�������� �� pk�� id�� ������� db�� �����Ͽ� �ش��ϴ� id�� �������� ����Ѵ�.
		//select name, sex, position,dept,sal from employee where id=" + userId;
		Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.

		//select.jsp�� db�� ������ �� ������ ������ ����� Ȯ���� ���� ������ ĳ�ÿ� �÷��ΰ� ���� ���� ����.
		//���� statement�� �ƴ� preparedstatement�� ����Ѵ�.
		PreparedStatement stmt = null;
		try {
			String connect = new String("jdbc:oracle:thin:@localhost:1521:TestDB");		//"�ּ�:��Ʈ:DB��"
			String user = "system";														//username
			String passwd = "tiger";													//password
			Class.forName("oracle.jdbc.driver.OracleDriver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
			conn = DriverManager.getConnection(connect, user, passwd); // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
			String sql = "select name, hori, vert from yu235 where id=" + userId; // sql ����
			stmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
			ResultSet rset = stmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
			
			while (rset.next()) { // ����� �� �྿ ���ư��鼭 �����´�.
			name=rset.getString("name");//String�� name��  db�� name�Ӽ��� ���� �����´�.
			hori=rset.getString("hori");//String�� name��  db�� name�Ӽ��� ���� �����´�.
			vert=rset.getString("vert");//String�� name��  db�� name�Ӽ��� ���� �����´�.
			}
			conn.close();
		} catch (Exception e) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
			e.printStackTrace();
			out.println("yu235 ���̺� ȣ�⿡ �����߽��ϴ�.");
		}
	%>
	<form name="frm1" method="POST"> 												<%--form�� ����, post �޼ҵ带 ��� --%>
		<table border="1" width="300" height="150" align="center">
			<tr>
				<input type="hidden" name="userId" value=<%=userId %>>
				<td>id</td>															<%-- 1�� 1���� ��� --%>
				<td><%=userId%></td>		<%-- 1�� 2���� �Է� �޾ƿ� userid�� ǥ�� --%>
			</tr>
			<tr>
				<td>���̸�</td>															<%-- 2�� 1���� �̸� --%>
				<td><input type="text" name="name" value="<%=name%>"></td>			<%-- 2�� 2���� �Է� �޾ƿ� name�� ǥ�� --%>
			</tr>
			<tr>
				<td>����</td>															<%-- 2�� 1���� �̸� --%>
				<td><input type="text" name="hori" value="<%=hori%>"></td>			<%-- 2�� 2���� �Է� �޾ƿ� name�� ǥ�� --%>
			</tr>
			<tr>
				<td>����</td>															<%-- 2�� 1���� �̸� --%>
				<td><input type="text" name="vert" value="<%=vert%>"></td>			<%-- 2�� 2���� �Է� �޾ƿ� name�� ǥ�� --%>
			</tr>
		</table>
		<p align="right">
		<input type="submit" value="�����ϱ�" onClick='btn_click("delete");'>			<%--�����ϱ� submit����, ���ý� btn_click("delete")�Լ��� ȣ��ȴ�. --%>
		<input type="submit" value="�����ϱ�" onClick='btn_click("modify");'>			<%--�����ϱ� submit����, ���ý� btn_click("modify")�Լ��� ȣ��ȴ�. --%>
		</p>
			</form>
	<br>
	<br>
</body>
</html>