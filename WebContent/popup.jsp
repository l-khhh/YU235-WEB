<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />

<title>Insert title here</title>
<script language=javascript>	//���� �������� �ݰ� ���ΰ�ħ�� ���� ���� �Լ�
function refresh() {									//���ΰ�ħ�� ���� ��ũ��Ʈ
window.close();											//���� �������� ����
opener.location.href = "/YU235/main.jsp?id="+userId;			//main�������� ���ΰ�ħ�Ѵ�.
}
</script>
</head>


<body>
<%
		String userId = request.getParameter("id");	//main.jsp�� ���� �� id���� �д´�.
%>
<!-- Header -->
			<header id="header">
				<a href="index.jsp" class="logo">YU235</a>
			</header>

<div>
<table>
<tr><td>
<h3 align="center"><%=userId%>�� ���� û�Ҹ� �����Ͻðڽ��ϱ�?</h3>
</td></tr>
</table>
</div>
 <div>
 <form action="/YU235/start" method="post" align=center> 		
 				<input type="hidden" name="userId" value="<%=userId%>">
 							<%--form�� ����, post �޼ҵ带 ��� --%>
				<input type="submit" value="Ȯ��"	 onClick="refresh();">							<%-- Ȯ�� ��ư �߰� --%>
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