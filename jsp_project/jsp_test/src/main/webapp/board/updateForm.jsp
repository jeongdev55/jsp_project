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
				alert("이름을 입력하세요");
				f.writer.focus();
				return false;
			}
			if(f.subject.value==""){
				alert("제목을 입력하세요");
				f.subject.focus();
				return false;
			}
			if(f.content.value==""){
				alert("글 내용을 입력하세요");
				f.content.focus();
				return false;
			}
			if(f.passwd.value==""){
				alert("비밀번호를 입력하세요");
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
	<th colspan="2">글 수정</th>
	</tr>
	
	 <tr>
	 	<th bgcolor="yellow">이름</th>
		<td><input type="text" name="writer" value="<%=dto.getWriter()%>"></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">제목</th>
		<td><input type="text" name="subject" value="<%=dto.getSubject()%>" ></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">이메일</th>
		<td><input type="text" name="email" value="<%=dto.getEmail()%>"></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">글내용</th>
		<td><textarea name="content" cols="70" rows="10" ><%=dto.getContent()%></textarea></td>
	</tr>
	 <tr>
	 	<th bgcolor="yellow">비밀번호</th>
		<td><input type="password" name="passwd" ></td>
	</tr>
	 <tr>
	 	<td colspan="2" align="center">
	 		<input type="submit" value="수정하기">
	 		<input type="reset" value="다시작성">
	 		<input type="button" value="글목록" onclick="location.href='list.jsp'">
	 		</td>	 	
	</tr>	
	
	</table>
</form>
</div>
<%@ include file="../bottom.jsp"%>