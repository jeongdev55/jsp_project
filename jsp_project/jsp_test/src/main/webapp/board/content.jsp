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
	�� ���� ����
	<table border="1" width="80%">
		<tr>
		<th bgcolor="yellow" width="20%">�۹�ȣ</th>
		<td width="30%" align="center"><%=dto.getNum() %></td>
		<th bgcolor="yellow" width="20%">��ȸ��</th>
		<td width="30%" align="center"><%=dto.getReadcount() %></td>
		</tr>
		<tr>
		<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td width="30%" align="center"><%=dto.getWriter() %></td>
		<th bgcolor="yellow" width="20%">�ۼ���</th>
			<td width="30%" align="center"><%=dto.getReg_date() %></td>
		</tr>
		<tr>
		<th bgcolor="yellow" width="20%">������</th>
			<td colspan="3" width="30%" align="center"><%=dto.getSubject() %></td>
		</tr>
		<tr>
		<th bgcolor="yellow" width="20%">�۳���</th>
			<td colspan="3" width="30%" align="center"><%=dto.getContent() %></td>
		</tr>
		<tr bgcolor="yellow"  align="right">
		<td colspan="4">
		<input type="button" value="����" onclick=window.location="updateForm.jsp?num=<%=dto.getNum()%>">
		<input type="button" value="�� ����" onclick=window.location="deleteForm.jsp?num=<%=dto.getNum()%>">
		<input type="button" value="�� ���" onclick=window.location="list.jsp">
		</td>
		</tr>
		
	</table>
</div>

<%@ include file="../bottom.jsp"%>