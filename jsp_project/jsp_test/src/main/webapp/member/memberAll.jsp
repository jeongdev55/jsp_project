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
	<h2>회 원 찾 기</h2>
	<form name="f" method="post">
		<select name="search">
			<option value="id">아이디
			<option value="name">이름
			</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="찾기">
	</form>	
	<jsp:setProperty property="*" name="mbdao" />
<%	}else { %>
	<h2>회 원 목 록 보기</h2>
<%	} %>	
	<hr color="green" width="300">
	<table width="90%" class="outline">
		<tr  bgcolor="yellow">
			<th class="m3">이름</th>
			<th class="m3">아이디</th>
			<th class="m3">이메일</th>
			<th class="m3">전화번호</th>
			<th class="m3">가입일</th>
			<th class="m3">수정  |  삭제</th>
		</tr>
<%
		ArrayList<MemberDTO> memberList = null;
		if (cmd.equals("FIND")){
			memberList = mbdao.findMember();
		}else {memberList = mbdao.listMember();
		}
		
		if (memberList==null || memberList.size()==0){%>
		<tr> 
			<td colspan="7">등록된 회원이 없습니다.</td>
		</tr>		
<%	}else {
			for(MemberDTO dto : memberList){%>
		<tr>
			<td ><%=dto.getName()%></td>
			<td ><%=dto.getId()%></td>
			<td ><%=dto.getEmail()%></td>
			<td ><%=dto.getAllHp()%></td>
			<td ><%=dto.getJoindate()%></td>
			<td ><a href="member_update.jsp?no=<%=dto.getNo() %>">수정</a>| 
			<td><a href="member_delete.jsp?no=<%=dto.getNo() %>">삭제</a></td>
		</tr>	
<%		}
		}%>		
	</table>
</div>	
<%@ include file="../bottom.jsp"%>