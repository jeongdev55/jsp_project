<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
		request.setCharacterEncoding("EUC-KR");
%>
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
		try{
			res= dao.insertBoard(dto);
		}catch(Exception e){
			System.out.println("message = "+e.getMessage());
		}
		
		String msg = null, url = null;
		if (res>0){
			msg = "글등록 성공!! 글목록페이지로 이동합니다.";
			url = "list.jsp";
		}else {
			msg = "글등록 실패!! 글등록페이지로 이동합니다.";
			url = "writeForm.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
