<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="home.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto"/>
<jsp:useBean id="mbdao" class="home.member.MemberDAO" />

<%
		if (mbdto.getNo()== 0){
			response.sendRedirect("memberAll.jsp");
			return;
		} 

		int res = mbdao.updateMember(mbdto); 		
		String msg = null;
		if (res>0){
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
		}else {
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="memberAll.jsp"
</script>







