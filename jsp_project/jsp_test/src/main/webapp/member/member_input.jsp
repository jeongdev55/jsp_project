<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, home.member.*"%>


<%	
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mbdto" class="home.member.MemberDTO" />
<jsp:setProperty property="*" name="mbdto"/>
<jsp:useBean id="mbdao" class="home.member.MemberDAO" />


<%	
		if (mbdto.getName()== null || mbdto.getName().trim().equals("")){
			response.sendRedirect("memberSsn.jsp");
			return;
		}

		int res = mbdao.insertMember(mbdto); 
		
		if (res>0){%>
			<script type="text/javascript">
				alert("ȸ����ϼ���!! �α����� �Ͻ� �� �̿��� �ּ���");
				self.close();
			</script>			
<%	}else{ %>
			<script type="text/javascript">
				alert("ȸ����Ͻ���!! �ٽ� �Է��� �ּ���");
				location.href="memberSsn.jsp";
			</script>
<%	} %>		

