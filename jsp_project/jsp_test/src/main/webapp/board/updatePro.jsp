<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="home.board.*"%>
<jsp:useBean id="dto" class="home.board.BoardDBBean"  />
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="home.board.BoardDataBean"  />

<%
		if (dto.getWriter()==null || dto.getWriter().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		dto.setIp(request.getRemoteAddr());
		
		int res =0;
		res= dao.updateBoard(dto);
		String msg = null, url = null;
		if (res>0){
			msg = "�Խñ� ��������!";
			url = "list.jsp";
		}else {
			msg = "�Խñ� ���� ����!";
			url = "updateForm.jsp?num="+dto.getNum();
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
