<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>해정이가 만든 홈페이지</title>
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
					<a href="<%=request.getContextPath() %>/login/logout.jsp"> 로그아웃</a> |
					<%}else{ %>					
					<a href="<%=request.getContextPath() %>/login/login.jsp"> 로그인</a> |
					<%} %>
					 <a href="javascript:openMember()">회원가입 </a> |
					 <a href="<%=request.getContextPath() %>/member/memberAll.jsp">회원보기</a> |
					 <a href="<%=request.getContextPath() %>/member/memberAll.jsp?cmd=FIND">회원찾기</a>|
					 <a href="<%=request.getContextPath() %>/board/list.jsp">게시판 </a> |
					 <a href="<%=request.getContextPath() %>/company.jsp">회사소개</a>
			</tr> 
			<tr>
				<td width="20%">
						서브메뉴
				</td>
				<td>