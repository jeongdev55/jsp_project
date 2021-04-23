<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="home.board.*"%>
<jsp:useBean id="dao" class="home.board.BoardDataBean"/>
<%
		String snum=request.getParameter("num");
		String passwd=request.getParameter("passwd");
		
		if(snum==null || snum.trim().equals("")
				||passwd==null || passwd.trim().equals("") ){
			response.sendRedirect("list.jsp");
			return;
		}
		int res=dao.deleteBoard(Integer.parseInt(snum),passwd);
		if(res>0){%>
		<script type="text/javascript">
			alert("게시글 삭제 성공")
			location.href="list.jsp"
		</script>
<%}else{%>
		<script type="text/javascript">
			alert("게시글 삭제 성공")
			location.href="deleteForm.jsp?num=<%=snum%>"
		</script>
<%}%>