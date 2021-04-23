<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="home.board.*"%>
<%@ include file="../top.jsp"%>
 <link rel="stylesheet" type="text/css" href="../style.css">
<jsp:useBean id="dao" class="home.board.BoardDataBean" />
<% String snum=request.getParameter("num");
		if(snum==null || snum.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
			}
			
			BoardDBBean dto=dao.getBoard("content",Integer.parseInt(snum));
			%>

<div align="center">
	글 내용 보기
	<table border="1" width="80%">
		<tr>
		<th bgcolor="yellow" width="20%">글번호</th>
		<td width="30%" align="center"><%=dto.getNum() %></td>
		<th bgcolor="yellow" width="20%">조회수</th>
		<td width="30%" align="center"><%=dto.getReadcount() %></td>
		</tr>
		<tr>
		<th bgcolor="yellow" width="20%">작성자</th>
			<td width="30%" align="center"><%=dto.getWriter() %></td>
		<th bgcolor="yellow" width="20%">작성일</th>
			<td width="30%" align="center"><%=dto.getReg_date() %></td>
		</tr>
		<tr>
		<th bgcolor="yellow" width="20%">글제목</th>
			<td colspan="3" width="30%" align="center"><%=dto.getSubject() %></td>
		</tr>
		<tr>
		<th bgcolor="yellow" width="20%">글내용</th>
			<td colspan="3" width="30%" align="center"><%=dto.getContent() %></td>
		</tr>
		<tr bgcolor="yellow"  align="right">
		<td colspan="4">
		<input type="button" value="수정" onclick=window.location="updateForm.jsp?num=<%=dto.getNum()%>">
		<input type="button" value="글 삭제" onclick=window.location="deleteForm.jsp?num=<%=dto.getNum()%>">
		<input type="button" value="글 목록" onclick=window.location="list.jsp">
		</td>
		</tr>
		
	</table>
</div>

<%@ include file="../bottom.jsp"%>