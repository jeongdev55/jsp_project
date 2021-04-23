<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, home.member.*"%>
<%@ include file="../top.jsp"%>
<jsp:useBean id="mbdao" class="home.member.MemberDAO" />
<link rel="stylesheet" type="text/css" href="../style.css">

<%
		request.setCharacterEncoding("EUC-KR");
		String cmd = request.getParameter("cmd");
		if (cmd==null || cmd.trim().equals("")){
			cmd = "ALL";
		}%>
<div align="center">
	<hr color="green" width="300">
<%	if (cmd.equals("FIND")){ %>	
	<h2>ȸ �� ã ��</h2>
	<form name="f" method="post">
		<select name="search">
			<option value="id">���̵�
			<option value="name">�̸�
			</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="ã��">
	</form>	
	<jsp:setProperty property="*" name="mbdao" />
<%	}else { %>
	<h2>ȸ �� �� �� ����</h2>
<%	} %>	
	<hr color="green" width="300">
	<table width="90%" class="outline">
		<tr  bgcolor="yellow">
			<th class="m3">�̸�</th>
			<th class="m3">���̵�</th>
			<th class="m3">�̸���</th>
			<th class="m3">��ȭ��ȣ</th>
			<th class="m3">������</th>
			<th class="m3">����  |  ����</th>
		</tr>
<%
		ArrayList<MemberDTO> memberList = null;
		if (cmd.equals("FIND")){
			memberList = mbdao.findMember();
		}else {memberList = mbdao.listMember();
		}
		
		if (memberList==null || memberList.size()==0){%>
		<tr> 
			<td colspan="7">��ϵ� ȸ���� �����ϴ�.</td>
		</tr>		
<%	}else {
			for(MemberDTO dto : memberList){%>
		<tr>
			<td ><%=dto.getName()%></td>
			<td ><%=dto.getId()%></td>
			<td ><%=dto.getEmail()%></td>
			<td ><%=dto.getAllHp()%></td>
			<td ><%=dto.getJoindate()%></td>
			<td ><a href="member_update.jsp?no=<%=dto.getNo() %>">����</a>| 
			<td><a href="member_delete.jsp?no=<%=dto.getNo() %>">����</a></td>
		</tr>	
<%		}
		}%>		
	</table>
</div>	
<%@ include file="../bottom.jsp"%>