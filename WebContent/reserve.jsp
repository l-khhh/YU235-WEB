<%-- ����� ���� ���θ� �˾�â���� �˸� --%>


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
opener.location.href = "/YU235/main.jsp?id="+userId;			//main�������� ���ΰ�ħ�Ѵ�.
}
</script>

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

<div>
</div>
<div>
<h3 align=center><%=userId%>�� ���� û�ҿ��ฦ �����Ͻðڽ��ϱ�?</h3>
</div>
 <div>
 <form action="/YU235/reserve" method="post" align=center> 	
 	<table>	
				<tr><td>
				
				<select name="time">
				<option value="5m" selected="5m">5�� ��</optiona>
				<option value="10m" >10�� ��</option>
				<option value="15m" >15�� ��</option>
				</select>
								
				</td></tr>		<%--���̺� 3�� 2���� radio �ΰ� ���ڸ� ����Ʈ�� �д�. --%>

 				<input type="hidden" name="userId" value="<%=userId%>">
 							<%--form�� ����, post �޼ҵ带 ��� --%><br><br><br><br>
	</table>
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