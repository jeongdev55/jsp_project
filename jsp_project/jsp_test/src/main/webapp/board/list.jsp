<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, home.board.*"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<jsp:useBean id="bdao" class="home.board.BoardDataBean" />

<div align="center">
		글 목 록
		<table border="0" width="99%">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm.jsp">글쓰기</a></td>
			</table>
			
		<table border="0" width="99%"  >			
		<tr  bgcolor="green" >
			<th >번호</th>
			<th width="40%">제목</th>
			<th >작성자</th>
			<th >작성일</th>
			<th >조회</th>
			<th>IP</th>
		</tr>		
<%     

			ArrayList<BoardDBBean> boardList = bdao.listBoard();
			if(boardList==null || boardList.size()==0){%>
			<tr>
				<td colspan="6">등록된 게시글이 없습니다.</td>
				
<%}else{
				for(BoardDBBean dto: boardList){%>
		<tr align="center">
			<td><%=dto.getNum() %></td>
			<td><a href="content.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject() %></a></td>
			<td><%=dto.getWriter() %></td>
			<td><%=dto.getReg_date() %></td>
			<td><%=dto.getReadcount() %></td>
			<td><%=dto.getIp() %></td>
		</tr>
	<%  } 
	          }             %>
		</table>
</div>
<%@ include file="../bottom.jsp"%>