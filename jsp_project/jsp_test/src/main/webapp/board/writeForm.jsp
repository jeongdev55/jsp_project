<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="../top.jsp"%>
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
	<form name="f" action="writePro.jsp" method="post" onsubmit="return check()">
	<table align="center" border="1" width="99%" height="90%">
	<tr bgcolor="yellow">
	<th colspan="2">�� �� ��</th>
	</tr>
	
	 <tr>
	 	<th bgcolor="yellow">�̸�</th>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">����</th>
		<td><input type="text" name="subject" ></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">�̸���</th>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">�۳���</th>
		<td><textarea name="content" cols="70" rows="10"></textarea></td>
	</tr>
	 <tr>
	 	<th bgcolor="yellow">��й�ȣ</th>
		<td><input type="password" name="passwd"></td>
	</tr>
	 <tr>
	 	<td colspan="2" align="center">
	 		<input type="submit" value="�۵��">
	 		<input type="reset" value="�ٽ��ۼ�">
	 		<input type="button" value="�۸��" onclick="location.href='list.jsp'">
	 		</td>	 	
	</tr>	
	
	</table>
</form>
</div>
<%@ include file="../bottom.jsp"%>