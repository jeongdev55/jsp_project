<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="../top.jsp"%>
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
	<form name="f" action="writePro.jsp" method="post" onsubmit="return check()">
	<table align="center" border="1" width="99%" height="90%">
	<tr bgcolor="yellow">
	<th colspan="2">글 쓰 기</th>
	</tr>
	
	 <tr>
	 	<th bgcolor="yellow">이름</th>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">제목</th>
		<td><input type="text" name="subject" ></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">이메일</th>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
	 	<th bgcolor="yellow">글내용</th>
		<td><textarea name="content" cols="70" rows="10"></textarea></td>
	</tr>
	 <tr>
	 	<th bgcolor="yellow">비밀번호</th>
		<td><input type="password" name="passwd"></td>
	</tr>
	 <tr>
	 	<td colspan="2" align="center">
	 		<input type="submit" value="글등록">
	 		<input type="reset" value="다시작성">
	 		<input type="button" value="글목록" onclick="location.href='list.jsp'">
	 		</td>	 	
	</tr>	
	
	</table>
</form>
</div>
<%@ include file="../bottom.jsp"%>