<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language=javascript>	//���� �������� �ݰ� ���ΰ�ħ�� ���� ���� �Լ�
function refresh() {									//���ΰ�ħ�� ���� ��ũ��Ʈ
window.close();											//���� �������� ����
opener.location.href = "/YU235/main.jsp";			//main�������� ���ΰ�ħ�Ѵ�.
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

	<form action="/YU235/insert" method="post">					<%--insertServlet���� action form, post �޼ҵ带 ��� --%>
		<table border="1" width="300" height="150" align="center">		<%--���̺� Ư¡ �� �ֱ� --%>
			
			<tr>
				<td>�̸�</td>												<%--���̺� 2�� 1�� --%>
				<td><input type="text" name="name"></td>				<%--���̺� 2�� 2���� name�� �ޱ� --%>
			</tr>
			<tr>
				<td>����</td>												<%--���̺� 2�� 1�� --%>
				<td><input type="text" name="hori"></td>				<%--���̺� 2�� 2���� name�� �ޱ� --%>
			</tr>
			<tr>
				<td>����</td>												<%--���̺� 2�� 1�� --%>
				<td><input type="text" name="vert"></td>				<%--���̺� 2�� 2���� name�� �ޱ� --%>
			</tr>
		</table>
		<br> <br>														<%-- �ٹٲ� --%>


		<div align="center">											<%-- �߰��� ��ġ --%>

			<input type="submit" value="�߰��ϱ�" onClick='refresh();'>	<%-- �߰��ϱ� ��ư Ŭ���� refresh()�Լ��� ȣ���Ѵ�. --%>

		</div>
	</form>
</body>


</html>