<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="home.board.*"%>
    <%@ include file="../top.jsp"%>
<jsp:useBean id="dao" class="home.board.BoardDataBean" />
<% String snum=request.getParameter("num");
		if(snum==null || snum.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
			}
			
			BoardDBBean dto=dao.getBoard("update",Integer.parseInt(snum));
			%>
<script type="text/javascript">
		function check(){
			if(f.writer.value==""){
				alert("�̸��� �Է��ϼ���");
				f.writer.focus();
				return false;
			}
			if(f.subject.value==""){
				alert("������ �Է��ϼ���");
				f.subject.focus();
				return false;
			}
			if(f.content.value==""){
				alert("�� ������ �Է��ϼ���");
				f.content.focus();
				return false;
			}
			if(f.passwd.value==""){
				alert("��й�ȣ�� �Է��ϼ���");
				f.passwd.focus();
				return false;
			}
			return true;
		}
</script>

<div align="center">
	<form name="f" action="updatePro.jsp" method="post" onsubmit="return check()">
	<input type="hidden" name="num" value="<%=snum %>">
	<table align="center" border="1" width="99%" height="90%">
	<tr bgcolor="yellow">
	<th colspan="2">�� ����</th>
	</tr>
	
	 <tr>
	 	<th bgcolor="yellow">�̸�</th>
		<td><input type="text" name="writer" value="<%=dto.getWriter()%>"></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">����</th>
		<td><input type="text" name="subject" value="<%=dto.getSubject()%>" ></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">�̸���</th>
		<td><input type="text" name="email" value="<%=dto.getEmail()%>"></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">�۳���</th>
		<td><textarea name="content" cols="70" rows="10" ><%=dto.getContent()%></textarea></td>
	</tr>
	 <tr>
	 	<th bgcolor="yellow">��й�ȣ</th>
		<td><input type="password" name="passwd" ></td>
	</tr>
	 <tr>
	 	<td colspan="2" align="center">
	 		<input type="submit" value="�����ϱ�">
	 		<input type="reset" value="�ٽ��ۼ�">
	 		<input type="button" value="�۸��" onclick="location.href='list.jsp'">
	 		</td>	 	
	</tr>	
	
	</table>
</form>
</div>
<%@ include file="../bottom.jsp"%>