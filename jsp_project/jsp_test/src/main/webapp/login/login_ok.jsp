<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String saveId=request.getParameter("saveId");
%>
<jsp:useBean id="check"  class="home.login.LoginCheck"/>
<jsp:setProperty property="*"  name="check"/>

<%
		if (check.getId() == null || check.getId().trim().equals("")){
			response.sendRedirect("login.jsp");
			return;
		}
		String msg=null;
		String url="login.jsp";
		int res = check.loginCheck();
		if(res==check.OK){
			
			session.setAttribute("id",check.getId());
			Cookie loginCookie=new Cookie("saveId",check.getId());
			if(saveId !=null){
				loginCookie.setMaxAge(24*60*60);
			}else{
				loginCookie.setMaxAge(0);
			}
			response.addCookie(loginCookie);
			msg=check.getId()+"���� �α��� �Ǿ����ϴ�.";
			url=request.getContextPath()+"/index.jsp";
		}else if(res==check.NOT_ID){
			msg="���� ���̵� �Դϴ�. Ȯ�� �� �ٽ� �α��� ���ּ���";	
		}else if(res==check.NOT_PW){
			msg="��й�ȣ�� Ʋ�Ƚ��ϴ�. Ȯ�� �� �ٽ� �α��� ���ּ���.";
		}else if(res==check.ERROR){
			msg="�������� �߻��Դϴ�. �����ڿ��� �����ϼ���";	
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
