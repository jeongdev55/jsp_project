<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>�����̰� ���� Ȩ������</title>
	 <link rel="stylesheet" type="text/css" href="style.css">
	 <script type="text/javascript">
	 	function openMember(){
	 			window.open("<%=request.getContextPath() %>/member/memberSsn.jsp","member","width=650,height=400")
	 	}
	 
	 </script>
</head>
<body>
	<%
			boolean isLogin=false;
			String loginId=(String)session.getAttribute("id");
			if(loginId!=null && !(loginId.trim().equals(""))){
				isLogin=true;
			}
				
	%>
	<div align="center">
		<table border="1" width="800" height="600">
			<tr height="10%">
				<td colspan="2" align="center"> 
					<a href="<%=request.getContextPath() %>/index.jsp"> main</a> |
					<%if(isLogin){ %>
					<a href="<%=request.getContextPath() %>/login/logout.jsp"> �α׾ƿ�</a> |
					<%}else{ %>					
					<a href="<%=request.getContextPath() %>/login/login.jsp"> �α���</a> |
					<%} %>
					 <a href="javascript:openMember()">ȸ������ </a> |
					 <a href="<%=request.getContextPath() %>/member/memberAll.jsp">ȸ������</a> |
					 <a href="<%=request.getContextPath() %>/member/memberAll.jsp?cmd=FIND">ȸ��ã��</a>|
					 <a href="<%=request.getContextPath() %>/board/list.jsp">�Խ��� </a> |
					 <a href="<%=request.getContextPath() %>/company.jsp">ȸ��Ұ�</a>
			</tr> 
			<tr>
				<td width="20%">
						����޴�
				</td>
				<td>