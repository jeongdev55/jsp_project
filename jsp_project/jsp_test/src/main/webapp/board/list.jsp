<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, home.board.*"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<jsp:useBean id="bdao" class="home.board.BoardDataBean" />

<div align="center">
		�� �� ��
		<table border="0" width="99%">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm.jsp">�۾���</a></td>
			</table>
			
		<table border="0" width="99%"  >			
		<tr  bgcolor="green" >
			<th >��ȣ</th>
			<th width="40%">����</th>
			<th >�ۼ���</th>
			<th >�ۼ���</th>
			<th >��ȸ</th>
			<th>IP</th>
		</tr>		
<%     

			ArrayList<BoardDBBean> boardList = bdao.listBoard();
			if(boardList==null || boardList.size()==0){%>
			<tr>
				<td colspan="6">��ϵ� �Խñ��� �����ϴ�.</td>
				
<%}else{
				for(BoardDBBean dto: boardList){%>
		<tr align="center">
			<td><%=dto.getNum() %></td>
			<td><a href="content.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject() %></a></td>
			<td><%=dto.getWriter() %></td>
			<td><%=dto.getReg_date() %></td>
			<td><%=dto.getReadcount() %></td>
			<td><%=dto.getIp() %></td>
		</tr>
	<%  } 
	          }             %>
		</table>
</div>
<%@ include file="../bottom.jsp"%>