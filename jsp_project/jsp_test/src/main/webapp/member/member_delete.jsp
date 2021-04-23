<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- member_delete.jsp -->
<jsp:useBean id="mbdao" class="home.member.MemberDAO" />

<%
		String no = request.getParameter("no");
		if (no == null || no.trim().equals("")){
			response.sendRedirect("memberAll.jsp");
			return;
		}
		
		int res = mbdao.deleteMember(Integer.parseInt(no));
		String msg = null;
		if (res>0){
			msg = "회원삭제성공!! 회원목록페이지로 이동합니다.";
		}else {
			msg = "회원삭제실패!! 회원목록페이지로 이동합니다.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="memberAll.jsp"
</script>








